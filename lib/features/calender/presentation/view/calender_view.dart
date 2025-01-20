import 'dart:convert';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../config/constants/size/app_size.dart';
import '../../../../core/common/app_components/app_button.dart';
import '../../../../core/common/app_status_chips.dart';
import '../../../../core/connections/api/dio_service.dart';
import '../../../../core/helper/date_time_formatter_string.dart';
import '../../../../core/helper/url_launcher_helper.dart';
import '../../../../core/themes/text_theme/all_text_styles.dart';
import '../../../../core/utils/extensions/date_time_helper_extension.dart';
import '../../../../di/main_di.dart';
import '../../../appointment/presentation/cubit/appointment_cubit.dart';
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
          content: Padding(
            padding: horizontalPadding16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Appointment Title
                Center(
                  child: Text(
                    appointment['title'] ?? 'Apple',
                    style: AllTextStyle.f20W6,
                  ),
                ),
                verticalMargin24,
                // Doctor Details
                // Doctor Image + Name + specialization
                Row(
                  children: [
                    // Doctor Image
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(
                          appointment['doctor']['picture'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    horizontalMargin12,
                    // Doctor Name + specialization
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appointment['doctor']['name'],
                          style: AllTextStyle.f16W6,
                        ),
                        verticalMargin4,
                        Text(
                          appointment['doctor']['specialization'],
                          style: AllTextStyle.f14W4,
                        ),
                      ],
                    ),
                  ],
                ),
                verticalMargin16,
                // Appointment Status + Mode
                Row(
                  children: [
                    StatusChips(label: appointment['status']),
                    horizontalMargin8,
                    StatusChips(label: appointment['mode']),
                  ],
                ),
                verticalMargin16,
                // If mode is online, show the link
                if (appointment['mode'].toString().toLowerCase() == 'online')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Meeting Link',
                        style: AllTextStyle.f16W6,
                      ),
                      verticalMargin4,
                      GestureDetector(
                        onTap: () {
                          locator<UrlLauncherHelper>().launchURL(
                            appointment['meeting_link'],
                          );
                        },
                        child: Text(
                          "appointment['meeting_link']",
                          style: AllTextStyle.f16W4.copyWith(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                verticalMargin16,
                // Appointment Date + Time
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Appointment Date',
                      style: AllTextStyle.f16W6,
                    ),
                    verticalMargin4,
                    Text(
                      appointment['date'],
                      style: AllTextStyle.f16W4,
                    ),
                    verticalMargin16,
                    Text(
                      'Appointment Time',
                      style: AllTextStyle.f16W6,
                    ),
                    verticalMargin4,
                    Text(
                      appointment['time'],
                      style: AllTextStyle.f16W4,
                    ),
                  ],
                ),
                //  Child Details
                verticalMargin16,
                Text(
                  'Child Details',
                  style: AllTextStyle.f16W6,
                ),
                verticalMargin4,
                Text(
                  'Name: ${appointment['child']['name']}',
                  style: AllTextStyle.f16W4,
                ),
                verticalMargin4,
                Text(
                  'Age: ${appointment['child']['sex']}',
                  style: AllTextStyle.f16W4,
                ),
                verticalMargin4,

                Text(
                  'Height: ${appointment['child']['height']} cm',
                  style: AllTextStyle.f16W4,
                ),
                verticalMargin4,
                Text(
                  'Weight: ${appointment['child']['weight']} kg',
                  style: AllTextStyle.f16W4,
                ),
                verticalMargin4,
                Text(
                  'Weight: ${appointment['child']['weight']} kg',
                  style: AllTextStyle.f16W4,
                ),

                Text(
                  'DOB:  ${DateTime.parse(
                    appointment['child']['date_of_birth'],
                  ).formatDateTime(
                    DateTimeFormatterString.dayMonthYear,
                  )}',
                  style: AllTextStyle.f16W4,
                ),
                verticalMargin4,

                // Appointment Description
                verticalMargin16,
                Text(
                  'Description',
                  style: AllTextStyle.f16W6,
                ),
                verticalMargin4,
                Text(
                  appointment['description'],
                  style: AllTextStyle.f16W4,
                ),
              ],
            ),
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
