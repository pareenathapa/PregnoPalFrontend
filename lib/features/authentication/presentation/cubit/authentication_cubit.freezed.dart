// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthenticationState {
  bool get loginCheckSuccess => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoggedIn => throw _privateConstructorUsedError;
  bool get isLoggedOut => throw _privateConstructorUsedError;
  bool get isRegisterSuccess => throw _privateConstructorUsedError;
  bool get isLoginFormValid => throw _privateConstructorUsedError;
  bool get isRegisterFormValid => throw _privateConstructorUsedError;
  bool get isAgreed => throw _privateConstructorUsedError;
  AppErrorHandler? get error => throw _privateConstructorUsedError;
  String? get deviceToken => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthenticationStateCopyWith<AuthenticationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
  @useResult
  $Res call(
      {bool loginCheckSuccess,
      bool isLoading,
      bool isLoggedIn,
      bool isLoggedOut,
      bool isRegisterSuccess,
      bool isLoginFormValid,
      bool isRegisterFormValid,
      bool isAgreed,
      AppErrorHandler? error,
      String? deviceToken,
      UserModel? user});

  $AppErrorHandlerCopyWith<$Res>? get error;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginCheckSuccess = null,
    Object? isLoading = null,
    Object? isLoggedIn = null,
    Object? isLoggedOut = null,
    Object? isRegisterSuccess = null,
    Object? isLoginFormValid = null,
    Object? isRegisterFormValid = null,
    Object? isAgreed = null,
    Object? error = freezed,
    Object? deviceToken = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      loginCheckSuccess: null == loginCheckSuccess
          ? _value.loginCheckSuccess
          : loginCheckSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedOut: null == isLoggedOut
          ? _value.isLoggedOut
          : isLoggedOut // ignore: cast_nullable_to_non_nullable
              as bool,
      isRegisterSuccess: null == isRegisterSuccess
          ? _value.isRegisterSuccess
          : isRegisterSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginFormValid: null == isLoginFormValid
          ? _value.isLoginFormValid
          : isLoginFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isRegisterFormValid: null == isRegisterFormValid
          ? _value.isRegisterFormValid
          : isRegisterFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isAgreed: null == isAgreed
          ? _value.isAgreed
          : isAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppErrorHandler?,
      deviceToken: freezed == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppErrorHandlerCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $AppErrorHandlerCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthenticationStateImplCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$$AuthenticationStateImplCopyWith(_$AuthenticationStateImpl value,
          $Res Function(_$AuthenticationStateImpl) then) =
      __$$AuthenticationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loginCheckSuccess,
      bool isLoading,
      bool isLoggedIn,
      bool isLoggedOut,
      bool isRegisterSuccess,
      bool isLoginFormValid,
      bool isRegisterFormValid,
      bool isAgreed,
      AppErrorHandler? error,
      String? deviceToken,
      UserModel? user});

  @override
  $AppErrorHandlerCopyWith<$Res>? get error;
}

/// @nodoc
class __$$AuthenticationStateImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$AuthenticationStateImpl>
    implements _$$AuthenticationStateImplCopyWith<$Res> {
  __$$AuthenticationStateImplCopyWithImpl(_$AuthenticationStateImpl _value,
      $Res Function(_$AuthenticationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginCheckSuccess = null,
    Object? isLoading = null,
    Object? isLoggedIn = null,
    Object? isLoggedOut = null,
    Object? isRegisterSuccess = null,
    Object? isLoginFormValid = null,
    Object? isRegisterFormValid = null,
    Object? isAgreed = null,
    Object? error = freezed,
    Object? deviceToken = freezed,
    Object? user = freezed,
  }) {
    return _then(_$AuthenticationStateImpl(
      loginCheckSuccess: null == loginCheckSuccess
          ? _value.loginCheckSuccess
          : loginCheckSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedOut: null == isLoggedOut
          ? _value.isLoggedOut
          : isLoggedOut // ignore: cast_nullable_to_non_nullable
              as bool,
      isRegisterSuccess: null == isRegisterSuccess
          ? _value.isRegisterSuccess
          : isRegisterSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginFormValid: null == isLoginFormValid
          ? _value.isLoginFormValid
          : isLoginFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isRegisterFormValid: null == isRegisterFormValid
          ? _value.isRegisterFormValid
          : isRegisterFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isAgreed: null == isAgreed
          ? _value.isAgreed
          : isAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppErrorHandler?,
      deviceToken: freezed == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

class _$AuthenticationStateImpl extends _AuthenticationState {
  const _$AuthenticationStateImpl(
      {this.loginCheckSuccess = false,
      this.isLoading = false,
      this.isLoggedIn = false,
      this.isLoggedOut = false,
      this.isRegisterSuccess = false,
      this.isLoginFormValid = false,
      this.isRegisterFormValid = false,
      this.isAgreed = false,
      this.error,
      this.deviceToken,
      this.user})
      : super._();

  @override
  @JsonKey()
  final bool loginCheckSuccess;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoggedIn;
  @override
  @JsonKey()
  final bool isLoggedOut;
  @override
  @JsonKey()
  final bool isRegisterSuccess;
  @override
  @JsonKey()
  final bool isLoginFormValid;
  @override
  @JsonKey()
  final bool isRegisterFormValid;
  @override
  @JsonKey()
  final bool isAgreed;
  @override
  final AppErrorHandler? error;
  @override
  final String? deviceToken;
  @override
  final UserModel? user;

  @override
  String toString() {
    return 'AuthenticationState(loginCheckSuccess: $loginCheckSuccess, isLoading: $isLoading, isLoggedIn: $isLoggedIn, isLoggedOut: $isLoggedOut, isRegisterSuccess: $isRegisterSuccess, isLoginFormValid: $isLoginFormValid, isRegisterFormValid: $isRegisterFormValid, isAgreed: $isAgreed, error: $error, deviceToken: $deviceToken, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationStateImpl &&
            (identical(other.loginCheckSuccess, loginCheckSuccess) ||
                other.loginCheckSuccess == loginCheckSuccess) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.isLoggedOut, isLoggedOut) ||
                other.isLoggedOut == isLoggedOut) &&
            (identical(other.isRegisterSuccess, isRegisterSuccess) ||
                other.isRegisterSuccess == isRegisterSuccess) &&
            (identical(other.isLoginFormValid, isLoginFormValid) ||
                other.isLoginFormValid == isLoginFormValid) &&
            (identical(other.isRegisterFormValid, isRegisterFormValid) ||
                other.isRegisterFormValid == isRegisterFormValid) &&
            (identical(other.isAgreed, isAgreed) ||
                other.isAgreed == isAgreed) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.deviceToken, deviceToken) ||
                other.deviceToken == deviceToken) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loginCheckSuccess,
      isLoading,
      isLoggedIn,
      isLoggedOut,
      isRegisterSuccess,
      isLoginFormValid,
      isRegisterFormValid,
      isAgreed,
      error,
      deviceToken,
      user);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationStateImplCopyWith<_$AuthenticationStateImpl> get copyWith =>
      __$$AuthenticationStateImplCopyWithImpl<_$AuthenticationStateImpl>(
          this, _$identity);
}

abstract class _AuthenticationState extends AuthenticationState {
  const factory _AuthenticationState(
      {final bool loginCheckSuccess,
      final bool isLoading,
      final bool isLoggedIn,
      final bool isLoggedOut,
      final bool isRegisterSuccess,
      final bool isLoginFormValid,
      final bool isRegisterFormValid,
      final bool isAgreed,
      final AppErrorHandler? error,
      final String? deviceToken,
      final UserModel? user}) = _$AuthenticationStateImpl;
  const _AuthenticationState._() : super._();

  @override
  bool get loginCheckSuccess;
  @override
  bool get isLoading;
  @override
  bool get isLoggedIn;
  @override
  bool get isLoggedOut;
  @override
  bool get isRegisterSuccess;
  @override
  bool get isLoginFormValid;
  @override
  bool get isRegisterFormValid;
  @override
  bool get isAgreed;
  @override
  AppErrorHandler? get error;
  @override
  String? get deviceToken;
  @override
  UserModel? get user;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticationStateImplCopyWith<_$AuthenticationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
