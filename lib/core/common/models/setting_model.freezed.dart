// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SettingModel _$SettingModelFromJson(Map<String, dynamic> json) {
  return _SettingModel.fromJson(json);
}

/// @nodoc
mixin _$SettingModel {
  @JsonKey(name: "has_opened")
  bool? get hasOpened => throw _privateConstructorUsedError;

  /// Serializes this SettingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SettingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingModelCopyWith<SettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingModelCopyWith<$Res> {
  factory $SettingModelCopyWith(
          SettingModel value, $Res Function(SettingModel) then) =
      _$SettingModelCopyWithImpl<$Res, SettingModel>;
  @useResult
  $Res call({@JsonKey(name: "has_opened") bool? hasOpened});
}

/// @nodoc
class _$SettingModelCopyWithImpl<$Res, $Val extends SettingModel>
    implements $SettingModelCopyWith<$Res> {
  _$SettingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasOpened = freezed,
  }) {
    return _then(_value.copyWith(
      hasOpened: freezed == hasOpened
          ? _value.hasOpened
          : hasOpened // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingModelImplCopyWith<$Res>
    implements $SettingModelCopyWith<$Res> {
  factory _$$SettingModelImplCopyWith(
          _$SettingModelImpl value, $Res Function(_$SettingModelImpl) then) =
      __$$SettingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "has_opened") bool? hasOpened});
}

/// @nodoc
class __$$SettingModelImplCopyWithImpl<$Res>
    extends _$SettingModelCopyWithImpl<$Res, _$SettingModelImpl>
    implements _$$SettingModelImplCopyWith<$Res> {
  __$$SettingModelImplCopyWithImpl(
      _$SettingModelImpl _value, $Res Function(_$SettingModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasOpened = freezed,
  }) {
    return _then(_$SettingModelImpl(
      hasOpened: freezed == hasOpened
          ? _value.hasOpened
          : hasOpened // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingModelImpl implements _SettingModel {
  const _$SettingModelImpl({@JsonKey(name: "has_opened") this.hasOpened});

  factory _$SettingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingModelImplFromJson(json);

  @override
  @JsonKey(name: "has_opened")
  final bool? hasOpened;

  @override
  String toString() {
    return 'SettingModel(hasOpened: $hasOpened)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingModelImpl &&
            (identical(other.hasOpened, hasOpened) ||
                other.hasOpened == hasOpened));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hasOpened);

  /// Create a copy of SettingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingModelImplCopyWith<_$SettingModelImpl> get copyWith =>
      __$$SettingModelImplCopyWithImpl<_$SettingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingModelImplToJson(
      this,
    );
  }
}

abstract class _SettingModel implements SettingModel {
  const factory _SettingModel(
          {@JsonKey(name: "has_opened") final bool? hasOpened}) =
      _$SettingModelImpl;

  factory _SettingModel.fromJson(Map<String, dynamic> json) =
      _$SettingModelImpl.fromJson;

  @override
  @JsonKey(name: "has_opened")
  bool? get hasOpened;

  /// Create a copy of SettingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingModelImplCopyWith<_$SettingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
