import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/constants/size/app_size.dart';
import '../../../../core/common/default_app_bar.dart';
import '../../../../di/main_di.dart';
import '../../../appointment/presentation/cubit/appointment_cubit.dart';
import '../../../appointment/presentation/widgets/appointment_widget.dart';

@RoutePage(name: "HistoryScreen")
class HistoryView extends StatelessWidget implements AutoRouteWrapper {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: "Medical History",
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
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.allAppointments.isEmpty) {
            return const Center(
              child: Text("No History"),
            );
          }
          if (state.allAppointments.isNotEmpty) {
            return ListView.separated(
              padding: horizontalPadding16,
              itemBuilder: (c, i) => AppointmentWidget(
                appointmentId: state.allAppointments[i]["_id"] ?? "",
                status: state.allAppointments[i]['status'],
                doctorImage: state.allAppointments[i]['doctor']['picture'],
                doctorName: state.allAppointments[i]['doctor']['name'],
                appointmentTitle: "test",
                date: state.allAppointments[i]['date'],
                // onTap: () {
                //   _showAppointmentDetails(appointment);
                // },
              ),
              separatorBuilder: (c, i) => verticalMargin12,
              itemCount: state.allAppointments.length,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator<AppointmentCubit>()..getAllAppointments(status: "completed"),
      child: this,
    );
  }
}
