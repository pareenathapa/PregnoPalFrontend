// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ArticleState {
  bool get isLoading => throw _privateConstructorUsedError;
  AppErrorHandler? get error => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;
  dynamic get selectedArticle => throw _privateConstructorUsedError;
  String get filter => throw _privateConstructorUsedError;
  bool get createdAticle => throw _privateConstructorUsedError;

  /// Create a copy of ArticleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArticleStateCopyWith<ArticleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleStateCopyWith<$Res> {
  factory $ArticleStateCopyWith(
          ArticleState value, $Res Function(ArticleState) then) =
      _$ArticleStateCopyWithImpl<$Res, ArticleState>;
  @useResult
  $Res call(
      {bool isLoading,
      AppErrorHandler? error,
      dynamic data,
      dynamic selectedArticle,
      String filter,
      bool createdAticle});

  $AppErrorHandlerCopyWith<$Res>? get error;
}

/// @nodoc
class _$ArticleStateCopyWithImpl<$Res, $Val extends ArticleState>
    implements $ArticleStateCopyWith<$Res> {
  _$ArticleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArticleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? data = freezed,
    Object? selectedArticle = freezed,
    Object? filter = null,
    Object? createdAticle = null,
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
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      selectedArticle: freezed == selectedArticle
          ? _value.selectedArticle
          : selectedArticle // ignore: cast_nullable_to_non_nullable
              as dynamic,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
      createdAticle: null == createdAticle
          ? _value.createdAticle
          : createdAticle // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of ArticleState
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
abstract class _$$ArticleStateImplCopyWith<$Res>
    implements $ArticleStateCopyWith<$Res> {
  factory _$$ArticleStateImplCopyWith(
          _$ArticleStateImpl value, $Res Function(_$ArticleStateImpl) then) =
      __$$ArticleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      AppErrorHandler? error,
      dynamic data,
      dynamic selectedArticle,
      String filter,
      bool createdAticle});

  @override
  $AppErrorHandlerCopyWith<$Res>? get error;
}

/// @nodoc
class __$$ArticleStateImplCopyWithImpl<$Res>
    extends _$ArticleStateCopyWithImpl<$Res, _$ArticleStateImpl>
    implements _$$ArticleStateImplCopyWith<$Res> {
  __$$ArticleStateImplCopyWithImpl(
      _$ArticleStateImpl _value, $Res Function(_$ArticleStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArticleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? data = freezed,
    Object? selectedArticle = freezed,
    Object? filter = null,
    Object? createdAticle = null,
  }) {
    return _then(_$ArticleStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppErrorHandler?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      selectedArticle: freezed == selectedArticle
          ? _value.selectedArticle
          : selectedArticle // ignore: cast_nullable_to_non_nullable
              as dynamic,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
      createdAticle: null == createdAticle
          ? _value.createdAticle
          : createdAticle // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ArticleStateImpl extends _ArticleState {
  const _$ArticleStateImpl(
      {this.isLoading = false,
      this.error,
      this.data,
      this.selectedArticle,
      this.filter = "newest",
      this.createdAticle = false})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final AppErrorHandler? error;
  @override
  final dynamic data;
  @override
  final dynamic selectedArticle;
  @override
  @JsonKey()
  final String filter;
  @override
  @JsonKey()
  final bool createdAticle;

  @override
  String toString() {
    return 'ArticleState(isLoading: $isLoading, error: $error, data: $data, selectedArticle: $selectedArticle, filter: $filter, createdAticle: $createdAticle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality()
                .equals(other.selectedArticle, selectedArticle) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.createdAticle, createdAticle) ||
                other.createdAticle == createdAticle));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      error,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(selectedArticle),
      filter,
      createdAticle);

  /// Create a copy of ArticleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleStateImplCopyWith<_$ArticleStateImpl> get copyWith =>
      __$$ArticleStateImplCopyWithImpl<_$ArticleStateImpl>(this, _$identity);
}

abstract class _ArticleState extends ArticleState {
  const factory _ArticleState(
      {final bool isLoading,
      final AppErrorHandler? error,
      final dynamic data,
      final dynamic selectedArticle,
      final String filter,
      final bool createdAticle}) = _$ArticleStateImpl;
  const _ArticleState._() : super._();

  @override
  bool get isLoading;
  @override
  AppErrorHandler? get error;
  @override
  dynamic get data;
  @override
  dynamic get selectedArticle;
  @override
  String get filter;
  @override
  bool get createdAticle;

  /// Create a copy of ArticleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArticleStateImplCopyWith<_$ArticleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
