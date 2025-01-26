import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/constants/size/app_size.dart';
import '../../../../core/common/default_app_bar.dart';
import '../../../../core/service/navigation_service.dart';
import '../../../../core/utils/extensions/snackbar_extension.dart';
import '../../../../di/main_di.dart';
import '../cubit/notification_cubit.dart';

@RoutePage(name: "NotificationScreen")
class NotificationView extends StatelessWidget implements AutoRouteWrapper {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationCubit, NotificationState>(
        listener: (context, state) {
      if (state.error != null) {
        context.showSnackBar(message: state.error!.message, isError: true);
      }
    }, builder: (context, state) {
      if (state.isLoading) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Notification'),
          ),
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state.notification != null) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Notification'),
          ),
          body: (state.notification == [])
              ? const Center(child: Text('No Notification Found'))
              : ListView.separated(
                  itemBuilder: (c, i) => ListTile(
                    leading: Icon(
                      Icons.notifications,
                      size: 43.r,
                    ),
                    title: Text(state.notification![i]['title']),
                    subtitle: Text(
                      state.notification![i]['appointment_id']['description'],
                    ),
                  ),
                  separatorBuilder: (c, i) => verticalMargin12,
                  itemCount: state.notification!.length,
                ),
        );
      } else if (state.error != null) {
        {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Notification'),
            ),
            body: Center(
              child: Text(state.error!.message),
            ),
          );
        }
      } else {
        return const SizedBox();
      }
    });
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<NotificationCubit>()..getNotification(),
      child: this,
    );
  }
}
