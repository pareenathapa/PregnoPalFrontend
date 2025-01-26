part of 'notification_cubit.dart';

@freezed
class NotificationState with _$NotificationState {
  const NotificationState._();

  const factory NotificationState({
    @Default(false) bool isLoading,
    AppErrorHandler? error,
    dynamic notification,
  }) = _NotificationState;

  // Initial state
  factory NotificationState.initial() => const NotificationState();
}
