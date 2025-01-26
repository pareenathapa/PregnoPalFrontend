import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../config/constants/size/app_size.dart';
import '../../../../config/routes/routes.gr.dart';
import '../../../../core/common/app_components/app_button.dart';
import '../../../../core/common/app_components/app_text.dart';
import '../../../../core/common/default_app_bar.dart';
import '../../../../core/connections/api/dio_service.dart';
import '../../../../core/service/navigation_service.dart';
import '../../../../core/themes/text_theme/all_text_styles.dart';
import '../../../../di/main_di.dart';
import '../../../appointment/presentation/cubit/appointment_cubit.dart';
import '../../../appointment/presentation/widgets/appointment_widget.dart';
import '../../../profile/presentation/cubit/profile_detail_cubit.dart';

@RoutePage(name: "HistoryScreen")
class HistoryView extends StatefulWidget implements AutoRouteWrapper {
  HistoryView({super.key});
  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              locator<ProfileDetailCubit>()..getProfileDetail(),
        ),
        BlocProvider(
          create: (context) => locator<AppointmentCubit>()
            ..getAllAppointments(status: "completed"),
        ),
      ],
      child: this,
    );
  }

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final TextEditingController _doctorNameController = TextEditingController();

  final TextEditingController _doctorIdController = TextEditingController();

  final TextEditingController _childController = TextEditingController();

  final TextEditingController _childIdController = TextEditingController();

  String? sort = "asc";

  Widget _buildSortSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText('Sort', style: AllTextStyle.f14W5),
        verticalMargin4,
        DropdownButton<String>(
          value: sort,
          onChanged: (String? newValue) {
            setState(() {
              sort = newValue;
            });
          },
          items: <String>['asc', 'desc']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: AppText(value),
            );
          }).toList(),
        ),
      ],
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
                await locator<DioService>().dio.get("/users/allChildren");
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

  _showFilterBottomSheet(
    BuildContext context,
    AppointmentCubit cubit,
    ProfileDetailState profileState,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: horizontalPadding16 + verticalPadding16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText("Filter", style: AllTextStyle.f16W6),
              verticalMargin16,
              if (profileState.profileData?.user.role != "doctor")
                _buildDoctorSelection(),
              verticalMargin16,
              _buildChildSelection(),
              verticalMargin16,
              _buildSortSelection(),
              verticalMargin16,
              AppButton.primary(
                onPressed: () {
                  cubit.getAllAppointments(
                    doctorId: profileState.profileData?.user.role != "doctor"
                        ? _doctorIdController.text
                        : null,
                    childId: _childIdController.text,
                    status: "Completed",
                    sort: sort,
                  );
                  locator<NavigationService>().maybePop();
                },
                label: "Apply Filter",
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileDetailCubit, ProfileDetailState>(
      builder: (context, profileState) {
        return BlocProvider.value(
          value: context.read<AppointmentCubit>()
            ..getAllAppointments(
              doctorId: profileState.profileData?.user.role != "doctor"
                  ? _doctorIdController.text
                  : null,
              status: "Completed",
            ),
          child: Scaffold(
            appBar: DefaultAppBar(
              title: "Medical History",
              actions: [
                BlocBuilder<ProfileDetailCubit, ProfileDetailState>(
                  builder: (context, state) {
                    return IconButton(
                      icon: const Icon(
                        Icons.filter_alt_outlined,
                      ),
                      onPressed: () {
                        _showFilterBottomSheet(
                          context,
                          context.read<AppointmentCubit>(),
                          state,
                        );
                      },
                    );
                  },
                ),
                horizontalMargin8,
              ],
            ),
            body: BlocBuilder<AppointmentCubit, AppointmentState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state.allAppointments.isEmpty) {
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<AppointmentCubit>()
                          .getAllAppointments(status: "Completed");
                    },
                    child: const Center(
                      child: Text("No History, Tap to refresh"),
                    ),
                  );
                }
                if (state.allAppointments.isNotEmpty) {
                  return ListView.separated(
                    padding: horizontalPadding16,
                    itemBuilder: (c, i) => AppointmentWidget(
                      appointmentId: state.allAppointments[i]["_id"] ?? "",
                      status: state.allAppointments[i]['status'],
                      doctorImage: state.allAppointments[i]['doctor']
                          ['picture'],
                      doctorName: state.allAppointments[i]['doctor']['name'],
                      appointmentTitle: "test",
                      date: state.allAppointments[i]['date'],
                      onTap: () {
                        final id = state.allAppointments[i]['id'];
                        log(id);
                        locator<NavigationService>().push(
                          AppointmentDetailRoute(
                            appointmentId: id,
                          ),
                        );
                      },
                    ),
                    separatorBuilder: (c, i) => verticalMargin12,
                    itemCount: state.allAppointments.length,
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
