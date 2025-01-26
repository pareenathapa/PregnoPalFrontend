import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/common/feature/firebase/domain/usecase/get_device_token_usecase.dart';
import '../../../../core/connections/api/dio_service.dart';
import '../../../../core/failure/error_handler.dart';
import '../../../../core/utils/extensions/form_validator_extension.dart';
import '../../../../core/utils/token_storage.dart';
import '../../../../di/main_di.dart';
part 'notification_state.dart';
part 'notification_cubit.freezed.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState.initial());

  void getNotification() async {
    try {
      emit(
        state.copyWith(
          isLoading: true,
          error: null,
        ),
      );
      final response = await locator<DioService>().dio.get('/notifications');
      if (response.statusCode != 200) {
        throw AppErrorHandler(message: "Error");
      }
      emit(
        state.copyWith(
          notification: response.data,
          isLoading: false,
        ),
      );
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(
        error: AppErrorHandler(message: e.toString()),
      ));
    }
  }
}
