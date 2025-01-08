// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_handler.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppErrorHandler _$AppErrorHandlerFromJson(Map<String, dynamic> json) {
  return _AppErrorHandler.fromJson(json);
}

/// @nodoc
mixin _$AppErrorHandler {
  String get message => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;

  /// Serializes this AppErrorHandler to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppErrorHandler
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppErrorHandlerCopyWith<AppErrorHandler> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppErrorHandlerCopyWith<$Res> {
  factory $AppErrorHandlerCopyWith(
          AppErrorHandler value, $Res Function(AppErrorHandler) then) =
      _$AppErrorHandlerCopyWithImpl<$Res, AppErrorHandler>;
  @useResult
  $Res call({String message, String? code, String? data});
}

/// @nodoc
class _$AppErrorHandlerCopyWithImpl<$Res, $Val extends AppErrorHandler>
    implements $AppErrorHandlerCopyWith<$Res> {
  _$AppErrorHandlerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppErrorHandler
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppErrorHandlerImplCopyWith<$Res>
    implements $AppErrorHandlerCopyWith<$Res> {
  factory _$$AppErrorHandlerImplCopyWith(_$AppErrorHandlerImpl value,
          $Res Function(_$AppErrorHandlerImpl) then) =
      __$$AppErrorHandlerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? code, String? data});
}

/// @nodoc
class __$$AppErrorHandlerImplCopyWithImpl<$Res>
    extends _$AppErrorHandlerCopyWithImpl<$Res, _$AppErrorHandlerImpl>
    implements _$$AppErrorHandlerImplCopyWith<$Res> {
  __$$AppErrorHandlerImplCopyWithImpl(
      _$AppErrorHandlerImpl _value, $Res Function(_$AppErrorHandlerImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppErrorHandler
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$AppErrorHandlerImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppErrorHandlerImpl implements _AppErrorHandler {
  const _$AppErrorHandlerImpl({required this.message, this.code, this.data});

  factory _$AppErrorHandlerImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppErrorHandlerImplFromJson(json);

  @override
  final String message;
  @override
  final String? code;
  @override
  final String? data;

  @override
  String toString() {
    return 'AppErrorHandler(message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppErrorHandlerImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, code, data);

  /// Create a copy of AppErrorHandler
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppErrorHandlerImplCopyWith<_$AppErrorHandlerImpl> get copyWith =>
      __$$AppErrorHandlerImplCopyWithImpl<_$AppErrorHandlerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppErrorHandlerImplToJson(
      this,
    );
  }
}

abstract class _AppErrorHandler implements AppErrorHandler {
  const factory _AppErrorHandler(
      {required final String message,
      final String? code,
      final String? data}) = _$AppErrorHandlerImpl;

  factory _AppErrorHandler.fromJson(Map<String, dynamic> json) =
      _$AppErrorHandlerImpl.fromJson;

  @override
  String get message;
  @override
  String? get code;
  @override
  String? get data;

  /// Create a copy of AppErrorHandler
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppErrorHandlerImplCopyWith<_$AppErrorHandlerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
