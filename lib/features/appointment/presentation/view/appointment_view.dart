import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../config/constants/size/app_size.dart';
import '../../../../core/bootstrap.dart';
import '../../../../core/common/app_components/app_button.dart';
import '../../../../core/common/app_components/app_text.dart';
import '../../../../core/common/custom_components/custom_text_field.dart';
import '../../../../core/common/default_app_bar.dart';
import '../../../../core/connections/api/dio_service.dart';
import '../../../../core/helper/date_time_formatter_string.dart';
import '../../../../core/themes/text_theme/all_text_styles.dart';
import '../../../../core/utils/extensions/date_time_helper_extension.dart';
import '../../../../core/utils/extensions/snackbar_extension.dart';
import '../../../../core/utils/language_selector_bottom_sheet.dart';
import '../../../../di/main_di.dart';
import '../cubit/appointment_cubit.dart';

@RoutePage(name: 'AppointmentScreen')
class AppointmentView extends StatefulWidget implements AutoRouteWrapper {
  const AppointmentView({super.key});

  @override
  State<AppointmentView> createState() => _AppointmentViewState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<AppointmentCubit>()..getAllAppointments(),
      child: this,
    );
  }
}

class _AppointmentViewState extends State<AppointmentView> {
  final _titleController = TextEditingController();
  final _doctorNameController = TextEditingController();
  final _doctorIdController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _modeController = TextEditingController();
  final _childController = TextEditingController();
  final _childIdController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppointmentCubit, AppointmentState>(
      listener: (context, state) {
        if (state.error != null) {
          context.showSnackBar(
            message: state.error!.message,
            isError: true,
          );
        }
      },
      child: Scaffold(
        appBar: DefaultAppBar(
          title: "Book Appointment",
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () => context.router.pushNamed('NotificationScreen'),
            ),
            horizontalMargin8,
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          height: 1.sh,
          child: Padding(
            padding: horizontalPadding16,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalMargin24,
                  // Title Field
                  KTextFormField(
                    hintText: 'Title',
                    titleText: 'Title',
                    controller: _titleController,
                  ),
                  verticalMargin12,
                  // Doctor Selection Dropdown with Search
                  _buildDoctorSelection(),
                  verticalMargin12,
                  // Date Selection
                  _buildDateField(context),
                  verticalMargin12,
                  // Time Selection
                  _buildTimeField(context),
                  verticalMargin12,
                  // Mode Selection (Dropdown)
                  _buildModeSelection(context),
                  verticalMargin12,
                  // Child Selection Dropdown with Search
                  _buildChildSelection(),
                  verticalMargin12,
                  // Confirm Button
                  AppButton.primary(
                    onPressed: _onConfirm,
                    label: "Book",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText('Doctor', style: AllTextStyle.f14W5),
        verticalMargin4,
        TypeAheadField<Map<String, dynamic>>(
          controller: _doctorNameController,
          onSelected: (suggestion) {
            _doctorNameController.text = suggestion['name'];
            _doctorIdController.text = suggestion['_id'];
          },
          suggestionsCallback: (pattern) async {
            final response = await locator<DioService>().dio.get("/doctors");
            final doctors =
                (response.data as List).cast<Map<String, dynamic>>();
            return doctors
                .where((doc) => doc['name']
                    .toString()
                    .toLowerCase()
                    .contains(pattern.toLowerCase()))
                .toList();
          },
          itemBuilder: (_, suggestion) =>
              ListTile(title: Text(suggestion['name'])),
        ),
      ],
    );
  }

  Widget _buildDateField(BuildContext context) {
    return KTextFormField(
      hintText: 'Date',
      titleText: 'Date',
      suffixIcon: const Icon(Icons.calendar_today),
      controller: _dateController,
      readOnly: true,
      onTap: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 30)),
        );
        if (selectedDate != null) {
          _dateController.text = selectedDate
              .formatDateTime(DateTimeFormatterString.monthDayYearUS);
        }
      },
    );
  }

  Widget _buildTimeField(BuildContext context) {
    return KTextFormField(
      hintText: 'Time',
      titleText: 'Time',
      suffixIcon: const Icon(Icons.access_time),
      controller: _timeController,
      readOnly: true,
      onTap: () async {
        final selectedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (selectedTime != null) {
          _timeController.text = selectedTime.format(context);
        }
      },
    );
  }

  Widget _buildModeSelection(BuildContext context) {
    return KTextFormField(
      hintText: 'Mode',
      titleText: 'Mode',
      suffixIcon: const Icon(Icons.arrow_drop_down),
      controller: _modeController,
      readOnly: true,
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Select Mode'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Physical'),
                  onTap: () {
                    _modeController.text = 'Physical';
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Online'),
                  onTap: () {
                    _modeController.text = 'Online';
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildChildSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText('Child', style: AllTextStyle.f14W5),
        verticalMargin4,
        TypeAheadField<Map<String, dynamic>>(
          controller: _childController,
          onSelected: (suggestion) {
            _childController.text = suggestion['name'];
            _childIdController.text = suggestion['_id'];
          },
          suggestionsCallback: (pattern) async {
            final response =
                await locator<DioService>().dio.get("/users/children");
            final children =
                (response.data as List).cast<Map<String, dynamic>>();
            return children
                .where((child) => child['name']
                    .toString()
                    .toLowerCase()
                    .contains(pattern.toLowerCase()))
                .toList();
          },
          itemBuilder: (_, suggestion) =>
              ListTile(title: Text(suggestion['name'])),
        ),
        verticalMargin12,
        KTextFormField(
          hintText: 'Description',
          titleText: 'Description',
          controller: _descriptionController,
          maxLines: 3,
        ),
      ],
    );
  }

  void _onConfirm() {
    final appointmentDate = DateTime(
      int.parse(_dateController.text.split('/')[2]),
      int.parse(_dateController.text.split('/')[0]),
      int.parse(_dateController.text.split('/')[1]),
      int.parse(_timeController.text.split(':')[0]),
      int.parse(_timeController.text.split(':')[1]),
    );

    context.read<AppointmentCubit>().addAppointment(
          doctorId: _doctorIdController.text,
          date: appointmentDate,
          time: appointmentDate,
          title: _titleController.text,
          mode: _modeController.text,
          meetingLink: "hello",
          childId: _childIdController.text,
          description: _descriptionController.text,
        );
  }

  @override
  void dispose() {
    _doctorNameController.dispose();
    _doctorIdController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _modeController.dispose();
    _childController.dispose();
    _childIdController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
