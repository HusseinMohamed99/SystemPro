// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LoginState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loginLoading,
    required TResult Function(T data) loginSuccess,
    required TResult Function(String error) loginError,
    required TResult Function(bool isValid) formValidityChanged,
    required TResult Function(bool isVisible) passwordVisibilityChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loginLoading,
    TResult? Function(T data)? loginSuccess,
    TResult? Function(String error)? loginError,
    TResult? Function(bool isValid)? formValidityChanged,
    TResult? Function(bool isVisible)? passwordVisibilityChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loginLoading,
    TResult Function(T data)? loginSuccess,
    TResult Function(String error)? loginError,
    TResult Function(bool isValid)? formValidityChanged,
    TResult Function(bool isVisible)? passwordVisibilityChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(LoginLoading<T> value) loginLoading,
    required TResult Function(LoginSuccess<T> value) loginSuccess,
    required TResult Function(LoginError<T> value) loginError,
    required TResult Function(FormValidityChanged<T> value) formValidityChanged,
    required TResult Function(PasswordVisibilityChanged<T> value)
    passwordVisibilityChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(LoginLoading<T> value)? loginLoading,
    TResult? Function(LoginSuccess<T> value)? loginSuccess,
    TResult? Function(LoginError<T> value)? loginError,
    TResult? Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult? Function(PasswordVisibilityChanged<T> value)?
    passwordVisibilityChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(LoginLoading<T> value)? loginLoading,
    TResult Function(LoginSuccess<T> value)? loginSuccess,
    TResult Function(LoginError<T> value)? loginError,
    TResult Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult Function(PasswordVisibilityChanged<T> value)?
    passwordVisibilityChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<T, $Res> {
  factory $LoginStateCopyWith(
    LoginState<T> value,
    $Res Function(LoginState<T>) then,
  ) = _$LoginStateCopyWithImpl<T, $Res, LoginState<T>>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<T, $Res, $Val extends LoginState<T>>
    implements $LoginStateCopyWith<T, $Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
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
    extends _$LoginStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl<T> _value,
    $Res Function(_$InitialImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'LoginState<$T>.initial()';
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
    required TResult Function() loginLoading,
    required TResult Function(T data) loginSuccess,
    required TResult Function(String error) loginError,
    required TResult Function(bool isValid) formValidityChanged,
    required TResult Function(bool isVisible) passwordVisibilityChanged,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loginLoading,
    TResult? Function(T data)? loginSuccess,
    TResult? Function(String error)? loginError,
    TResult? Function(bool isValid)? formValidityChanged,
    TResult? Function(bool isVisible)? passwordVisibilityChanged,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loginLoading,
    TResult Function(T data)? loginSuccess,
    TResult Function(String error)? loginError,
    TResult Function(bool isValid)? formValidityChanged,
    TResult Function(bool isVisible)? passwordVisibilityChanged,
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
    required TResult Function(LoginLoading<T> value) loginLoading,
    required TResult Function(LoginSuccess<T> value) loginSuccess,
    required TResult Function(LoginError<T> value) loginError,
    required TResult Function(FormValidityChanged<T> value) formValidityChanged,
    required TResult Function(PasswordVisibilityChanged<T> value)
    passwordVisibilityChanged,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(LoginLoading<T> value)? loginLoading,
    TResult? Function(LoginSuccess<T> value)? loginSuccess,
    TResult? Function(LoginError<T> value)? loginError,
    TResult? Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult? Function(PasswordVisibilityChanged<T> value)?
    passwordVisibilityChanged,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(LoginLoading<T> value)? loginLoading,
    TResult Function(LoginSuccess<T> value)? loginSuccess,
    TResult Function(LoginError<T> value)? loginError,
    TResult Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult Function(PasswordVisibilityChanged<T> value)?
    passwordVisibilityChanged,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements LoginState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$LoginLoadingImplCopyWith<T, $Res> {
  factory _$$LoginLoadingImplCopyWith(
    _$LoginLoadingImpl<T> value,
    $Res Function(_$LoginLoadingImpl<T>) then,
  ) = __$$LoginLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoginLoadingImplCopyWithImpl<T, $Res>
    extends _$LoginStateCopyWithImpl<T, $Res, _$LoginLoadingImpl<T>>
    implements _$$LoginLoadingImplCopyWith<T, $Res> {
  __$$LoginLoadingImplCopyWithImpl(
    _$LoginLoadingImpl<T> _value,
    $Res Function(_$LoginLoadingImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginLoadingImpl<T> implements LoginLoading<T> {
  const _$LoginLoadingImpl();

  @override
  String toString() {
    return 'LoginState<$T>.loginLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loginLoading,
    required TResult Function(T data) loginSuccess,
    required TResult Function(String error) loginError,
    required TResult Function(bool isValid) formValidityChanged,
    required TResult Function(bool isVisible) passwordVisibilityChanged,
  }) {
    return loginLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loginLoading,
    TResult? Function(T data)? loginSuccess,
    TResult? Function(String error)? loginError,
    TResult? Function(bool isValid)? formValidityChanged,
    TResult? Function(bool isVisible)? passwordVisibilityChanged,
  }) {
    return loginLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loginLoading,
    TResult Function(T data)? loginSuccess,
    TResult Function(String error)? loginError,
    TResult Function(bool isValid)? formValidityChanged,
    TResult Function(bool isVisible)? passwordVisibilityChanged,
    required TResult orElse(),
  }) {
    if (loginLoading != null) {
      return loginLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(LoginLoading<T> value) loginLoading,
    required TResult Function(LoginSuccess<T> value) loginSuccess,
    required TResult Function(LoginError<T> value) loginError,
    required TResult Function(FormValidityChanged<T> value) formValidityChanged,
    required TResult Function(PasswordVisibilityChanged<T> value)
    passwordVisibilityChanged,
  }) {
    return loginLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(LoginLoading<T> value)? loginLoading,
    TResult? Function(LoginSuccess<T> value)? loginSuccess,
    TResult? Function(LoginError<T> value)? loginError,
    TResult? Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult? Function(PasswordVisibilityChanged<T> value)?
    passwordVisibilityChanged,
  }) {
    return loginLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(LoginLoading<T> value)? loginLoading,
    TResult Function(LoginSuccess<T> value)? loginSuccess,
    TResult Function(LoginError<T> value)? loginError,
    TResult Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult Function(PasswordVisibilityChanged<T> value)?
    passwordVisibilityChanged,
    required TResult orElse(),
  }) {
    if (loginLoading != null) {
      return loginLoading(this);
    }
    return orElse();
  }
}

abstract class LoginLoading<T> implements LoginState<T> {
  const factory LoginLoading() = _$LoginLoadingImpl<T>;
}

/// @nodoc
abstract class _$$LoginSuccessImplCopyWith<T, $Res> {
  factory _$$LoginSuccessImplCopyWith(
    _$LoginSuccessImpl<T> value,
    $Res Function(_$LoginSuccessImpl<T>) then,
  ) = __$$LoginSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$LoginSuccessImplCopyWithImpl<T, $Res>
    extends _$LoginStateCopyWithImpl<T, $Res, _$LoginSuccessImpl<T>>
    implements _$$LoginSuccessImplCopyWith<T, $Res> {
  __$$LoginSuccessImplCopyWithImpl(
    _$LoginSuccessImpl<T> _value,
    $Res Function(_$LoginSuccessImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed}) {
    return _then(
      _$LoginSuccessImpl<T>(
        freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                as T,
      ),
    );
  }
}

/// @nodoc

class _$LoginSuccessImpl<T> implements LoginSuccess<T> {
  const _$LoginSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'LoginState<$T>.loginSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginSuccessImplCopyWith<T, _$LoginSuccessImpl<T>> get copyWith =>
      __$$LoginSuccessImplCopyWithImpl<T, _$LoginSuccessImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loginLoading,
    required TResult Function(T data) loginSuccess,
    required TResult Function(String error) loginError,
    required TResult Function(bool isValid) formValidityChanged,
    required TResult Function(bool isVisible) passwordVisibilityChanged,
  }) {
    return loginSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loginLoading,
    TResult? Function(T data)? loginSuccess,
    TResult? Function(String error)? loginError,
    TResult? Function(bool isValid)? formValidityChanged,
    TResult? Function(bool isVisible)? passwordVisibilityChanged,
  }) {
    return loginSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loginLoading,
    TResult Function(T data)? loginSuccess,
    TResult Function(String error)? loginError,
    TResult Function(bool isValid)? formValidityChanged,
    TResult Function(bool isVisible)? passwordVisibilityChanged,
    required TResult orElse(),
  }) {
    if (loginSuccess != null) {
      return loginSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(LoginLoading<T> value) loginLoading,
    required TResult Function(LoginSuccess<T> value) loginSuccess,
    required TResult Function(LoginError<T> value) loginError,
    required TResult Function(FormValidityChanged<T> value) formValidityChanged,
    required TResult Function(PasswordVisibilityChanged<T> value)
    passwordVisibilityChanged,
  }) {
    return loginSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(LoginLoading<T> value)? loginLoading,
    TResult? Function(LoginSuccess<T> value)? loginSuccess,
    TResult? Function(LoginError<T> value)? loginError,
    TResult? Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult? Function(PasswordVisibilityChanged<T> value)?
    passwordVisibilityChanged,
  }) {
    return loginSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(LoginLoading<T> value)? loginLoading,
    TResult Function(LoginSuccess<T> value)? loginSuccess,
    TResult Function(LoginError<T> value)? loginError,
    TResult Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult Function(PasswordVisibilityChanged<T> value)?
    passwordVisibilityChanged,
    required TResult orElse(),
  }) {
    if (loginSuccess != null) {
      return loginSuccess(this);
    }
    return orElse();
  }
}

abstract class LoginSuccess<T> implements LoginState<T> {
  const factory LoginSuccess(final T data) = _$LoginSuccessImpl<T>;

  T get data;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginSuccessImplCopyWith<T, _$LoginSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginErrorImplCopyWith<T, $Res> {
  factory _$$LoginErrorImplCopyWith(
    _$LoginErrorImpl<T> value,
    $Res Function(_$LoginErrorImpl<T>) then,
  ) = __$$LoginErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$LoginErrorImplCopyWithImpl<T, $Res>
    extends _$LoginStateCopyWithImpl<T, $Res, _$LoginErrorImpl<T>>
    implements _$$LoginErrorImplCopyWith<T, $Res> {
  __$$LoginErrorImplCopyWithImpl(
    _$LoginErrorImpl<T> _value,
    $Res Function(_$LoginErrorImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$LoginErrorImpl<T>(
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

class _$LoginErrorImpl<T> implements LoginError<T> {
  const _$LoginErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'LoginState<$T>.loginError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginErrorImplCopyWith<T, _$LoginErrorImpl<T>> get copyWith =>
      __$$LoginErrorImplCopyWithImpl<T, _$LoginErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loginLoading,
    required TResult Function(T data) loginSuccess,
    required TResult Function(String error) loginError,
    required TResult Function(bool isValid) formValidityChanged,
    required TResult Function(bool isVisible) passwordVisibilityChanged,
  }) {
    return loginError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loginLoading,
    TResult? Function(T data)? loginSuccess,
    TResult? Function(String error)? loginError,
    TResult? Function(bool isValid)? formValidityChanged,
    TResult? Function(bool isVisible)? passwordVisibilityChanged,
  }) {
    return loginError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loginLoading,
    TResult Function(T data)? loginSuccess,
    TResult Function(String error)? loginError,
    TResult Function(bool isValid)? formValidityChanged,
    TResult Function(bool isVisible)? passwordVisibilityChanged,
    required TResult orElse(),
  }) {
    if (loginError != null) {
      return loginError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(LoginLoading<T> value) loginLoading,
    required TResult Function(LoginSuccess<T> value) loginSuccess,
    required TResult Function(LoginError<T> value) loginError,
    required TResult Function(FormValidityChanged<T> value) formValidityChanged,
    required TResult Function(PasswordVisibilityChanged<T> value)
    passwordVisibilityChanged,
  }) {
    return loginError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(LoginLoading<T> value)? loginLoading,
    TResult? Function(LoginSuccess<T> value)? loginSuccess,
    TResult? Function(LoginError<T> value)? loginError,
    TResult? Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult? Function(PasswordVisibilityChanged<T> value)?
    passwordVisibilityChanged,
  }) {
    return loginError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(LoginLoading<T> value)? loginLoading,
    TResult Function(LoginSuccess<T> value)? loginSuccess,
    TResult Function(LoginError<T> value)? loginError,
    TResult Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult Function(PasswordVisibilityChanged<T> value)?
    passwordVisibilityChanged,
    required TResult orElse(),
  }) {
    if (loginError != null) {
      return loginError(this);
    }
    return orElse();
  }
}

abstract class LoginError<T> implements LoginState<T> {
  const factory LoginError({required final String error}) = _$LoginErrorImpl<T>;

  String get error;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginErrorImplCopyWith<T, _$LoginErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$LoginStateCopyWithImpl<T, $Res, _$FormValidityChangedImpl<T>>
    implements _$$FormValidityChangedImplCopyWith<T, $Res> {
  __$$FormValidityChangedImplCopyWithImpl(
    _$FormValidityChangedImpl<T> _value,
    $Res Function(_$FormValidityChangedImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginState
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
    return 'LoginState<$T>.formValidityChanged(isValid: $isValid)';
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

  /// Create a copy of LoginState
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
    required TResult Function() loginLoading,
    required TResult Function(T data) loginSuccess,
    required TResult Function(String error) loginError,
    required TResult Function(bool isValid) formValidityChanged,
    required TResult Function(bool isVisible) passwordVisibilityChanged,
  }) {
    return formValidityChanged(isValid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loginLoading,
    TResult? Function(T data)? loginSuccess,
    TResult? Function(String error)? loginError,
    TResult? Function(bool isValid)? formValidityChanged,
    TResult? Function(bool isVisible)? passwordVisibilityChanged,
  }) {
    return formValidityChanged?.call(isValid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loginLoading,
    TResult Function(T data)? loginSuccess,
    TResult Function(String error)? loginError,
    TResult Function(bool isValid)? formValidityChanged,
    TResult Function(bool isVisible)? passwordVisibilityChanged,
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
    required TResult Function(LoginLoading<T> value) loginLoading,
    required TResult Function(LoginSuccess<T> value) loginSuccess,
    required TResult Function(LoginError<T> value) loginError,
    required TResult Function(FormValidityChanged<T> value) formValidityChanged,
    required TResult Function(PasswordVisibilityChanged<T> value)
    passwordVisibilityChanged,
  }) {
    return formValidityChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(LoginLoading<T> value)? loginLoading,
    TResult? Function(LoginSuccess<T> value)? loginSuccess,
    TResult? Function(LoginError<T> value)? loginError,
    TResult? Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult? Function(PasswordVisibilityChanged<T> value)?
    passwordVisibilityChanged,
  }) {
    return formValidityChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(LoginLoading<T> value)? loginLoading,
    TResult Function(LoginSuccess<T> value)? loginSuccess,
    TResult Function(LoginError<T> value)? loginError,
    TResult Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult Function(PasswordVisibilityChanged<T> value)?
    passwordVisibilityChanged,
    required TResult orElse(),
  }) {
    if (formValidityChanged != null) {
      return formValidityChanged(this);
    }
    return orElse();
  }
}

abstract class FormValidityChanged<T> implements LoginState<T> {
  const factory FormValidityChanged(final bool isValid) =
      _$FormValidityChangedImpl<T>;

  bool get isValid;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormValidityChangedImplCopyWith<T, _$FormValidityChangedImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordVisibilityChangedImplCopyWith<T, $Res> {
  factory _$$PasswordVisibilityChangedImplCopyWith(
    _$PasswordVisibilityChangedImpl<T> value,
    $Res Function(_$PasswordVisibilityChangedImpl<T>) then,
  ) = __$$PasswordVisibilityChangedImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({bool isVisible});
}

/// @nodoc
class __$$PasswordVisibilityChangedImplCopyWithImpl<T, $Res>
    extends
        _$LoginStateCopyWithImpl<T, $Res, _$PasswordVisibilityChangedImpl<T>>
    implements _$$PasswordVisibilityChangedImplCopyWith<T, $Res> {
  __$$PasswordVisibilityChangedImplCopyWithImpl(
    _$PasswordVisibilityChangedImpl<T> _value,
    $Res Function(_$PasswordVisibilityChangedImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isVisible = null}) {
    return _then(
      _$PasswordVisibilityChangedImpl<T>(
        null == isVisible
            ? _value.isVisible
            : isVisible // ignore: cast_nullable_to_non_nullable
                as bool,
      ),
    );
  }
}

/// @nodoc

class _$PasswordVisibilityChangedImpl<T>
    implements PasswordVisibilityChanged<T> {
  const _$PasswordVisibilityChangedImpl(this.isVisible);

  @override
  final bool isVisible;

  @override
  String toString() {
    return 'LoginState<$T>.passwordVisibilityChanged(isVisible: $isVisible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordVisibilityChangedImpl<T> &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isVisible);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordVisibilityChangedImplCopyWith<
    T,
    _$PasswordVisibilityChangedImpl<T>
  >
  get copyWith => __$$PasswordVisibilityChangedImplCopyWithImpl<
    T,
    _$PasswordVisibilityChangedImpl<T>
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loginLoading,
    required TResult Function(T data) loginSuccess,
    required TResult Function(String error) loginError,
    required TResult Function(bool isValid) formValidityChanged,
    required TResult Function(bool isVisible) passwordVisibilityChanged,
  }) {
    return passwordVisibilityChanged(isVisible);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loginLoading,
    TResult? Function(T data)? loginSuccess,
    TResult? Function(String error)? loginError,
    TResult? Function(bool isValid)? formValidityChanged,
    TResult? Function(bool isVisible)? passwordVisibilityChanged,
  }) {
    return passwordVisibilityChanged?.call(isVisible);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loginLoading,
    TResult Function(T data)? loginSuccess,
    TResult Function(String error)? loginError,
    TResult Function(bool isValid)? formValidityChanged,
    TResult Function(bool isVisible)? passwordVisibilityChanged,
    required TResult orElse(),
  }) {
    if (passwordVisibilityChanged != null) {
      return passwordVisibilityChanged(isVisible);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(LoginLoading<T> value) loginLoading,
    required TResult Function(LoginSuccess<T> value) loginSuccess,
    required TResult Function(LoginError<T> value) loginError,
    required TResult Function(FormValidityChanged<T> value) formValidityChanged,
    required TResult Function(PasswordVisibilityChanged<T> value)
    passwordVisibilityChanged,
  }) {
    return passwordVisibilityChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(LoginLoading<T> value)? loginLoading,
    TResult? Function(LoginSuccess<T> value)? loginSuccess,
    TResult? Function(LoginError<T> value)? loginError,
    TResult? Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult? Function(PasswordVisibilityChanged<T> value)?
    passwordVisibilityChanged,
  }) {
    return passwordVisibilityChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(LoginLoading<T> value)? loginLoading,
    TResult Function(LoginSuccess<T> value)? loginSuccess,
    TResult Function(LoginError<T> value)? loginError,
    TResult Function(FormValidityChanged<T> value)? formValidityChanged,
    TResult Function(PasswordVisibilityChanged<T> value)?
    passwordVisibilityChanged,
    required TResult orElse(),
  }) {
    if (passwordVisibilityChanged != null) {
      return passwordVisibilityChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordVisibilityChanged<T> implements LoginState<T> {
  const factory PasswordVisibilityChanged(final bool isVisible) =
      _$PasswordVisibilityChangedImpl<T>;

  bool get isVisible;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordVisibilityChangedImplCopyWith<
    T,
    _$PasswordVisibilityChangedImpl<T>
  >
  get copyWith => throw _privateConstructorUsedError;
}
