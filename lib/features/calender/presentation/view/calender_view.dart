import 'dart:convert';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../config/constants/size/app_size.dart';
import '../../../../core/common/app_components/app_button.dart';
import '../../../../core/connections/api/dio_service.dart';
import '../../../../di/main_di.dart';
import '../../../appointment/presentation/widgets/appointment_widget.dart';

@RoutePage(name: 'CalenderScreen')
class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  late Map<DateTime, List<Map<String, dynamic>>> _appointments;
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _appointments = {};
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    _fetchAppointments();
  }

  Future<void> _fetchAppointments() async {
    try {
      final response =
          await locator<DioService>().dio.get('/appointments/dates-and-times');

      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> data = (response.data as List<dynamic>)
            .map<Map<String, dynamic>>((item) => item as Map<String, dynamic>)
            .toList();
        setState(() {
          _appointments = {};
          for (var appointment in data) {
            final date = DateTime.parse(appointment['date']).toLocal();
            if (!_appointments.containsKey(date)) {
              _appointments[date] = [];
            }
            _appointments[date]!.add(appointment);
          }
        });
      }
    } catch (error) {
      print('Error fetching appointments: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedEvents = _appointments[
            DateTime.parse(_selectedDay.toString().replaceAll("Z", ""))] ??
        [];

    return Scaffold(
      appBar: AppBar(title: const Text('Appointments Calendar')),
      body: RefreshIndicator(
        onRefresh: _fetchAppointments,
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020),
              lastDay: DateTime.utc(2025, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                _fetchAppointments();
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              eventLoader: (day) {
                final data = _appointments[
                        DateTime.parse(day.toString().replaceAll("Z", ""))] ??
                    [];
                return data;
              },
              calendarStyle: const CalendarStyle(
                markersMaxCount: 1,
                markerDecoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: selectedEvents.length,
                itemBuilder: (context, index) {
                  final appointment = selectedEvents[index];
                  return Padding(
                    padding: horizontalPadding12 + verticalPadding8,
                    child: AppointmentWidget(
                      status: appointment['status'],
                      appointmentId: appointment['id'],
                      doctorImage: appointment['doctor']['picture'],
                      doctorName: appointment['doctor']['name'],
                      appointmentTitle: "test",
                      date: appointment['date'],
                      onTap: () {
                        _showAppointmentDetails(appointment);
                      },
                    ),
                  );

                  return Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: ListTile(
                      title: Text(appointment['title']),
                      subtitle: Text(
                        'Time: ${appointment['time']} - Mode: ${appointment['mode']}',
                      ),
                      onTap: () {
                        _showAppointmentDetails(appointment);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAppointmentDetails(Map<String, dynamic> appointment) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Appointment Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Doctor: ${appointment['doctor']}'),
              Text('Child: ${appointment['child']}'),
              Text('Date: ${appointment['date']}'),
              Text('Time: ${appointment['time']}'),
              Text('Mode: ${appointment['mode']}'),
              Text('Status: ${appointment['status']}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
