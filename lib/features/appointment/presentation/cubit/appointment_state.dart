part of 'appointment_cubit.dart';

@freezed
class AppointmentState with _$AppointmentState {
  const AppointmentState._();

  const factory AppointmentState({
    @Default(false) bool isLoading,
    AppErrorHandler? error,
    @Default([]) List<Map<String, dynamic>> allAppointments,
    dynamic appointmentDatesAndTimes,
    dynamic selectedAppointment,
    @Default(false) bool isAppointmentAdded,
    @Default(false) bool isAppointmentDeleted,
    @Default(false) bool isAppointmentUpdated,
    @Default(false) bool isAppointmentRejected,
    @Default(false) bool isAppointmentAccepted,
    dynamic todayAppointment,
  }) = _AppointmentState;

  // Initial state
  factory AppointmentState.initial() => const AppointmentState();
}
