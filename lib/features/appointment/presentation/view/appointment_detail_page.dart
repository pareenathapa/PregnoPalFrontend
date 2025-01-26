import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/constants/api/api_endpoints_constants.dart';
import '../../../../config/constants/size/app_size.dart';
import '../../../../core/common/app_components/app_button.dart';
import '../../../../core/common/app_components/app_text.dart';
import '../../../../core/common/app_status_chips.dart';
import '../../../../core/common/custom_components/custom_text_field.dart';
import '../../../../core/common/default_app_bar.dart';
import '../../../../core/connections/api/dio_service.dart';
import '../../../../core/helper/date_time_formatter_string.dart';
import '../../../../core/helper/url_launcher_helper.dart';
import '../../../../core/service/navigation_service.dart';
import '../../../../core/themes/text_theme/all_text_styles.dart';
import '../../../../core/utils/extensions/date_time_helper_extension.dart';
import '../../../../core/utils/extensions/snackbar_extension.dart';
import '../../../../di/main_di.dart';
import '../../../profile/presentation/cubit/profile_detail_cubit.dart';
import '../cubit/appointment_cubit.dart';
import 'appointment_view.dart';

@RoutePage()
class AppointmentDetailPage extends StatefulWidget implements AutoRouteWrapper {
  const AppointmentDetailPage({
    super.key,
    required this.appointmentId,
  });
  final String appointmentId;

  @override
  State<AppointmentDetailPage> createState() => _AppointmentDetailPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<AppointmentCubit>(),
        ),
        BlocProvider<ProfileDetailCubit>(
          create: (_) => locator<ProfileDetailCubit>()..onCheckLoginStatus(),
        ),
      ],
      child: this,
    );
  }
}

class _AppointmentDetailPageState extends State<AppointmentDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<AppointmentCubit>().getSingleAppointment(widget.appointmentId);
  }

  void counterAppointmentBottomSheet({
    required DateTime date,
    required DateTime time,
    required String mode,
    required AppointmentCubit cubit,
  }) {
    final TextEditingController _dateController = TextEditingController(
      text: date.formatDateTime(DateTimeFormatterString.monthDayYearUS),
    );
    final TextEditingController _timeController = TextEditingController(
      text: time.formatDateTime(DateTimeFormatterString.civilianTime),
    );
    final TextEditingController _modeController = TextEditingController(
      text: mode,
    );
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

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 500,
          child: Padding(
            padding: horizontalPadding16,
            child: Column(
              children: [
                Text('Counter Appointment'),
                _buildDateField(context),
                verticalMargin16,
                _buildTimeField(context),
                verticalMargin16,
                _buildModeSelection(context),
                verticalMargin16,
                AppButton.primary(
                  onPressed: () {
                    DateTime? appointmentDateTime;

                    // Validate and parse date if not empty
                    if (_dateController.text.isNotEmpty &&
                        _dateController.text !=
                            date.formatDateTime(
                                DateTimeFormatterString.monthDayYearUS)) {
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
                      if (_timeController.text.isNotEmpty &&
                          _timeController.text !=
                              time.formatDateTime(
                                  DateTimeFormatterString.civilianTime)) {
                        final timeParts = _timeController.text.split(':');
                        if (timeParts.length != 2 ||
                            timeParts
                                .any((part) => int.tryParse(part) == null)) {
                          throw FormatException('Invalid time format');
                        }
                        final appointmentTime = TimeOfDay(
                          hour: int.parse(timeParts[0]),
                          minute: int.parse(timeParts[1]),
                        );

                        // Combine date and time into a DateTime object
                        appointmentDateTime = DateTime(
                          appointmentDate.year,
                          appointmentDate.month,
                          appointmentDate.day,
                          appointmentTime.hour,
                          appointmentTime.minute,
                        );
                      } else {
                        appointmentDateTime = appointmentDate;
                      }
                    } else {
                      appointmentDateTime = date;
                    }
                    cubit.counterAppointment(
                      appointmentId: widget.appointmentId,
                      counterDate: appointmentDateTime!,
                      counterTime: appointmentDateTime!,
                      counterMode: _modeController.text,
                    );
                  },
                  label: 'Counter',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  final TextEditingController _commentController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileDetailCubit, ProfileDetailState>(
      builder: (context, state) {
        return BlocConsumer<AppointmentCubit, AppointmentState>(
          listener: (context, appState) {
            if (appState.error != null) {
              context.showSnackBar(
                message: appState.error!.message,
                isError: true,
              );
            }
            if (appState.isAppointmentRejected) {
              context.showSnackBar(
                message: 'Appointment Rejected',
              );
              locator<NavigationService>().maybePopTop();
            } else if (appState.isAppointmentAccepted) {
              context.showSnackBar(
                message: 'Done',
              );
              locator<NavigationService>().maybePopTop();
            } else if (appState.isAppointmentUpdated) {
              context.showSnackBar(
                message: 'Appointment Updated',
              );
              locator<NavigationService>().maybePopTop();
            }
          },
          builder: (context, appState) {
            if (appState.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (appState.selectedAppointment != null) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Appointment Detail',
                    style: AllTextStyle.f16W6,
                  ),
                ),
                body: Padding(
                  padding: horizontalPadding16,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Accept , Reject, Counter Button
                        if (state.profileData?.user.role == 'doctor' &&
                            appState.selectedAppointment['status']
                                    .toString()
                                    .toLowerCase() ==
                                'pending')
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: AppButton.primary(
                                  onPressed: () {
                                    context
                                        .read<AppointmentCubit>()
                                        .acceptedAppointment(
                                            widget.appointmentId);
                                  },
                                  label: "Accept",
                                ),
                              ),
                              horizontalMargin10,
                              Expanded(
                                child: AppButton.secondary(
                                  onPressed: () {
                                    context
                                        .read<AppointmentCubit>()
                                        .rejectAppointment(
                                          widget.appointmentId,
                                        );
                                  },
                                  label: "Reject",
                                ),
                              ),
                              horizontalMargin10,
                              Expanded(
                                child: AppButton.stroke(
                                  onPressed: () {
                                    log("${appState.selectedAppointment['time']}");
                                    counterAppointmentBottomSheet(
                                      cubit: context.read<AppointmentCubit>(),
                                      date: DateTime.parse(
                                        appState.selectedAppointment[
                                            'appointment_date'],
                                      ),
                                      time: DateTime.fromMillisecondsSinceEpoch(
                                        int.parse(appState
                                            .selectedAppointment['time']),
                                      ),
                                      mode:
                                          appState.selectedAppointment['mode'],
                                    );
                                  },
                                  label: "Counter",
                                ),
                              ),
                            ],
                          ),
                        verticalMargin16,
                        // Appointment Title
                        Center(
                          child: Text(
                            appState.selectedAppointment['title'] ?? 'Apple',
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
                                  appState.selectedAppointment['doctor_id']
                                              ['picture']
                                          .toString()
                                          .startsWith("/uploads")
                                      ? "${ApiEndpoints.baseDomain}${appState.selectedAppointment['doctor_id']['picture']}"
                                      : appState
                                              .selectedAppointment['doctor_id']
                                          ['picture'],
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
                                  appState.selectedAppointment['doctor_id']
                                      ['name'],
                                  style: AllTextStyle.f16W6,
                                ),
                                verticalMargin4,
                                Text(
                                  appState.selectedAppointment['doctor_id']
                                      ['specialization'],
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
                            StatusChips(
                                label: appState.selectedAppointment['status']),
                            horizontalMargin8,
                            StatusChips(
                                label: appState.selectedAppointment['mode']),
                          ],
                        ),
                        verticalMargin16,
                        // If mode is online, show the link
                        if (appState.selectedAppointment['mode']
                                .toString()
                                .toLowerCase() ==
                            'online')
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
                                    appState
                                        .selectedAppointment['meeting_link'],
                                  );
                                },
                                child: Text(
                                  appState.selectedAppointment['meeting_link']
                                      .toString(),
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
                              DateTime.parse(
                                appState
                                    .selectedAppointment['appointment_date'],
                              ).formatDateTime(
                                DateTimeFormatterString
                                    .abbreviatedDayMonthDayFormat,
                              ),
                              style: AllTextStyle.f16W4,
                            ),
                            verticalMargin16,
                            Text(
                              'Appointment Time',
                              style: AllTextStyle.f16W6,
                            ),
                            verticalMargin4,
                            Text(
                              DateTime.parse(
                                appState
                                    .selectedAppointment['appointment_date'],
                              ).formatDateTime(
                                DateTimeFormatterString.civilianTime,
                              ),
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
                          'Name: ${appState.selectedAppointment['child_id']['name']}',
                          style: AllTextStyle.f16W4,
                        ),
                        verticalMargin4,
                        Text(
                          'Age: ${appState.selectedAppointment['child_id']['sex']}',
                          style: AllTextStyle.f16W4,
                        ),
                        verticalMargin4,

                        Text(
                          'Height: ${appState.selectedAppointment['child_id']['height']} cm',
                          style: AllTextStyle.f16W4,
                        ),
                        verticalMargin4,
                        Text(
                          'Weight: ${appState.selectedAppointment['child_id']['weight']} kg',
                          style: AllTextStyle.f16W4,
                        ),
                        verticalMargin4,
                        Text(
                          'Weight: ${appState.selectedAppointment['child_id']['weight']} kg',
                          style: AllTextStyle.f16W4,
                        ),

                        Text(
                          'DOB:  ${DateTime.parse(
                            appState.selectedAppointment['appointment_date'],
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
                          appState.selectedAppointment['description'],
                          style: AllTextStyle.f16W4,
                        ),
                        verticalMargin24,
                        if (appState.selectedAppointment['status']
                                .toString()
                                .toLowerCase() ==
                            'completed') ...[
                          AppText('Comment', style: AllTextStyle.f16W6),
                          verticalMargin4,
                          AppText(
                            appState.selectedAppointment['comment'],
                            style: AllTextStyle.f16W4,
                          ),
                        ],
                        // Comment Section
                        if (state.profileData?.user.role == 'doctor' &&
                            appState.selectedAppointment['status']
                                    .toString()
                                    .toLowerCase() ==
                                'accepted')
                          Form(
                            key: formKey,
                            child: KTextFormField(
                              hintText: 'Comment',
                              controller: _commentController,
                              maxLines: 3,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Comment is required';
                                }
                                return null;
                              },
                            ),
                          ),
                        verticalMargin12,
                        if (state.profileData?.user.role == 'doctor' &&
                            appState.selectedAppointment['status']
                                    .toString()
                                    .toLowerCase() ==
                                'accepted')
                          AppButton.primary(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context
                                    .read<AppointmentCubit>()
                                    .completeAppointment(
                                      appointmentId: widget.appointmentId,
                                      comment: _commentController.text,
                                    );
                              }
                            },
                            label: "Completed",
                          ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text('No Data'),
              );
            }
          },
        );
      },
    );
  }
}
