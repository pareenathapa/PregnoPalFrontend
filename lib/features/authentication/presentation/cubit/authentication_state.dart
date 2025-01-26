part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const AuthenticationState._();

  const factory AuthenticationState({
    @Default(false) bool loginCheckSuccess,
    @Default(false) bool isLoading,
    @Default(false) bool isLoggedIn,
    @Default(false) bool isLoggedOut,
    @Default(false) bool isRegisterSuccess,
    @Default(false) bool isLoginFormValid,
    @Default(false) bool isPasswordChanged,
    @Default(false) bool isRegisterFormValid,
    @Default(false) bool isAgreed,
    @Default("user") String selectedRole,
    AppErrorHandler? error,
    String? deviceToken,
    UserModel? user,
  }) = _AuthenticationState;

  // Initial state
  factory AuthenticationState.initial() => const AuthenticationState();
}
