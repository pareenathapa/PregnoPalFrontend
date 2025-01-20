import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/common/feature/firebase/domain/usecase/get_device_token_usecase.dart';
import '../../../../core/failure/error_handler.dart';
import '../../../../core/utils/extensions/form_validator_extension.dart';
import '../../../../core/utils/token_storage.dart';
import '../../../../di/main_di.dart';
import '../../data/models/user_model.dart';
import '../../domain/usecase/login_usecase.dart';
import '../../domain/usecase/register_usecase.dart';
part 'authentication_state.dart';
part 'authentication_cubit.freezed.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final LoginUsecase _loginUsecase;
  final RegisterUsecase _registerUsecase;
  final GetDeviceTokenUsecase _getDeviceTokenUsecase;

  AuthenticationCubit({
    required LoginUsecase loginUsecase,
    required RegisterUsecase registerUsecase,
    required GetDeviceTokenUsecase getDeviceTokenUsecase,
  })  : _loginUsecase = loginUsecase,
        _registerUsecase = registerUsecase,
        _getDeviceTokenUsecase = getDeviceTokenUsecase,
        super(AuthenticationState.initial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        error: null,
      ),
    );
    final result =
        await _loginUsecase(LoginParams(email: email, password: password));
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            isLoggedIn: false,
            error: failure,
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            isLoading: false,
            isLoggedIn: true,
            error: null,
            user: success,
          ),
        );
      },
    );
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
    String? specialization,
    DateTime? availableFrom,
    DateTime? availableTo,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        error: null,
      ),
    );
    final result = await _registerUsecase(
      RegisterParams(
        email: email,
        password: password,
        name: name,
        role: state.selectedRole,
        specialization: specialization,
        availableFrom: availableFrom,
        availableTo: availableTo,
      ),
    );

    log(result.toString());
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            isRegisterSuccess: false,
            error: failure,
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            isLoading: false,
            isRegisterSuccess: true,
            error: null,
          ),
        );
      },
    );
  }

  Future<void> getDeviceToken() async {
    final result = await _getDeviceTokenUsecase(null);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            deviceToken: null,
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            deviceToken: success,
          ),
        );
      },
    );
  }

  void validateLoginForm({
    required String email,
    required String password,
  }) {
    final emailValidation = email.validateEmail();
    final passwordValidation = password.validatePassword();
    emit(
      state.copyWith(
        isLoginFormValid: emailValidation.isRight() &&
            passwordValidation.isRight() &&
            email.isNotEmpty &&
            password.isNotEmpty,
      ),
    );
  }

  void selectRole({
    required String role,
  }) {
    emit(
      state.copyWith(
        selectedRole: role,
      ),
    );
  }

  void validateRegisterForm({
    required String email,
    required String password,
    required String name,
    required String confirmPassword,
    String? specialization,
    DateTime? availableFrom,
    DateTime? availableTo,
  }) {
    final emailValidation = email.validateEmail();
    final passwordValidation = password.validatePassword();
    final nameValidation = name.validateName();
    final confirmPasswordValidation = confirmPassword.validateConfirmPassword(
      password,
    );
    if (state.selectedRole == 'doctor') {
      final specializationValidation = specialization!.validateNotEmpty(
        "Specialization",
      );
      emit(
        state.copyWith(
          isRegisterFormValid: emailValidation.isRight() &&
              passwordValidation.isRight() &&
              nameValidation.isRight() &&
              confirmPasswordValidation.isRight() &&
              specializationValidation.isRight() &&
              state.isAgreed,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        isRegisterFormValid: emailValidation.isRight() &&
            passwordValidation.isRight() &&
            nameValidation.isRight() &&
            confirmPasswordValidation.isRight() &&
            state.isAgreed,
      ),
    );
  }

  void agreeTermsAndConditions(bool value) {
    emit(
      state.copyWith(
        isAgreed: value,
      ),
    );
  }

  Future<void> logout() async {
    emit(
      state.copyWith(
        isLoading: true,
        error: null,
      ),
    );
    await locator<TokenStorage>().clearToken();
    log("Token Cleared");
    emit(
      state.copyWith(
        isLoggedOut: true,
      ),
    );
  }
}
