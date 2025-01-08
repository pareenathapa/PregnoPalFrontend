// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppointmentState {
  bool get isLoading => throw _privateConstructorUsedError;
  AppErrorHandler? get error => throw _privateConstructorUsedError;
  dynamic get allAppointments => throw _privateConstructorUsedError;
  dynamic get appointmentDatesAndTimes => throw _privateConstructorUsedError;
  dynamic get selectedAppointment => throw _privateConstructorUsedError;
  bool get isAppointmentAdded => throw _privateConstructorUsedError;
  bool get isAppointmentDeleted => throw _privateConstructorUsedError;
  bool get isAppointmentUpdated => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentStateCopyWith<AppointmentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentStateCopyWith<$Res> {
  factory $AppointmentStateCopyWith(
          AppointmentState value, $Res Function(AppointmentState) then) =
      _$AppointmentStateCopyWithImpl<$Res, AppointmentState>;
  @useResult
  $Res call(
      {bool isLoading,
      AppErrorHandler? error,
      dynamic allAppointments,
      dynamic appointmentDatesAndTimes,
      dynamic selectedAppointment,
      bool isAppointmentAdded,
      bool isAppointmentDeleted,
      bool isAppointmentUpdated});

  $AppErrorHandlerCopyWith<$Res>? get error;
}

/// @nodoc
class _$AppointmentStateCopyWithImpl<$Res, $Val extends AppointmentState>
    implements $AppointmentStateCopyWith<$Res> {
  _$AppointmentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? allAppointments = freezed,
    Object? appointmentDatesAndTimes = freezed,
    Object? selectedAppointment = freezed,
    Object? isAppointmentAdded = null,
    Object? isAppointmentDeleted = null,
    Object? isAppointmentUpdated = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppErrorHandler?,
      allAppointments: freezed == allAppointments
          ? _value.allAppointments
          : allAppointments // ignore: cast_nullable_to_non_nullable
              as dynamic,
      appointmentDatesAndTimes: freezed == appointmentDatesAndTimes
          ? _value.appointmentDatesAndTimes
          : appointmentDatesAndTimes // ignore: cast_nullable_to_non_nullable
              as dynamic,
      selectedAppointment: freezed == selectedAppointment
          ? _value.selectedAppointment
          : selectedAppointment // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isAppointmentAdded: null == isAppointmentAdded
          ? _value.isAppointmentAdded
          : isAppointmentAdded // ignore: cast_nullable_to_non_nullable
              as bool,
      isAppointmentDeleted: null == isAppointmentDeleted
          ? _value.isAppointmentDeleted
          : isAppointmentDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isAppointmentUpdated: null == isAppointmentUpdated
          ? _value.isAppointmentUpdated
          : isAppointmentUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of AppointmentState
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
abstract class _$$AppointmentStateImplCopyWith<$Res>
    implements $AppointmentStateCopyWith<$Res> {
  factory _$$AppointmentStateImplCopyWith(_$AppointmentStateImpl value,
          $Res Function(_$AppointmentStateImpl) then) =
      __$$AppointmentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      AppErrorHandler? error,
      dynamic allAppointments,
      dynamic appointmentDatesAndTimes,
      dynamic selectedAppointment,
      bool isAppointmentAdded,
      bool isAppointmentDeleted,
      bool isAppointmentUpdated});

  @override
  $AppErrorHandlerCopyWith<$Res>? get error;
}

/// @nodoc
class __$$AppointmentStateImplCopyWithImpl<$Res>
    extends _$AppointmentStateCopyWithImpl<$Res, _$AppointmentStateImpl>
    implements _$$AppointmentStateImplCopyWith<$Res> {
  __$$AppointmentStateImplCopyWithImpl(_$AppointmentStateImpl _value,
      $Res Function(_$AppointmentStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppointmentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? allAppointments = freezed,
    Object? appointmentDatesAndTimes = freezed,
    Object? selectedAppointment = freezed,
    Object? isAppointmentAdded = null,
    Object? isAppointmentDeleted = null,
    Object? isAppointmentUpdated = null,
  }) {
    return _then(_$AppointmentStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppErrorHandler?,
      allAppointments: freezed == allAppointments
          ? _value.allAppointments
          : allAppointments // ignore: cast_nullable_to_non_nullable
              as dynamic,
      appointmentDatesAndTimes: freezed == appointmentDatesAndTimes
          ? _value.appointmentDatesAndTimes
          : appointmentDatesAndTimes // ignore: cast_nullable_to_non_nullable
              as dynamic,
      selectedAppointment: freezed == selectedAppointment
          ? _value.selectedAppointment
          : selectedAppointment // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isAppointmentAdded: null == isAppointmentAdded
          ? _value.isAppointmentAdded
          : isAppointmentAdded // ignore: cast_nullable_to_non_nullable
              as bool,
      isAppointmentDeleted: null == isAppointmentDeleted
          ? _value.isAppointmentDeleted
          : isAppointmentDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isAppointmentUpdated: null == isAppointmentUpdated
          ? _value.isAppointmentUpdated
          : isAppointmentUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppointmentStateImpl extends _AppointmentState {
  const _$AppointmentStateImpl(
      {this.isLoading = false,
      this.error,
      this.allAppointments,
      this.appointmentDatesAndTimes,
      this.selectedAppointment,
      this.isAppointmentAdded = false,
      this.isAppointmentDeleted = false,
      this.isAppointmentUpdated = false})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final AppErrorHandler? error;
  @override
  final dynamic allAppointments;
  @override
  final dynamic appointmentDatesAndTimes;
  @override
  final dynamic selectedAppointment;
  @override
  @JsonKey()
  final bool isAppointmentAdded;
  @override
  @JsonKey()
  final bool isAppointmentDeleted;
  @override
  @JsonKey()
  final bool isAppointmentUpdated;

  @override
  String toString() {
    return 'AppointmentState(isLoading: $isLoading, error: $error, allAppointments: $allAppointments, appointmentDatesAndTimes: $appointmentDatesAndTimes, selectedAppointment: $selectedAppointment, isAppointmentAdded: $isAppointmentAdded, isAppointmentDeleted: $isAppointmentDeleted, isAppointmentUpdated: $isAppointmentUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other.allAppointments, allAppointments) &&
            const DeepCollectionEquality().equals(
                other.appointmentDatesAndTimes, appointmentDatesAndTimes) &&
            const DeepCollectionEquality()
                .equals(other.selectedAppointment, selectedAppointment) &&
            (identical(other.isAppointmentAdded, isAppointmentAdded) ||
                other.isAppointmentAdded == isAppointmentAdded) &&
            (identical(other.isAppointmentDeleted, isAppointmentDeleted) ||
                other.isAppointmentDeleted == isAppointmentDeleted) &&
            (identical(other.isAppointmentUpdated, isAppointmentUpdated) ||
                other.isAppointmentUpdated == isAppointmentUpdated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      error,
      const DeepCollectionEquality().hash(allAppointments),
      const DeepCollectionEquality().hash(appointmentDatesAndTimes),
      const DeepCollectionEquality().hash(selectedAppointment),
      isAppointmentAdded,
      isAppointmentDeleted,
      isAppointmentUpdated);

  /// Create a copy of AppointmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentStateImplCopyWith<_$AppointmentStateImpl> get copyWith =>
      __$$AppointmentStateImplCopyWithImpl<_$AppointmentStateImpl>(
          this, _$identity);
}

abstract class _AppointmentState extends AppointmentState {
  const factory _AppointmentState(
      {final bool isLoading,
      final AppErrorHandler? error,
      final dynamic allAppointments,
      final dynamic appointmentDatesAndTimes,
      final dynamic selectedAppointment,
      final bool isAppointmentAdded,
      final bool isAppointmentDeleted,
      final bool isAppointmentUpdated}) = _$AppointmentStateImpl;
  const _AppointmentState._() : super._();

  @override
  bool get isLoading;
  @override
  AppErrorHandler? get error;
  @override
  dynamic get allAppointments;
  @override
  dynamic get appointmentDatesAndTimes;
  @override
  dynamic get selectedAppointment;
  @override
  bool get isAppointmentAdded;
  @override
  bool get isAppointmentDeleted;
  @override
  bool get isAppointmentUpdated;

  /// Create a copy of AppointmentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentStateImplCopyWith<_$AppointmentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
