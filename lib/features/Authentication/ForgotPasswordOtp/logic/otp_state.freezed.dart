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
    required TResult Function(int secondsRemaining) timerTicking,
    required TResult Function() otpResendAvailable,
    required TResult Function(bool isValid) formValidityChanged,
    required TResult Function(bool isCompleted) inputCompletionChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otpLoading,
    TResult? Function(T data)? otpSuccess,
    TResult? Function(String error)? otpError,
    TResult? Function(int secondsRemaining)? timerTicking,
    TResult? Function()? otpResendAvailable,
    TResult? Function(bool isValid)? formValidityChanged,
    TResult? Function(bool isCompleted)? inputCompletionChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otpLoading,
    TResult Function(T data)? otpSuccess,
    TResult Function(String error)? otpError,
    TResult Function(int secondsRemaining)? timerTicking,
    TResult Function()? otpResendAvailable,
    TResult Function(bool isValid)? formValidityChanged,
    TResult Function(bool isCompleted)? inputCompletionChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(OtpLoading<T> value) otpLoading,
    required TResult Function(OtpSuccess<T> value) otpSuccess,
    required TResult Function(OtpError<T> value) otpError,
    required TResult Function(TimerTicking<T> value) timerTicking,
    required TResult Function(OtpResendAvailable<T> value) otpResendAvailable,
    required TResult Function(FormValidityChanged<T> value) formValidityChanged,
    required TResult Function(InputCompletionChanged<T> value)
    inputCompletionChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(OtpLoading<T> value)? otpLoading,
    TResult? Function(OtpSuccess<T> value)? otpSuccess,
    TResult? Function(OtpError<T> value)? otpError,
    TResult? Function(TimerTicking<T> value)? timerTicking,
    TResult? Function(OtpResendAvailable<T> value)? otpResendAvailable,
    TResult? Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult? Function(InputCompletionChanged<T> value)? inputCompletionChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(OtpLoading<T> value)? otpLoading,
    TResult Function(OtpSuccess<T> value)? otpSuccess,
    TResult Function(OtpError<T> value)? otpError,
    TResult Function(TimerTicking<T> value)? timerTicking,
    TResult Function(OtpResendAvailable<T> value)? otpResendAvailable,
    TResult Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult Function(InputCompletionChanged<T> value)? inputCompletionChanged,
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
    required TResult Function(int secondsRemaining) timerTicking,
    required TResult Function() otpResendAvailable,
    required TResult Function(bool isValid) formValidityChanged,
    required TResult Function(bool isCompleted) inputCompletionChanged,
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
    TResult? Function(int secondsRemaining)? timerTicking,
    TResult? Function()? otpResendAvailable,
    TResult? Function(bool isValid)? formValidityChanged,
    TResult? Function(bool isCompleted)? inputCompletionChanged,
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
    TResult Function(int secondsRemaining)? timerTicking,
    TResult Function()? otpResendAvailable,
    TResult Function(bool isValid)? formValidityChanged,
    TResult Function(bool isCompleted)? inputCompletionChanged,
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
    required TResult Function(TimerTicking<T> value) timerTicking,
    required TResult Function(OtpResendAvailable<T> value) otpResendAvailable,
    required TResult Function(FormValidityChanged<T> value) formValidityChanged,
    required TResult Function(InputCompletionChanged<T> value)
    inputCompletionChanged,
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
    TResult? Function(TimerTicking<T> value)? timerTicking,
    TResult? Function(OtpResendAvailable<T> value)? otpResendAvailable,
    TResult? Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult? Function(InputCompletionChanged<T> value)? inputCompletionChanged,
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
    TResult Function(TimerTicking<T> value)? timerTicking,
    TResult Function(OtpResendAvailable<T> value)? otpResendAvailable,
    TResult Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult Function(InputCompletionChanged<T> value)? inputCompletionChanged,
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
    required TResult Function(int secondsRemaining) timerTicking,
    required TResult Function() otpResendAvailable,
    required TResult Function(bool isValid) formValidityChanged,
    required TResult Function(bool isCompleted) inputCompletionChanged,
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
    TResult? Function(int secondsRemaining)? timerTicking,
    TResult? Function()? otpResendAvailable,
    TResult? Function(bool isValid)? formValidityChanged,
    TResult? Function(bool isCompleted)? inputCompletionChanged,
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
    TResult Function(int secondsRemaining)? timerTicking,
    TResult Function()? otpResendAvailable,
    TResult Function(bool isValid)? formValidityChanged,
    TResult Function(bool isCompleted)? inputCompletionChanged,
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
    required TResult Function(TimerTicking<T> value) timerTicking,
    required TResult Function(OtpResendAvailable<T> value) otpResendAvailable,
    required TResult Function(FormValidityChanged<T> value) formValidityChanged,
    required TResult Function(InputCompletionChanged<T> value)
    inputCompletionChanged,
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
    TResult? Function(TimerTicking<T> value)? timerTicking,
    TResult? Function(OtpResendAvailable<T> value)? otpResendAvailable,
    TResult? Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult? Function(InputCompletionChanged<T> value)? inputCompletionChanged,
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
    TResult Function(TimerTicking<T> value)? timerTicking,
    TResult Function(OtpResendAvailable<T> value)? otpResendAvailable,
    TResult Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult Function(InputCompletionChanged<T> value)? inputCompletionChanged,
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
    required TResult Function(int secondsRemaining) timerTicking,
    required TResult Function() otpResendAvailable,
    required TResult Function(bool isValid) formValidityChanged,
    required TResult Function(bool isCompleted) inputCompletionChanged,
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
    TResult? Function(int secondsRemaining)? timerTicking,
    TResult? Function()? otpResendAvailable,
    TResult? Function(bool isValid)? formValidityChanged,
    TResult? Function(bool isCompleted)? inputCompletionChanged,
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
    TResult Function(int secondsRemaining)? timerTicking,
    TResult Function()? otpResendAvailable,
    TResult Function(bool isValid)? formValidityChanged,
    TResult Function(bool isCompleted)? inputCompletionChanged,
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
    required TResult Function(TimerTicking<T> value) timerTicking,
    required TResult Function(OtpResendAvailable<T> value) otpResendAvailable,
    required TResult Function(FormValidityChanged<T> value) formValidityChanged,
    required TResult Function(InputCompletionChanged<T> value)
    inputCompletionChanged,
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
    TResult? Function(TimerTicking<T> value)? timerTicking,
    TResult? Function(OtpResendAvailable<T> value)? otpResendAvailable,
    TResult? Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult? Function(InputCompletionChanged<T> value)? inputCompletionChanged,
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
    TResult Function(TimerTicking<T> value)? timerTicking,
    TResult Function(OtpResendAvailable<T> value)? otpResendAvailable,
    TResult Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult Function(InputCompletionChanged<T> value)? inputCompletionChanged,
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
    required TResult Function(int secondsRemaining) timerTicking,
    required TResult Function() otpResendAvailable,
    required TResult Function(bool isValid) formValidityChanged,
    required TResult Function(bool isCompleted) inputCompletionChanged,
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
    TResult? Function(int secondsRemaining)? timerTicking,
    TResult? Function()? otpResendAvailable,
    TResult? Function(bool isValid)? formValidityChanged,
    TResult? Function(bool isCompleted)? inputCompletionChanged,
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
    TResult Function(int secondsRemaining)? timerTicking,
    TResult Function()? otpResendAvailable,
    TResult Function(bool isValid)? formValidityChanged,
    TResult Function(bool isCompleted)? inputCompletionChanged,
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
    required TResult Function(TimerTicking<T> value) timerTicking,
    required TResult Function(OtpResendAvailable<T> value) otpResendAvailable,
    required TResult Function(FormValidityChanged<T> value) formValidityChanged,
    required TResult Function(InputCompletionChanged<T> value)
    inputCompletionChanged,
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
    TResult? Function(TimerTicking<T> value)? timerTicking,
    TResult? Function(OtpResendAvailable<T> value)? otpResendAvailable,
    TResult? Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult? Function(InputCompletionChanged<T> value)? inputCompletionChanged,
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
    TResult Function(TimerTicking<T> value)? timerTicking,
    TResult Function(OtpResendAvailable<T> value)? otpResendAvailable,
    TResult Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult Function(InputCompletionChanged<T> value)? inputCompletionChanged,
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

/// @nodoc
abstract class _$$TimerTickingImplCopyWith<T, $Res> {
  factory _$$TimerTickingImplCopyWith(
    _$TimerTickingImpl<T> value,
    $Res Function(_$TimerTickingImpl<T>) then,
  ) = __$$TimerTickingImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({int secondsRemaining});
}

/// @nodoc
class __$$TimerTickingImplCopyWithImpl<T, $Res>
    extends _$OtpStateCopyWithImpl<T, $Res, _$TimerTickingImpl<T>>
    implements _$$TimerTickingImplCopyWith<T, $Res> {
  __$$TimerTickingImplCopyWithImpl(
    _$TimerTickingImpl<T> _value,
    $Res Function(_$TimerTickingImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? secondsRemaining = null}) {
    return _then(
      _$TimerTickingImpl<T>(
        null == secondsRemaining
            ? _value.secondsRemaining
            : secondsRemaining // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$TimerTickingImpl<T> implements TimerTicking<T> {
  const _$TimerTickingImpl(this.secondsRemaining);

  @override
  final int secondsRemaining;

  @override
  String toString() {
    return 'OtpState<$T>.timerTicking(secondsRemaining: $secondsRemaining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerTickingImpl<T> &&
            (identical(other.secondsRemaining, secondsRemaining) ||
                other.secondsRemaining == secondsRemaining));
  }

  @override
  int get hashCode => Object.hash(runtimeType, secondsRemaining);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerTickingImplCopyWith<T, _$TimerTickingImpl<T>> get copyWith =>
      __$$TimerTickingImplCopyWithImpl<T, _$TimerTickingImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() otpLoading,
    required TResult Function(T data) otpSuccess,
    required TResult Function(String error) otpError,
    required TResult Function(int secondsRemaining) timerTicking,
    required TResult Function() otpResendAvailable,
    required TResult Function(bool isValid) formValidityChanged,
    required TResult Function(bool isCompleted) inputCompletionChanged,
  }) {
    return timerTicking(secondsRemaining);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otpLoading,
    TResult? Function(T data)? otpSuccess,
    TResult? Function(String error)? otpError,
    TResult? Function(int secondsRemaining)? timerTicking,
    TResult? Function()? otpResendAvailable,
    TResult? Function(bool isValid)? formValidityChanged,
    TResult? Function(bool isCompleted)? inputCompletionChanged,
  }) {
    return timerTicking?.call(secondsRemaining);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otpLoading,
    TResult Function(T data)? otpSuccess,
    TResult Function(String error)? otpError,
    TResult Function(int secondsRemaining)? timerTicking,
    TResult Function()? otpResendAvailable,
    TResult Function(bool isValid)? formValidityChanged,
    TResult Function(bool isCompleted)? inputCompletionChanged,
    required TResult orElse(),
  }) {
    if (timerTicking != null) {
      return timerTicking(secondsRemaining);
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
    required TResult Function(TimerTicking<T> value) timerTicking,
    required TResult Function(OtpResendAvailable<T> value) otpResendAvailable,
    required TResult Function(FormValidityChanged<T> value) formValidityChanged,
    required TResult Function(InputCompletionChanged<T> value)
    inputCompletionChanged,
  }) {
    return timerTicking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(OtpLoading<T> value)? otpLoading,
    TResult? Function(OtpSuccess<T> value)? otpSuccess,
    TResult? Function(OtpError<T> value)? otpError,
    TResult? Function(TimerTicking<T> value)? timerTicking,
    TResult? Function(OtpResendAvailable<T> value)? otpResendAvailable,
    TResult? Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult? Function(InputCompletionChanged<T> value)? inputCompletionChanged,
  }) {
    return timerTicking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(OtpLoading<T> value)? otpLoading,
    TResult Function(OtpSuccess<T> value)? otpSuccess,
    TResult Function(OtpError<T> value)? otpError,
    TResult Function(TimerTicking<T> value)? timerTicking,
    TResult Function(OtpResendAvailable<T> value)? otpResendAvailable,
    TResult Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult Function(InputCompletionChanged<T> value)? inputCompletionChanged,
    required TResult orElse(),
  }) {
    if (timerTicking != null) {
      return timerTicking(this);
    }
    return orElse();
  }
}

abstract class TimerTicking<T> implements OtpState<T> {
  const factory TimerTicking(final int secondsRemaining) =
      _$TimerTickingImpl<T>;

  int get secondsRemaining;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerTickingImplCopyWith<T, _$TimerTickingImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtpResendAvailableImplCopyWith<T, $Res> {
  factory _$$OtpResendAvailableImplCopyWith(
    _$OtpResendAvailableImpl<T> value,
    $Res Function(_$OtpResendAvailableImpl<T>) then,
  ) = __$$OtpResendAvailableImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$OtpResendAvailableImplCopyWithImpl<T, $Res>
    extends _$OtpStateCopyWithImpl<T, $Res, _$OtpResendAvailableImpl<T>>
    implements _$$OtpResendAvailableImplCopyWith<T, $Res> {
  __$$OtpResendAvailableImplCopyWithImpl(
    _$OtpResendAvailableImpl<T> _value,
    $Res Function(_$OtpResendAvailableImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OtpResendAvailableImpl<T> implements OtpResendAvailable<T> {
  const _$OtpResendAvailableImpl();

  @override
  String toString() {
    return 'OtpState<$T>.otpResendAvailable()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpResendAvailableImpl<T>);
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
    required TResult Function(int secondsRemaining) timerTicking,
    required TResult Function() otpResendAvailable,
    required TResult Function(bool isValid) formValidityChanged,
    required TResult Function(bool isCompleted) inputCompletionChanged,
  }) {
    return otpResendAvailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otpLoading,
    TResult? Function(T data)? otpSuccess,
    TResult? Function(String error)? otpError,
    TResult? Function(int secondsRemaining)? timerTicking,
    TResult? Function()? otpResendAvailable,
    TResult? Function(bool isValid)? formValidityChanged,
    TResult? Function(bool isCompleted)? inputCompletionChanged,
  }) {
    return otpResendAvailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otpLoading,
    TResult Function(T data)? otpSuccess,
    TResult Function(String error)? otpError,
    TResult Function(int secondsRemaining)? timerTicking,
    TResult Function()? otpResendAvailable,
    TResult Function(bool isValid)? formValidityChanged,
    TResult Function(bool isCompleted)? inputCompletionChanged,
    required TResult orElse(),
  }) {
    if (otpResendAvailable != null) {
      return otpResendAvailable();
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
    required TResult Function(TimerTicking<T> value) timerTicking,
    required TResult Function(OtpResendAvailable<T> value) otpResendAvailable,
    required TResult Function(FormValidityChanged<T> value) formValidityChanged,
    required TResult Function(InputCompletionChanged<T> value)
    inputCompletionChanged,
  }) {
    return otpResendAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(OtpLoading<T> value)? otpLoading,
    TResult? Function(OtpSuccess<T> value)? otpSuccess,
    TResult? Function(OtpError<T> value)? otpError,
    TResult? Function(TimerTicking<T> value)? timerTicking,
    TResult? Function(OtpResendAvailable<T> value)? otpResendAvailable,
    TResult? Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult? Function(InputCompletionChanged<T> value)? inputCompletionChanged,
  }) {
    return otpResendAvailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(OtpLoading<T> value)? otpLoading,
    TResult Function(OtpSuccess<T> value)? otpSuccess,
    TResult Function(OtpError<T> value)? otpError,
    TResult Function(TimerTicking<T> value)? timerTicking,
    TResult Function(OtpResendAvailable<T> value)? otpResendAvailable,
    TResult Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult Function(InputCompletionChanged<T> value)? inputCompletionChanged,
    required TResult orElse(),
  }) {
    if (otpResendAvailable != null) {
      return otpResendAvailable(this);
    }
    return orElse();
  }
}

abstract class OtpResendAvailable<T> implements OtpState<T> {
  const factory OtpResendAvailable() = _$OtpResendAvailableImpl<T>;
}

/// @nodoc
abstract class _$$FormValidityChangedImplCopyWith<T, $Res> {
  factory _$$FormValidityChangedImplCopyWith(
    _$FormValidityChangedImpl<T> value,
    $Res Function(_$FormValidityChangedImpl<T>) then,
  ) = __$$FormValidityChangedImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({bool isValid});
}

/// @nodoc
class __$$FormValidityChangedImplCopyWithImpl<T, $Res>
    extends _$OtpStateCopyWithImpl<T, $Res, _$FormValidityChangedImpl<T>>
    implements _$$FormValidityChangedImplCopyWith<T, $Res> {
  __$$FormValidityChangedImplCopyWithImpl(
    _$FormValidityChangedImpl<T> _value,
    $Res Function(_$FormValidityChangedImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isValid = null}) {
    return _then(
      _$FormValidityChangedImpl<T>(
        null == isValid
            ? _value.isValid
            : isValid // ignore: cast_nullable_to_non_nullable
                as bool,
      ),
    );
  }
}

/// @nodoc

class _$FormValidityChangedImpl<T> implements FormValidityChanged<T> {
  const _$FormValidityChangedImpl(this.isValid);

  @override
  final bool isValid;

  @override
  String toString() {
    return 'OtpState<$T>.formValidityChanged(isValid: $isValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormValidityChangedImpl<T> &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isValid);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormValidityChangedImplCopyWith<T, _$FormValidityChangedImpl<T>>
  get copyWith =>
      __$$FormValidityChangedImplCopyWithImpl<T, _$FormValidityChangedImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() otpLoading,
    required TResult Function(T data) otpSuccess,
    required TResult Function(String error) otpError,
    required TResult Function(int secondsRemaining) timerTicking,
    required TResult Function() otpResendAvailable,
    required TResult Function(bool isValid) formValidityChanged,
    required TResult Function(bool isCompleted) inputCompletionChanged,
  }) {
    return formValidityChanged(isValid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otpLoading,
    TResult? Function(T data)? otpSuccess,
    TResult? Function(String error)? otpError,
    TResult? Function(int secondsRemaining)? timerTicking,
    TResult? Function()? otpResendAvailable,
    TResult? Function(bool isValid)? formValidityChanged,
    TResult? Function(bool isCompleted)? inputCompletionChanged,
  }) {
    return formValidityChanged?.call(isValid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otpLoading,
    TResult Function(T data)? otpSuccess,
    TResult Function(String error)? otpError,
    TResult Function(int secondsRemaining)? timerTicking,
    TResult Function()? otpResendAvailable,
    TResult Function(bool isValid)? formValidityChanged,
    TResult Function(bool isCompleted)? inputCompletionChanged,
    required TResult orElse(),
  }) {
    if (formValidityChanged != null) {
      return formValidityChanged(isValid);
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
    required TResult Function(TimerTicking<T> value) timerTicking,
    required TResult Function(OtpResendAvailable<T> value) otpResendAvailable,
    required TResult Function(FormValidityChanged<T> value) formValidityChanged,
    required TResult Function(InputCompletionChanged<T> value)
    inputCompletionChanged,
  }) {
    return formValidityChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(OtpLoading<T> value)? otpLoading,
    TResult? Function(OtpSuccess<T> value)? otpSuccess,
    TResult? Function(OtpError<T> value)? otpError,
    TResult? Function(TimerTicking<T> value)? timerTicking,
    TResult? Function(OtpResendAvailable<T> value)? otpResendAvailable,
    TResult? Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult? Function(InputCompletionChanged<T> value)? inputCompletionChanged,
  }) {
    return formValidityChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(OtpLoading<T> value)? otpLoading,
    TResult Function(OtpSuccess<T> value)? otpSuccess,
    TResult Function(OtpError<T> value)? otpError,
    TResult Function(TimerTicking<T> value)? timerTicking,
    TResult Function(OtpResendAvailable<T> value)? otpResendAvailable,
    TResult Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult Function(InputCompletionChanged<T> value)? inputCompletionChanged,
    required TResult orElse(),
  }) {
    if (formValidityChanged != null) {
      return formValidityChanged(this);
    }
    return orElse();
  }
}

abstract class FormValidityChanged<T> implements OtpState<T> {
  const factory FormValidityChanged(final bool isValid) =
      _$FormValidityChangedImpl<T>;

  bool get isValid;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormValidityChangedImplCopyWith<T, _$FormValidityChangedImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InputCompletionChangedImplCopyWith<T, $Res> {
  factory _$$InputCompletionChangedImplCopyWith(
    _$InputCompletionChangedImpl<T> value,
    $Res Function(_$InputCompletionChangedImpl<T>) then,
  ) = __$$InputCompletionChangedImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({bool isCompleted});
}

/// @nodoc
class __$$InputCompletionChangedImplCopyWithImpl<T, $Res>
    extends _$OtpStateCopyWithImpl<T, $Res, _$InputCompletionChangedImpl<T>>
    implements _$$InputCompletionChangedImplCopyWith<T, $Res> {
  __$$InputCompletionChangedImplCopyWithImpl(
    _$InputCompletionChangedImpl<T> _value,
    $Res Function(_$InputCompletionChangedImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isCompleted = null}) {
    return _then(
      _$InputCompletionChangedImpl<T>(
        isCompleted:
            null == isCompleted
                ? _value.isCompleted
                : isCompleted // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$InputCompletionChangedImpl<T> implements InputCompletionChanged<T> {
  const _$InputCompletionChangedImpl({required this.isCompleted});

  @override
  final bool isCompleted;

  @override
  String toString() {
    return 'OtpState<$T>.inputCompletionChanged(isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputCompletionChangedImpl<T> &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isCompleted);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InputCompletionChangedImplCopyWith<T, _$InputCompletionChangedImpl<T>>
  get copyWith => __$$InputCompletionChangedImplCopyWithImpl<
    T,
    _$InputCompletionChangedImpl<T>
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() otpLoading,
    required TResult Function(T data) otpSuccess,
    required TResult Function(String error) otpError,
    required TResult Function(int secondsRemaining) timerTicking,
    required TResult Function() otpResendAvailable,
    required TResult Function(bool isValid) formValidityChanged,
    required TResult Function(bool isCompleted) inputCompletionChanged,
  }) {
    return inputCompletionChanged(isCompleted);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otpLoading,
    TResult? Function(T data)? otpSuccess,
    TResult? Function(String error)? otpError,
    TResult? Function(int secondsRemaining)? timerTicking,
    TResult? Function()? otpResendAvailable,
    TResult? Function(bool isValid)? formValidityChanged,
    TResult? Function(bool isCompleted)? inputCompletionChanged,
  }) {
    return inputCompletionChanged?.call(isCompleted);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otpLoading,
    TResult Function(T data)? otpSuccess,
    TResult Function(String error)? otpError,
    TResult Function(int secondsRemaining)? timerTicking,
    TResult Function()? otpResendAvailable,
    TResult Function(bool isValid)? formValidityChanged,
    TResult Function(bool isCompleted)? inputCompletionChanged,
    required TResult orElse(),
  }) {
    if (inputCompletionChanged != null) {
      return inputCompletionChanged(isCompleted);
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
    required TResult Function(TimerTicking<T> value) timerTicking,
    required TResult Function(OtpResendAvailable<T> value) otpResendAvailable,
    required TResult Function(FormValidityChanged<T> value) formValidityChanged,
    required TResult Function(InputCompletionChanged<T> value)
    inputCompletionChanged,
  }) {
    return inputCompletionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(OtpLoading<T> value)? otpLoading,
    TResult? Function(OtpSuccess<T> value)? otpSuccess,
    TResult? Function(OtpError<T> value)? otpError,
    TResult? Function(TimerTicking<T> value)? timerTicking,
    TResult? Function(OtpResendAvailable<T> value)? otpResendAvailable,
    TResult? Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult? Function(InputCompletionChanged<T> value)? inputCompletionChanged,
  }) {
    return inputCompletionChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(OtpLoading<T> value)? otpLoading,
    TResult Function(OtpSuccess<T> value)? otpSuccess,
    TResult Function(OtpError<T> value)? otpError,
    TResult Function(TimerTicking<T> value)? timerTicking,
    TResult Function(OtpResendAvailable<T> value)? otpResendAvailable,
    TResult Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult Function(InputCompletionChanged<T> value)? inputCompletionChanged,
    required TResult orElse(),
  }) {
    if (inputCompletionChanged != null) {
      return inputCompletionChanged(this);
    }
    return orElse();
  }
}

abstract class InputCompletionChanged<T> implements OtpState<T> {
  const factory InputCompletionChanged({required final bool isCompleted}) =
      _$InputCompletionChangedImpl<T>;

  bool get isCompleted;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InputCompletionChangedImplCopyWith<T, _$InputCompletionChangedImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}
