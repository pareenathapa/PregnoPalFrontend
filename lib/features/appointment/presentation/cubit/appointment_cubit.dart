import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/connections/api/dio_service.dart';
import '../../../../core/failure/error_handler.dart';
import '../../../../di/main_di.dart';
import '../../domain/usecase/add_appointment_usecase.dart';
import '../../domain/usecase/delete_appointment_usecase.dart';
import '../../domain/usecase/get_all_appointment_usecase.dart';
import '../../domain/usecase/get_dates_appointment_usecase.dart';
import '../../domain/usecase/get_single_appointment_usecase.dart';
import '../../domain/usecase/update_appointment_usecase.dart';
part 'appointment_state.dart';
part 'appointment_cubit.freezed.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final AddAppointmentUsecase _addAppointmentUsecase;
  final GetAllAppointmentUsecase _getAllAppointmentUsecase;
  final GetSingleAppointmentUsecase _getSingleAppointmentUsecase;
  final UpdateAppointmentUsecase _updateAppointmentUsecase;
  final DeleteAppointmentUsecase _deleteAppointmentUsecase;
  final GetDatesAppointmentUsecase _getDatesAppointmentUsecase;

  AppointmentCubit({
    required GetAllAppointmentUsecase getAllAppointmentUsecase,
    required GetSingleAppointmentUsecase getSingleAppointmentUsecase,
    required UpdateAppointmentUsecase updateAppointmentUsecase,
    required DeleteAppointmentUsecase deleteAppointmentUsecase,
    required GetDatesAppointmentUsecase getDatesAppointmentUsecase,
    required AddAppointmentUsecase addAppointmentUsecase,
  })  : _getAllAppointmentUsecase = getAllAppointmentUsecase,
        _addAppointmentUsecase = addAppointmentUsecase,
        _getSingleAppointmentUsecase = getSingleAppointmentUsecase,
        _updateAppointmentUsecase = updateAppointmentUsecase,
        _deleteAppointmentUsecase = deleteAppointmentUsecase,
        _getDatesAppointmentUsecase = getDatesAppointmentUsecase,
        super(AppointmentState.initial());

  Future<void> addAppointment({
    required String description,
    required String title,
    required String doctorId,
    required String childId,
    required DateTime date,
    required DateTime time,
    required String mode,
    String? meetingLink,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        error: null,
      ),
    );
    final result = await _addAppointmentUsecase(
      AddAppointmentParams(
        description: description,
        doctorId: doctorId,
        childId: childId,
        date: date,
        time: time,
        title: title,
        mode: mode,
        meetingLink: meetingLink,
      ),
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            error: failure,
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            isLoading: false,
            error: null,
            selectedAppointment: success,
            isAppointmentAdded: true,
          ),
        );
      },
    );
  }

  Future<void> getAllAppointments({
    String? status,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        error: null,
      ),
    );
    final result = await _getAllAppointmentUsecase(status);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            error: failure,
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            isLoading: false,
            error: null,
            allAppointments: success,
          ),
        );
      },
    );
  }

  Future<void> getSingleAppointment(String id) async {
    emit(
      state.copyWith(
        isLoading: true,
        error: null,
      ),
    );
    final result = await _getSingleAppointmentUsecase(id);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            error: failure,
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            isLoading: false,
            error: null,
            selectedAppointment: success,
          ),
        );
      },
    );
  }

  Future<void> updateAppointment({
    required String id,
    String? description,
    String? title,
    String? doctorId,
    String? childId,
    DateTime? date,
    DateTime? time,
    String? mode,
    String? meetingLink,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        error: null,
      ),
    );
    final result = await _updateAppointmentUsecase(
      UpdateAppointmentParams(
        id: id,
        description: description,
        doctorId: doctorId,
        childId: childId,
        date: date,
        time: time,
        mode: mode,
        meetingLink: meetingLink,
        title: title,
      ),
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            error: failure,
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            isLoading: false,
            error: null,
            selectedAppointment: success,
          ),
        );
      },
    );
  }

  Future<void> deleteAppointment(String id) async {
    emit(
      state.copyWith(
        isLoading: true,
        error: null,
      ),
    );
    final result = await _deleteAppointmentUsecase(id);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            error: failure,
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            isLoading: false,
            error: null,
          ),
        );
      },
    );
  }

  Future<void> getAppointmentDatesAndTimes() async {
    emit(
      state.copyWith(
        isLoading: true,
        error: null,
      ),
    );
    final result = await _getDatesAppointmentUsecase(null);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            error: failure,
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            isLoading: false,
            error: null,
            appointmentDatesAndTimes: success,
          ),
        );
      },
    );
  }

  Future<void> rejectAppointment(String appointmentId) async {
    final response = await locator<DioService>()
        .dio
        .post("/appointments/reject/$appointmentId");

    if (response.statusCode == 201) {
      emit(
        state.copyWith(
          isLoading: false,
          error: null,
          isAppointmentRejected: true,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          error: AppErrorHandler(
            message: "Failed to reject appointment",
          ),
        ),
      );
    }
  }

  Future<void> acceptedAppointment(String appointmentId) async {
    final response = await locator<DioService>()
        .dio
        .post("/appointments/accept/$appointmentId");

    if (response.statusCode == 201) {
      emit(
        state.copyWith(
          isLoading: false,
          error: null,
          isAppointmentAccepted: true,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          error: AppErrorHandler(
            message: "Failed to reject appointment",
          ),
        ),
      );
    }
  }

  Future<void> counterAppointment({
    required String appointmentId,
    required String counterMode,
    required DateTime counterDate,
    required DateTime counterTime,
  }) async {
    final response = await locator<DioService>().dio.post(
      "/appointments/counter/$appointmentId",
      data: {
        "counter_proposal_date": counterDate,
        "counter_mode": counterMode,
        "counter_proposal_time": counterTime,
      },
    );

    if (response.statusCode == 201) {
      emit(
        state.copyWith(
          isLoading: false,
          error: null,
          isAppointmentUpdated: true,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          error: AppErrorHandler(
            message: "Failed to reject appointment",
          ),
        ),
      );
    }
  }
}
