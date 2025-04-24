// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OtpState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() otpLoading,
    required TResult Function(T data) otpSuccess,
    required TResult Function(String error) otpError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otpLoading,
    TResult? Function(T data)? otpSuccess,
    TResult? Function(String error)? otpError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otpLoading,
    TResult Function(T data)? otpSuccess,
    TResult Function(String error)? otpError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(OtpLoading<T> value) otpLoading,
    required TResult Function(OtpSuccess<T> value) otpSuccess,
    required TResult Function(OtpError<T> value) otpError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(OtpLoading<T> value)? otpLoading,
    TResult? Function(OtpSuccess<T> value)? otpSuccess,
    TResult? Function(OtpError<T> value)? otpError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(OtpLoading<T> value)? otpLoading,
    TResult Function(OtpSuccess<T> value)? otpSuccess,
    TResult Function(OtpError<T> value)? otpError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpStateCopyWith<T, $Res> {
  factory $OtpStateCopyWith(
    OtpState<T> value,
    $Res Function(OtpState<T>) then,
  ) = _$OtpStateCopyWithImpl<T, $Res, OtpState<T>>;
}

/// @nodoc
class _$OtpStateCopyWithImpl<T, $Res, $Val extends OtpState<T>>
    implements $OtpStateCopyWith<T, $Res> {
  _$OtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl<T> value,
    $Res Function(_$InitialImpl<T>) then,
  ) = __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$OtpStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl<T> _value,
    $Res Function(_$InitialImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'OtpState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() otpLoading,
    required TResult Function(T data) otpSuccess,
    required TResult Function(String error) otpError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otpLoading,
    TResult? Function(T data)? otpSuccess,
    TResult? Function(String error)? otpError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otpLoading,
    TResult Function(T data)? otpSuccess,
    TResult Function(String error)? otpError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(OtpLoading<T> value) otpLoading,
    required TResult Function(OtpSuccess<T> value) otpSuccess,
    required TResult Function(OtpError<T> value) otpError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(OtpLoading<T> value)? otpLoading,
    TResult? Function(OtpSuccess<T> value)? otpSuccess,
    TResult? Function(OtpError<T> value)? otpError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(OtpLoading<T> value)? otpLoading,
    TResult Function(OtpSuccess<T> value)? otpSuccess,
    TResult Function(OtpError<T> value)? otpError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements OtpState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$OtpLoadingImplCopyWith<T, $Res> {
  factory _$$OtpLoadingImplCopyWith(
    _$OtpLoadingImpl<T> value,
    $Res Function(_$OtpLoadingImpl<T>) then,
  ) = __$$OtpLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$OtpLoadingImplCopyWithImpl<T, $Res>
    extends _$OtpStateCopyWithImpl<T, $Res, _$OtpLoadingImpl<T>>
    implements _$$OtpLoadingImplCopyWith<T, $Res> {
  __$$OtpLoadingImplCopyWithImpl(
    _$OtpLoadingImpl<T> _value,
    $Res Function(_$OtpLoadingImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OtpLoadingImpl<T> implements OtpLoading<T> {
  const _$OtpLoadingImpl();

  @override
  String toString() {
    return 'OtpState<$T>.otpLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OtpLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() otpLoading,
    required TResult Function(T data) otpSuccess,
    required TResult Function(String error) otpError,
  }) {
    return otpLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otpLoading,
    TResult? Function(T data)? otpSuccess,
    TResult? Function(String error)? otpError,
  }) {
    return otpLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otpLoading,
    TResult Function(T data)? otpSuccess,
    TResult Function(String error)? otpError,
    required TResult orElse(),
  }) {
    if (otpLoading != null) {
      return otpLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(OtpLoading<T> value) otpLoading,
    required TResult Function(OtpSuccess<T> value) otpSuccess,
    required TResult Function(OtpError<T> value) otpError,
  }) {
    return otpLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(OtpLoading<T> value)? otpLoading,
    TResult? Function(OtpSuccess<T> value)? otpSuccess,
    TResult? Function(OtpError<T> value)? otpError,
  }) {
    return otpLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(OtpLoading<T> value)? otpLoading,
    TResult Function(OtpSuccess<T> value)? otpSuccess,
    TResult Function(OtpError<T> value)? otpError,
    required TResult orElse(),
  }) {
    if (otpLoading != null) {
      return otpLoading(this);
    }
    return orElse();
  }
}

abstract class OtpLoading<T> implements OtpState<T> {
  const factory OtpLoading() = _$OtpLoadingImpl<T>;
}

/// @nodoc
abstract class _$$OtpSuccessImplCopyWith<T, $Res> {
  factory _$$OtpSuccessImplCopyWith(
    _$OtpSuccessImpl<T> value,
    $Res Function(_$OtpSuccessImpl<T>) then,
  ) = __$$OtpSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$OtpSuccessImplCopyWithImpl<T, $Res>
    extends _$OtpStateCopyWithImpl<T, $Res, _$OtpSuccessImpl<T>>
    implements _$$OtpSuccessImplCopyWith<T, $Res> {
  __$$OtpSuccessImplCopyWithImpl(
    _$OtpSuccessImpl<T> _value,
    $Res Function(_$OtpSuccessImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed}) {
    return _then(
      _$OtpSuccessImpl<T>(
        freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                as T,
      ),
    );
  }
}

/// @nodoc

class _$OtpSuccessImpl<T> implements OtpSuccess<T> {
  const _$OtpSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'OtpState<$T>.otpSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpSuccessImplCopyWith<T, _$OtpSuccessImpl<T>> get copyWith =>
      __$$OtpSuccessImplCopyWithImpl<T, _$OtpSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() otpLoading,
    required TResult Function(T data) otpSuccess,
    required TResult Function(String error) otpError,
  }) {
    return otpSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otpLoading,
    TResult? Function(T data)? otpSuccess,
    TResult? Function(String error)? otpError,
  }) {
    return otpSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otpLoading,
    TResult Function(T data)? otpSuccess,
    TResult Function(String error)? otpError,
    required TResult orElse(),
  }) {
    if (otpSuccess != null) {
      return otpSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(OtpLoading<T> value) otpLoading,
    required TResult Function(OtpSuccess<T> value) otpSuccess,
    required TResult Function(OtpError<T> value) otpError,
  }) {
    return otpSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(OtpLoading<T> value)? otpLoading,
    TResult? Function(OtpSuccess<T> value)? otpSuccess,
    TResult? Function(OtpError<T> value)? otpError,
  }) {
    return otpSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(OtpLoading<T> value)? otpLoading,
    TResult Function(OtpSuccess<T> value)? otpSuccess,
    TResult Function(OtpError<T> value)? otpError,
    required TResult orElse(),
  }) {
    if (otpSuccess != null) {
      return otpSuccess(this);
    }
    return orElse();
  }
}

abstract class OtpSuccess<T> implements OtpState<T> {
  const factory OtpSuccess(final T data) = _$OtpSuccessImpl<T>;

  T get data;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpSuccessImplCopyWith<T, _$OtpSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtpErrorImplCopyWith<T, $Res> {
  factory _$$OtpErrorImplCopyWith(
    _$OtpErrorImpl<T> value,
    $Res Function(_$OtpErrorImpl<T>) then,
  ) = __$$OtpErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$OtpErrorImplCopyWithImpl<T, $Res>
    extends _$OtpStateCopyWithImpl<T, $Res, _$OtpErrorImpl<T>>
    implements _$$OtpErrorImplCopyWith<T, $Res> {
  __$$OtpErrorImplCopyWithImpl(
    _$OtpErrorImpl<T> _value,
    $Res Function(_$OtpErrorImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$OtpErrorImpl<T>(
        error:
            null == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$OtpErrorImpl<T> implements OtpError<T> {
  const _$OtpErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'OtpState<$T>.otpError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpErrorImplCopyWith<T, _$OtpErrorImpl<T>> get copyWith =>
      __$$OtpErrorImplCopyWithImpl<T, _$OtpErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() otpLoading,
    required TResult Function(T data) otpSuccess,
    required TResult Function(String error) otpError,
  }) {
    return otpError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otpLoading,
    TResult? Function(T data)? otpSuccess,
    TResult? Function(String error)? otpError,
  }) {
    return otpError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otpLoading,
    TResult Function(T data)? otpSuccess,
    TResult Function(String error)? otpError,
    required TResult orElse(),
  }) {
    if (otpError != null) {
      return otpError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(OtpLoading<T> value) otpLoading,
    required TResult Function(OtpSuccess<T> value) otpSuccess,
    required TResult Function(OtpError<T> value) otpError,
  }) {
    return otpError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(OtpLoading<T> value)? otpLoading,
    TResult? Function(OtpSuccess<T> value)? otpSuccess,
    TResult? Function(OtpError<T> value)? otpError,
  }) {
    return otpError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(OtpLoading<T> value)? otpLoading,
    TResult Function(OtpSuccess<T> value)? otpSuccess,
    TResult Function(OtpError<T> value)? otpError,
    required TResult orElse(),
  }) {
    if (otpError != null) {
      return otpError(this);
    }
    return orElse();
  }
}

abstract class OtpError<T> implements OtpState<T> {
  const factory OtpError({required final String error}) = _$OtpErrorImpl<T>;

  String get error;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpErrorImplCopyWith<T, _$OtpErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
