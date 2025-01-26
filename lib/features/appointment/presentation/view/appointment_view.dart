import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../config/constants/colors/primitive_colors_constants.dart';
import '../../../../config/constants/size/app_size.dart';
import '../../../../core/bootstrap.dart';
import '../../../../core/common/app_components/app_button.dart';
import '../../../../core/common/app_components/app_cached_network_image.dart';
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
  final _meetingLinkController = TextEditingController();
  DateTime time = DateTime.now();
  DateTime date = DateTime.now();

  String selectedOnlineMethod = "G";
  bool isOnline = false;

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
        if (state.isAppointmentAdded) {
          context.showSnackBar(
            message: "Appointment Added Successfully",
          );
          // Clear all fields after successful appointment
          _titleController.clear();
          _doctorNameController.clear();
          _doctorIdController.clear();
          _dateController.clear();
          _timeController.clear();
          _modeController.clear();
          _childController.clear();
          _childIdController.clear();
          _descriptionController.clear();
        }
      },
      child: Scaffold(
        appBar: DefaultAppBar(
          title: "Book Appointment",
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
                  KTextFormField(
                    hintText: 'Description',
                    titleText: 'Description',
                    controller: _descriptionController,
                    maxLines: 3,
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
                  if (isOnline) _buildOnlineModeLinkField(),
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

  Widget _buildOnlineModeLinkField() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AppButton.custom(
                onPressed: () {
                  setState(() {
                    selectedOnlineMethod = "G";
                  });
                },
                showBorder: selectedOnlineMethod == "G",
                border: BorderSide(color: PrimitiveColors.primary),
                label: "Google Meet",
                prefix: AppCachedNetworkImage.avatar(
                  alt: "Google",
                  imageUrl:
                      "https://static-00.iconduck.com/assets.00/google-meet-icon-2048x2048-js4zjooy.png",
                  height: 40.h,
                  width: 40.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            horizontalMargin12,
            Expanded(
                child: AppButton.custom(
              onPressed: () {
                setState(() {
                  selectedOnlineMethod = "z";
                });
              },
              label: "Zoom",
              showBorder: selectedOnlineMethod == "z",
              border: BorderSide(color: PrimitiveColors.primary),
              prefix: AppCachedNetworkImage.avatar(
                alt: "Google",
                imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ8heXta8npoK1xCPaRmMWjSKQI4NATzNb9A&s",
                height: 40.h,
                width: 40.w,
                fit: BoxFit.contain,
              ),
            )),
          ],
        ),
        verticalMargin12,
        KTextFormField(
          hintText: 'Meeting Link',
          titleText: 'Meeting Link',
          controller: _meetingLinkController,
        ),
      ],
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
          date = selectedDate;
          setState(() {});
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
          time = DateTime(
            date.year,
            date.month,
            date.day,
            selectedTime.hour,
            selectedTime.minute,
          );
          setState(() {});
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
                    setState(() {
                      isOnline = false;
                    });
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Online'),
                  onTap: () {
                    setState(() {
                      isOnline = true;
                    });
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
      ],
    );
  }

  void _onConfirm() {
    try {
      DateTime? appointmentDateTime;

      // Validate and parse date if not empty
      if (_dateController.text.isNotEmpty) {
        final dateParts = _dateController.text.split('/');
        if (dateParts.length != 3 ||
            dateParts.any((part) => int.tryParse(part) == null)) {
          throw FormatException('Invalid date format');
        }
        final appointmentDate = DateTime(
          int.parse(dateParts[2]),
          int.parse(dateParts[0]),
          int.parse(dateParts[1]),
        );

        // Validate and parse time if not empty
        if (_timeController.text.isNotEmpty) {
          final timeParts = _timeController.text.split(':');
          if (timeParts.length != 2 ||
              timeParts.any((part) => int.tryParse(part) == null)) {
            throw FormatException('Invalid time format');
          }
          final appointmentTime = TimeOfDay(
            hour: int.parse(timeParts[0]),
            minute: int.parse(timeParts[1]),
          );

          // Combine date and time into a DateTime object
          appointmentDateTime = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        } else {
          appointmentDateTime = appointmentDate;
        }
      }

      log(
        'Doctor ID: ${_doctorIdController.text}\n'
        'Date: $appointmentDateTime\n'
        'Time: $appointmentDateTime\n'
        'Title: ${_titleController.text}\n'
        'Mode: ${_modeController.text}\n'
        'Child ID: ${_childIdController.text}\n'
        'Description: ${_descriptionController.text}',
      );
      context.read<AppointmentCubit>().addAppointment(
            doctorId: _doctorIdController.text,
            date: appointmentDateTime!,
            time: appointmentDateTime!,
            title: _titleController.text,
            mode: _modeController.text,
            meetingLink: _modeController.text == "Online"
                ? _meetingLinkController.text
                : "",
            childId: _childIdController.text,
            description: _descriptionController.text,
          );
    } catch (e) {
      // Handle errors and show appropriate messages
      context.showSnackBar(message: e.toString(), isError: true);
    }
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
