import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../config/constants/size/app_size.dart';
import '../../../../config/routes/routes.gr.dart';
import '../../../../core/common/app_components/app_button.dart';
import '../../../../core/common/app_components/app_text.dart';
import '../../../../core/common/custom_components/custom_text_field.dart';
import '../../../../core/common/default_app_bar.dart';
import '../../../../core/connections/api/dio_service.dart';
import '../../../../core/helper/date_time_formatter_string.dart';
import '../../../../core/service/navigation_service.dart';
import '../../../../core/themes/text_theme/all_text_styles.dart';
import '../../../../core/utils/extensions/date_time_helper_extension.dart';
import '../../../../core/utils/extensions/snackbar_extension.dart';
import '../../../../di/main_di.dart';
import '../../../../generated/assets.gen.dart';
import '../../../appointment/presentation/cubit/appointment_cubit.dart';
import '../../../appointment/presentation/widgets/appointment_widget.dart';
import '../../../profile/presentation/cubit/profile_detail_cubit.dart';

@RoutePage(name: 'HomeScreen')
class HomeView extends StatelessWidget implements AutoRouteWrapper {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: DefaultAppBar(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
              ),
              onPressed: () {
                context.router.pushNamed('NotificationScreen');
              },
            ),
            horizontalMargin8,
          ],
        ),
        body: BlocBuilder<AppointmentCubit, AppointmentState>(
          builder: (context, state) {
            return Column(
              children: [
                // Image
                Container(
                  height: 160.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: allRadius12,
                    image: DecorationImage(
                      image: AssetImage(
                        Assets.images.test.path,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                verticalMargin12,
                // Reminder Text
                Container(
                  width: 1.sw,
                  padding: horizontalPadding12 + verticalPadding12,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xffccffc1),
                    borderRadius: allRadius12,
                  ),
                  child: Text(
                    'Reminder: You have an appointment today',
                    style: AllTextStyle.f14W4,
                  ),
                ),
                verticalMargin16,
                // Title
                AppText("Appointments", style: AllTextStyle.f24W7),
                verticalMargin16,
                // Tab Bar
                TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.blue,
                  onTap: (index) {
                    if (index == 0) {
                      context
                          .read<AppointmentCubit>()
                          .getAllAppointments(status: "Accepted");
                    } else {
                      context
                          .read<AppointmentCubit>()
                          .getAllAppointments(status: "Pending");
                    }
                  },
                  tabs: [
                    Tab(text: 'Upcoming'),
                    Tab(text: 'Pending'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // Upcoming Appointments
                      (state.allAppointments.isEmpty)
                          ? Center(
                              child: Text("No data", style: AllTextStyle.f16W4),
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) =>
                                  verticalMargin8,
                              padding: horizontalPadding12 + verticalPadding8,
                              itemCount: state.allAppointments.length,
                              itemBuilder: (context, index) {
                                final appointment =
                                    state.allAppointments[index];
                                if (appointment == null) {
                                  return const SizedBox();
                                }
                                return AppointmentWidget(
                                  onTap: () {
                                    locator<NavigationService>().push(
                                      AppointmentDetailRoute(
                                        appointmentId: appointment['id'] ?? "",
                                      ),
                                    );
                                  },
                                  status: appointment['status'],
                                  appointmentId: appointment['id'],
                                  doctorImage: appointment['doctor']['picture'],
                                  doctorName: appointment['doctor']['name'],
                                  appointmentTitle: "test",
                                  date: appointment['date'],
                                );
                              },
                            ),
                      // Pending Appointments
                      (state.allAppointments.isEmpty)
                          ? Center(
                              child: Text("No data", style: AllTextStyle.f16W4),
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) =>
                                  verticalMargin8,
                              padding: horizontalPadding12 + verticalPadding8,
                              itemCount: state.allAppointments.length,
                              itemBuilder: (context, index) {
                                final appointment =
                                    state.allAppointments[index];
                                return BlocBuilder<ProfileDetailCubit,
                                    ProfileDetailState>(
                                  builder: (context, profileState) {
                                    return AppointmentWidget(
                                      status: appointment['status'],
                                      appointmentId: appointment['id'],
                                      doctorImage: appointment['doctor']
                                          ['picture'],
                                      doctorName: appointment['doctor']['name'],
                                      appointmentTitle: "test",
                                      date: appointment['date'],
                                      isEditable:
                                          profileState.profileData?.user.role !=
                                              "doctor",
                                      onTap: () {
                                        locator<NavigationService>().push(
                                          AppointmentDetailRoute(
                                            appointmentId:
                                                appointment['id'] ?? '',
                                          ),
                                        );
                                      },
                                      onTapEdit: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (c) {
                                            return EditAppointmentWidget(
                                              appointmentId: appointment['id'],
                                              doctorImage: appointment['doctor']
                                                  ['picture'],
                                              doctorName: appointment['doctor']
                                                  ['name'],
                                              appointmentTitle: "test",
                                              date: appointment['date'],
                                              time: appointment['time'],
                                              status: appointment['status'],
                                              mode: appointment['mode'],
                                              childId: appointment['child']
                                                  ['_id'],
                                              childName: appointment['child']
                                                  ['name'],
                                              description:
                                                  appointment['description'],
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<AppointmentCubit>()
            ..getAllAppointments(status: "Accepted"),
        ),
        BlocProvider<ProfileDetailCubit>(
          create: (_) => locator<ProfileDetailCubit>()..onCheckLoginStatus(),
        ),
      ],
      child: this,
    );
  }
}

class EditAppointmentWidget extends StatefulWidget {
  const EditAppointmentWidget({
    super.key,
    required this.appointmentId,
    this.doctorImage,
    this.doctorName,
    this.appointmentTitle,
    this.date,
    this.time,
    required this.status,
    required this.mode,
    this.childId,
    this.childName,
    this.description,
  });

  final String appointmentId;
  final String? doctorImage;
  final String? doctorName;
  final String? appointmentTitle;
  final String? date;
  final String? time;
  final String status;
  final String mode;
  final String? childId;
  final String? childName;
  final String? description;

  @override
  State<EditAppointmentWidget> createState() => _EditAppointmentWidgetState();
}

class _EditAppointmentWidgetState extends State<EditAppointmentWidget> {
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
  void initState() {
    super.initState();

    // Initialize title
    _titleController.text = widget.appointmentTitle ?? "";

    // Initialize doctor name
    _doctorNameController.text = widget.doctorName ?? "";

    // Initialize date with validation
    if (widget.date != null) {
      try {
        _dateController.text = DateTime.parse(widget.date!)
            .formatDateTime(DateTimeFormatterString.monthDayYearUS);
      } catch (e) {
        _dateController.text = "";
      }
    }

    // Initialize time with validation
    if (widget.date != null && widget.time != null) {
      try {
        _timeController.text = TimeOfDay.fromDateTime(
          DateTime.parse("${widget.date!}T${widget.time!}"),
        ).format(context);
      } catch (e) {
        _timeController.text = "";
      }
    }

    // Initialize mode
    _modeController.text = widget.mode;

    // Initialize child name
    _childController.text = widget.childName ?? "";

    // Initialize description
    _descriptionController.text = widget.description ?? "";

    // Initialize child ID
    _childIdController.text = widget.childId ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<AppointmentCubit>(),
      child: BlocListener<AppointmentCubit, AppointmentState>(
        listener: (context, state) {
          if (state.error != null) {
            context.showSnackBar(
              message: state.error!.message,
              isError: true,
            );
            locator<NavigationService>().maybePopTop();
          }
          if (state.isAppointmentUpdated) {
            context.showSnackBar(
              message: "Appointment Updated",
            );
            locator<NavigationService>().maybePopTop();
            locator<AppointmentCubit>().getAllAppointments(status: "Pending");
          }
        },
        child: Scaffold(
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
                      label: "Update",
                    ),
                  ],
                ),
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
            appointmentDate.year,
            appointmentDate.month,
            appointmentDate.day,
            appointmentTime.hour,
            appointmentTime.minute,
          );
        } else {
          appointmentDateTime = appointmentDate;
        }
      }

      // Prepare data for update
      final Map<String, dynamic> updates = {
        if (_titleController.text != widget.appointmentTitle &&
            _titleController.text.isNotEmpty)
          'title': _titleController.text,
        if (_doctorIdController.text != widget.doctorName &&
            _doctorIdController.text.isNotEmpty)
          'doctorId': _doctorIdController.text,
        if (_modeController.text != widget.mode &&
            _modeController.text.isNotEmpty)
          'mode': _modeController.text,
        if (_childIdController.text != widget.childName &&
            _childIdController.text.isNotEmpty)
          'childId': _childIdController.text,
        if (_descriptionController.text != widget.description &&
            _descriptionController.text.isNotEmpty)
          'description': _descriptionController.text,
        'date': appointmentDateTime,
        'time': appointmentDateTime,
      };

      if (updates.isEmpty) {
        context.showSnackBar(message: 'No changes to update.');
        return;
      }

      // Call the update function
      locator<AppointmentCubit>().updateAppointment(
        id: widget.appointmentId,
        doctorId: updates['doctorId'],
        date: updates['date'],
        time: updates['time'],
        title: updates['title'],
        mode: updates['mode'],
        childId: updates['childId'],
        description: updates['description'],
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
