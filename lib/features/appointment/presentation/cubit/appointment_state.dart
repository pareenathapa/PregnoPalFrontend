part of 'appointment_cubit.dart';

@freezed
class AppointmentState with _$AppointmentState {
  const AppointmentState._();

  const factory AppointmentState({
    @Default(false) bool isLoading,
    AppErrorHandler? error,
    dynamic allAppointments,
    dynamic appointmentDatesAndTimes,
    dynamic selectedAppointment,
    @Default(false) bool isAppointmentAdded,
    @Default(false) bool isAppointmentDeleted,
    @Default(false) bool isAppointmentUpdated,
  }) = _AppointmentState;

  // Initial state
  factory AppointmentState.initial() => const AppointmentState();
}
