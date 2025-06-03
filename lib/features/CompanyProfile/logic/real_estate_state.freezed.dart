// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'real_estate_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RealEstateState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Listing> filteredListings) filtered,
    required TResult Function(List<Listing> currentListings) loadingMore,
    required TResult Function(String error) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Listing> filteredListings)? filtered,
    TResult? Function(List<Listing> currentListings)? loadingMore,
    TResult? Function(String error)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Listing> filteredListings)? filtered,
    TResult Function(List<Listing> currentListings)? loadingMore,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(FilteredListingsLoading value) loading,
    required TResult Function(FilteredListingsSuccess value) filtered,
    required TResult Function(FilteredListingsLoadingMore value) loadingMore,
    required TResult Function(FilteredListingsError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(FilteredListingsLoading value)? loading,
    TResult? Function(FilteredListingsSuccess value)? filtered,
    TResult? Function(FilteredListingsLoadingMore value)? loadingMore,
    TResult? Function(FilteredListingsError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(FilteredListingsLoading value)? loading,
    TResult Function(FilteredListingsSuccess value)? filtered,
    TResult Function(FilteredListingsLoadingMore value)? loadingMore,
    TResult Function(FilteredListingsError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealEstateStateCopyWith<$Res> {
  factory $RealEstateStateCopyWith(
    RealEstateState value,
    $Res Function(RealEstateState) then,
  ) = _$RealEstateStateCopyWithImpl<$Res, RealEstateState>;
}

/// @nodoc
class _$RealEstateStateCopyWithImpl<$Res, $Val extends RealEstateState>
    implements $RealEstateStateCopyWith<$Res> {
  _$RealEstateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RealEstateState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RealEstateStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RealEstateState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'RealEstateState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Listing> filteredListings) filtered,
    required TResult Function(List<Listing> currentListings) loadingMore,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Listing> filteredListings)? filtered,
    TResult? Function(List<Listing> currentListings)? loadingMore,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Listing> filteredListings)? filtered,
    TResult Function(List<Listing> currentListings)? loadingMore,
    TResult Function(String error)? error,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(FilteredListingsLoading value) loading,
    required TResult Function(FilteredListingsSuccess value) filtered,
    required TResult Function(FilteredListingsLoadingMore value) loadingMore,
    required TResult Function(FilteredListingsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(FilteredListingsLoading value)? loading,
    TResult? Function(FilteredListingsSuccess value)? filtered,
    TResult? Function(FilteredListingsLoadingMore value)? loadingMore,
    TResult? Function(FilteredListingsError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(FilteredListingsLoading value)? loading,
    TResult Function(FilteredListingsSuccess value)? filtered,
    TResult Function(FilteredListingsLoadingMore value)? loadingMore,
    TResult Function(FilteredListingsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RealEstateState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$FilteredListingsLoadingImplCopyWith<$Res> {
  factory _$$FilteredListingsLoadingImplCopyWith(
    _$FilteredListingsLoadingImpl value,
    $Res Function(_$FilteredListingsLoadingImpl) then,
  ) = __$$FilteredListingsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FilteredListingsLoadingImplCopyWithImpl<$Res>
    extends _$RealEstateStateCopyWithImpl<$Res, _$FilteredListingsLoadingImpl>
    implements _$$FilteredListingsLoadingImplCopyWith<$Res> {
  __$$FilteredListingsLoadingImplCopyWithImpl(
    _$FilteredListingsLoadingImpl _value,
    $Res Function(_$FilteredListingsLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RealEstateState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FilteredListingsLoadingImpl implements FilteredListingsLoading {
  const _$FilteredListingsLoadingImpl();

  @override
  String toString() {
    return 'RealEstateState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilteredListingsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Listing> filteredListings) filtered,
    required TResult Function(List<Listing> currentListings) loadingMore,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Listing> filteredListings)? filtered,
    TResult? Function(List<Listing> currentListings)? loadingMore,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Listing> filteredListings)? filtered,
    TResult Function(List<Listing> currentListings)? loadingMore,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(FilteredListingsLoading value) loading,
    required TResult Function(FilteredListingsSuccess value) filtered,
    required TResult Function(FilteredListingsLoadingMore value) loadingMore,
    required TResult Function(FilteredListingsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(FilteredListingsLoading value)? loading,
    TResult? Function(FilteredListingsSuccess value)? filtered,
    TResult? Function(FilteredListingsLoadingMore value)? loadingMore,
    TResult? Function(FilteredListingsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(FilteredListingsLoading value)? loading,
    TResult Function(FilteredListingsSuccess value)? filtered,
    TResult Function(FilteredListingsLoadingMore value)? loadingMore,
    TResult Function(FilteredListingsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FilteredListingsLoading implements RealEstateState {
  const factory FilteredListingsLoading() = _$FilteredListingsLoadingImpl;
}

/// @nodoc
abstract class _$$FilteredListingsSuccessImplCopyWith<$Res> {
  factory _$$FilteredListingsSuccessImplCopyWith(
    _$FilteredListingsSuccessImpl value,
    $Res Function(_$FilteredListingsSuccessImpl) then,
  ) = __$$FilteredListingsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Listing> filteredListings});
}

/// @nodoc
class __$$FilteredListingsSuccessImplCopyWithImpl<$Res>
    extends _$RealEstateStateCopyWithImpl<$Res, _$FilteredListingsSuccessImpl>
    implements _$$FilteredListingsSuccessImplCopyWith<$Res> {
  __$$FilteredListingsSuccessImplCopyWithImpl(
    _$FilteredListingsSuccessImpl _value,
    $Res Function(_$FilteredListingsSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RealEstateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? filteredListings = null}) {
    return _then(
      _$FilteredListingsSuccessImpl(
        null == filteredListings
            ? _value._filteredListings
            : filteredListings // ignore: cast_nullable_to_non_nullable
                as List<Listing>,
      ),
    );
  }
}

/// @nodoc

class _$FilteredListingsSuccessImpl implements FilteredListingsSuccess {
  const _$FilteredListingsSuccessImpl(final List<Listing> filteredListings)
    : _filteredListings = filteredListings;

  final List<Listing> _filteredListings;
  @override
  List<Listing> get filteredListings {
    if (_filteredListings is EqualUnmodifiableListView)
      return _filteredListings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredListings);
  }

  @override
  String toString() {
    return 'RealEstateState.filtered(filteredListings: $filteredListings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilteredListingsSuccessImpl &&
            const DeepCollectionEquality().equals(
              other._filteredListings,
              _filteredListings,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_filteredListings),
  );

  /// Create a copy of RealEstateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilteredListingsSuccessImplCopyWith<_$FilteredListingsSuccessImpl>
  get copyWith => __$$FilteredListingsSuccessImplCopyWithImpl<
    _$FilteredListingsSuccessImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Listing> filteredListings) filtered,
    required TResult Function(List<Listing> currentListings) loadingMore,
    required TResult Function(String error) error,
  }) {
    return filtered(filteredListings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Listing> filteredListings)? filtered,
    TResult? Function(List<Listing> currentListings)? loadingMore,
    TResult? Function(String error)? error,
  }) {
    return filtered?.call(filteredListings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Listing> filteredListings)? filtered,
    TResult Function(List<Listing> currentListings)? loadingMore,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (filtered != null) {
      return filtered(filteredListings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(FilteredListingsLoading value) loading,
    required TResult Function(FilteredListingsSuccess value) filtered,
    required TResult Function(FilteredListingsLoadingMore value) loadingMore,
    required TResult Function(FilteredListingsError value) error,
  }) {
    return filtered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(FilteredListingsLoading value)? loading,
    TResult? Function(FilteredListingsSuccess value)? filtered,
    TResult? Function(FilteredListingsLoadingMore value)? loadingMore,
    TResult? Function(FilteredListingsError value)? error,
  }) {
    return filtered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(FilteredListingsLoading value)? loading,
    TResult Function(FilteredListingsSuccess value)? filtered,
    TResult Function(FilteredListingsLoadingMore value)? loadingMore,
    TResult Function(FilteredListingsError value)? error,
    required TResult orElse(),
  }) {
    if (filtered != null) {
      return filtered(this);
    }
    return orElse();
  }
}

abstract class FilteredListingsSuccess implements RealEstateState {
  const factory FilteredListingsSuccess(final List<Listing> filteredListings) =
      _$FilteredListingsSuccessImpl;

  List<Listing> get filteredListings;

  /// Create a copy of RealEstateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilteredListingsSuccessImplCopyWith<_$FilteredListingsSuccessImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilteredListingsLoadingMoreImplCopyWith<$Res> {
  factory _$$FilteredListingsLoadingMoreImplCopyWith(
    _$FilteredListingsLoadingMoreImpl value,
    $Res Function(_$FilteredListingsLoadingMoreImpl) then,
  ) = __$$FilteredListingsLoadingMoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Listing> currentListings});
}

/// @nodoc
class __$$FilteredListingsLoadingMoreImplCopyWithImpl<$Res>
    extends
        _$RealEstateStateCopyWithImpl<$Res, _$FilteredListingsLoadingMoreImpl>
    implements _$$FilteredListingsLoadingMoreImplCopyWith<$Res> {
  __$$FilteredListingsLoadingMoreImplCopyWithImpl(
    _$FilteredListingsLoadingMoreImpl _value,
    $Res Function(_$FilteredListingsLoadingMoreImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RealEstateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? currentListings = null}) {
    return _then(
      _$FilteredListingsLoadingMoreImpl(
        null == currentListings
            ? _value._currentListings
            : currentListings // ignore: cast_nullable_to_non_nullable
                as List<Listing>,
      ),
    );
  }
}

/// @nodoc

class _$FilteredListingsLoadingMoreImpl implements FilteredListingsLoadingMore {
  const _$FilteredListingsLoadingMoreImpl(final List<Listing> currentListings)
    : _currentListings = currentListings;

  final List<Listing> _currentListings;
  @override
  List<Listing> get currentListings {
    if (_currentListings is EqualUnmodifiableListView) return _currentListings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentListings);
  }

  @override
  String toString() {
    return 'RealEstateState.loadingMore(currentListings: $currentListings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilteredListingsLoadingMoreImpl &&
            const DeepCollectionEquality().equals(
              other._currentListings,
              _currentListings,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_currentListings),
  );

  /// Create a copy of RealEstateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilteredListingsLoadingMoreImplCopyWith<_$FilteredListingsLoadingMoreImpl>
  get copyWith => __$$FilteredListingsLoadingMoreImplCopyWithImpl<
    _$FilteredListingsLoadingMoreImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Listing> filteredListings) filtered,
    required TResult Function(List<Listing> currentListings) loadingMore,
    required TResult Function(String error) error,
  }) {
    return loadingMore(currentListings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Listing> filteredListings)? filtered,
    TResult? Function(List<Listing> currentListings)? loadingMore,
    TResult? Function(String error)? error,
  }) {
    return loadingMore?.call(currentListings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Listing> filteredListings)? filtered,
    TResult Function(List<Listing> currentListings)? loadingMore,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(currentListings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(FilteredListingsLoading value) loading,
    required TResult Function(FilteredListingsSuccess value) filtered,
    required TResult Function(FilteredListingsLoadingMore value) loadingMore,
    required TResult Function(FilteredListingsError value) error,
  }) {
    return loadingMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(FilteredListingsLoading value)? loading,
    TResult? Function(FilteredListingsSuccess value)? filtered,
    TResult? Function(FilteredListingsLoadingMore value)? loadingMore,
    TResult? Function(FilteredListingsError value)? error,
  }) {
    return loadingMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(FilteredListingsLoading value)? loading,
    TResult Function(FilteredListingsSuccess value)? filtered,
    TResult Function(FilteredListingsLoadingMore value)? loadingMore,
    TResult Function(FilteredListingsError value)? error,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(this);
    }
    return orElse();
  }
}

abstract class FilteredListingsLoadingMore implements RealEstateState {
  const factory FilteredListingsLoadingMore(
    final List<Listing> currentListings,
  ) = _$FilteredListingsLoadingMoreImpl;

  List<Listing> get currentListings;

  /// Create a copy of RealEstateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilteredListingsLoadingMoreImplCopyWith<_$FilteredListingsLoadingMoreImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilteredListingsErrorImplCopyWith<$Res> {
  factory _$$FilteredListingsErrorImplCopyWith(
    _$FilteredListingsErrorImpl value,
    $Res Function(_$FilteredListingsErrorImpl) then,
  ) = __$$FilteredListingsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FilteredListingsErrorImplCopyWithImpl<$Res>
    extends _$RealEstateStateCopyWithImpl<$Res, _$FilteredListingsErrorImpl>
    implements _$$FilteredListingsErrorImplCopyWith<$Res> {
  __$$FilteredListingsErrorImplCopyWithImpl(
    _$FilteredListingsErrorImpl _value,
    $Res Function(_$FilteredListingsErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RealEstateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$FilteredListingsErrorImpl(
        null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$FilteredListingsErrorImpl implements FilteredListingsError {
  const _$FilteredListingsErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'RealEstateState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilteredListingsErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of RealEstateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilteredListingsErrorImplCopyWith<_$FilteredListingsErrorImpl>
  get copyWith =>
      __$$FilteredListingsErrorImplCopyWithImpl<_$FilteredListingsErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Listing> filteredListings) filtered,
    required TResult Function(List<Listing> currentListings) loadingMore,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Listing> filteredListings)? filtered,
    TResult? Function(List<Listing> currentListings)? loadingMore,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Listing> filteredListings)? filtered,
    TResult Function(List<Listing> currentListings)? loadingMore,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(FilteredListingsLoading value) loading,
    required TResult Function(FilteredListingsSuccess value) filtered,
    required TResult Function(FilteredListingsLoadingMore value) loadingMore,
    required TResult Function(FilteredListingsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(FilteredListingsLoading value)? loading,
    TResult? Function(FilteredListingsSuccess value)? filtered,
    TResult? Function(FilteredListingsLoadingMore value)? loadingMore,
    TResult? Function(FilteredListingsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(FilteredListingsLoading value)? loading,
    TResult Function(FilteredListingsSuccess value)? filtered,
    TResult Function(FilteredListingsLoadingMore value)? loadingMore,
    TResult Function(FilteredListingsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FilteredListingsError implements RealEstateState {
  const factory FilteredListingsError(final String error) =
      _$FilteredListingsErrorImpl;

  String get error;

  /// Create a copy of RealEstateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilteredListingsErrorImplCopyWith<_$FilteredListingsErrorImpl>
  get copyWith => throw _privateConstructorUsedError;
}
