// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FavoriteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getFavoriteLoading,
    required TResult Function(
      List<Listing> listings,
      bool hasMore,
      bool isFromCache,
    )
    getFavoriteSuccess,
    required TResult Function(String error) getFavoriteError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getFavoriteLoading,
    TResult? Function(List<Listing> listings, bool hasMore, bool isFromCache)?
    getFavoriteSuccess,
    TResult? Function(String error)? getFavoriteError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getFavoriteLoading,
    TResult Function(List<Listing> listings, bool hasMore, bool isFromCache)?
    getFavoriteSuccess,
    TResult Function(String error)? getFavoriteError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteInitial value) initial,
    required TResult Function(GetFavoriteLoading value) getFavoriteLoading,
    required TResult Function(GetFavoriteSuccess value) getFavoriteSuccess,
    required TResult Function(GetFavoriteError value) getFavoriteError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteInitial value)? initial,
    TResult? Function(GetFavoriteLoading value)? getFavoriteLoading,
    TResult? Function(GetFavoriteSuccess value)? getFavoriteSuccess,
    TResult? Function(GetFavoriteError value)? getFavoriteError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteInitial value)? initial,
    TResult Function(GetFavoriteLoading value)? getFavoriteLoading,
    TResult Function(GetFavoriteSuccess value)? getFavoriteSuccess,
    TResult Function(GetFavoriteError value)? getFavoriteError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteStateCopyWith<$Res> {
  factory $FavoriteStateCopyWith(
    FavoriteState value,
    $Res Function(FavoriteState) then,
  ) = _$FavoriteStateCopyWithImpl<$Res, FavoriteState>;
}

/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res, $Val extends FavoriteState>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FavoriteInitialImplCopyWith<$Res> {
  factory _$$FavoriteInitialImplCopyWith(
    _$FavoriteInitialImpl value,
    $Res Function(_$FavoriteInitialImpl) then,
  ) = __$$FavoriteInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoriteInitialImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FavoriteInitialImpl>
    implements _$$FavoriteInitialImplCopyWith<$Res> {
  __$$FavoriteInitialImplCopyWithImpl(
    _$FavoriteInitialImpl _value,
    $Res Function(_$FavoriteInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FavoriteInitialImpl implements FavoriteInitial {
  const _$FavoriteInitialImpl();

  @override
  String toString() {
    return 'FavoriteState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FavoriteInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getFavoriteLoading,
    required TResult Function(
      List<Listing> listings,
      bool hasMore,
      bool isFromCache,
    )
    getFavoriteSuccess,
    required TResult Function(String error) getFavoriteError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getFavoriteLoading,
    TResult? Function(List<Listing> listings, bool hasMore, bool isFromCache)?
    getFavoriteSuccess,
    TResult? Function(String error)? getFavoriteError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getFavoriteLoading,
    TResult Function(List<Listing> listings, bool hasMore, bool isFromCache)?
    getFavoriteSuccess,
    TResult Function(String error)? getFavoriteError,
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
    required TResult Function(FavoriteInitial value) initial,
    required TResult Function(GetFavoriteLoading value) getFavoriteLoading,
    required TResult Function(GetFavoriteSuccess value) getFavoriteSuccess,
    required TResult Function(GetFavoriteError value) getFavoriteError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteInitial value)? initial,
    TResult? Function(GetFavoriteLoading value)? getFavoriteLoading,
    TResult? Function(GetFavoriteSuccess value)? getFavoriteSuccess,
    TResult? Function(GetFavoriteError value)? getFavoriteError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteInitial value)? initial,
    TResult Function(GetFavoriteLoading value)? getFavoriteLoading,
    TResult Function(GetFavoriteSuccess value)? getFavoriteSuccess,
    TResult Function(GetFavoriteError value)? getFavoriteError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FavoriteInitial implements FavoriteState {
  const factory FavoriteInitial() = _$FavoriteInitialImpl;
}

/// @nodoc
abstract class _$$GetFavoriteLoadingImplCopyWith<$Res> {
  factory _$$GetFavoriteLoadingImplCopyWith(
    _$GetFavoriteLoadingImpl value,
    $Res Function(_$GetFavoriteLoadingImpl) then,
  ) = __$$GetFavoriteLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetFavoriteLoadingImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$GetFavoriteLoadingImpl>
    implements _$$GetFavoriteLoadingImplCopyWith<$Res> {
  __$$GetFavoriteLoadingImplCopyWithImpl(
    _$GetFavoriteLoadingImpl _value,
    $Res Function(_$GetFavoriteLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetFavoriteLoadingImpl implements GetFavoriteLoading {
  const _$GetFavoriteLoadingImpl();

  @override
  String toString() {
    return 'FavoriteState.getFavoriteLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetFavoriteLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getFavoriteLoading,
    required TResult Function(
      List<Listing> listings,
      bool hasMore,
      bool isFromCache,
    )
    getFavoriteSuccess,
    required TResult Function(String error) getFavoriteError,
  }) {
    return getFavoriteLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getFavoriteLoading,
    TResult? Function(List<Listing> listings, bool hasMore, bool isFromCache)?
    getFavoriteSuccess,
    TResult? Function(String error)? getFavoriteError,
  }) {
    return getFavoriteLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getFavoriteLoading,
    TResult Function(List<Listing> listings, bool hasMore, bool isFromCache)?
    getFavoriteSuccess,
    TResult Function(String error)? getFavoriteError,
    required TResult orElse(),
  }) {
    if (getFavoriteLoading != null) {
      return getFavoriteLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteInitial value) initial,
    required TResult Function(GetFavoriteLoading value) getFavoriteLoading,
    required TResult Function(GetFavoriteSuccess value) getFavoriteSuccess,
    required TResult Function(GetFavoriteError value) getFavoriteError,
  }) {
    return getFavoriteLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteInitial value)? initial,
    TResult? Function(GetFavoriteLoading value)? getFavoriteLoading,
    TResult? Function(GetFavoriteSuccess value)? getFavoriteSuccess,
    TResult? Function(GetFavoriteError value)? getFavoriteError,
  }) {
    return getFavoriteLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteInitial value)? initial,
    TResult Function(GetFavoriteLoading value)? getFavoriteLoading,
    TResult Function(GetFavoriteSuccess value)? getFavoriteSuccess,
    TResult Function(GetFavoriteError value)? getFavoriteError,
    required TResult orElse(),
  }) {
    if (getFavoriteLoading != null) {
      return getFavoriteLoading(this);
    }
    return orElse();
  }
}

abstract class GetFavoriteLoading implements FavoriteState {
  const factory GetFavoriteLoading() = _$GetFavoriteLoadingImpl;
}

/// @nodoc
abstract class _$$GetFavoriteSuccessImplCopyWith<$Res> {
  factory _$$GetFavoriteSuccessImplCopyWith(
    _$GetFavoriteSuccessImpl value,
    $Res Function(_$GetFavoriteSuccessImpl) then,
  ) = __$$GetFavoriteSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Listing> listings, bool hasMore, bool isFromCache});
}

/// @nodoc
class __$$GetFavoriteSuccessImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$GetFavoriteSuccessImpl>
    implements _$$GetFavoriteSuccessImplCopyWith<$Res> {
  __$$GetFavoriteSuccessImplCopyWithImpl(
    _$GetFavoriteSuccessImpl _value,
    $Res Function(_$GetFavoriteSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listings = null,
    Object? hasMore = null,
    Object? isFromCache = null,
  }) {
    return _then(
      _$GetFavoriteSuccessImpl(
        listings:
            null == listings
                ? _value._listings
                : listings // ignore: cast_nullable_to_non_nullable
                    as List<Listing>,
        hasMore:
            null == hasMore
                ? _value.hasMore
                : hasMore // ignore: cast_nullable_to_non_nullable
                    as bool,
        isFromCache:
            null == isFromCache
                ? _value.isFromCache
                : isFromCache // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$GetFavoriteSuccessImpl implements GetFavoriteSuccess {
  const _$GetFavoriteSuccessImpl({
    required final List<Listing> listings,
    this.hasMore = true,
    this.isFromCache = false,
  }) : _listings = listings;

  final List<Listing> _listings;
  @override
  List<Listing> get listings {
    if (_listings is EqualUnmodifiableListView) return _listings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listings);
  }

  @override
  @JsonKey()
  final bool hasMore;
  @override
  @JsonKey()
  final bool isFromCache;

  @override
  String toString() {
    return 'FavoriteState.getFavoriteSuccess(listings: $listings, hasMore: $hasMore, isFromCache: $isFromCache)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFavoriteSuccessImpl &&
            const DeepCollectionEquality().equals(other._listings, _listings) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.isFromCache, isFromCache) ||
                other.isFromCache == isFromCache));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_listings),
    hasMore,
    isFromCache,
  );

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFavoriteSuccessImplCopyWith<_$GetFavoriteSuccessImpl> get copyWith =>
      __$$GetFavoriteSuccessImplCopyWithImpl<_$GetFavoriteSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getFavoriteLoading,
    required TResult Function(
      List<Listing> listings,
      bool hasMore,
      bool isFromCache,
    )
    getFavoriteSuccess,
    required TResult Function(String error) getFavoriteError,
  }) {
    return getFavoriteSuccess(listings, hasMore, isFromCache);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getFavoriteLoading,
    TResult? Function(List<Listing> listings, bool hasMore, bool isFromCache)?
    getFavoriteSuccess,
    TResult? Function(String error)? getFavoriteError,
  }) {
    return getFavoriteSuccess?.call(listings, hasMore, isFromCache);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getFavoriteLoading,
    TResult Function(List<Listing> listings, bool hasMore, bool isFromCache)?
    getFavoriteSuccess,
    TResult Function(String error)? getFavoriteError,
    required TResult orElse(),
  }) {
    if (getFavoriteSuccess != null) {
      return getFavoriteSuccess(listings, hasMore, isFromCache);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteInitial value) initial,
    required TResult Function(GetFavoriteLoading value) getFavoriteLoading,
    required TResult Function(GetFavoriteSuccess value) getFavoriteSuccess,
    required TResult Function(GetFavoriteError value) getFavoriteError,
  }) {
    return getFavoriteSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteInitial value)? initial,
    TResult? Function(GetFavoriteLoading value)? getFavoriteLoading,
    TResult? Function(GetFavoriteSuccess value)? getFavoriteSuccess,
    TResult? Function(GetFavoriteError value)? getFavoriteError,
  }) {
    return getFavoriteSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteInitial value)? initial,
    TResult Function(GetFavoriteLoading value)? getFavoriteLoading,
    TResult Function(GetFavoriteSuccess value)? getFavoriteSuccess,
    TResult Function(GetFavoriteError value)? getFavoriteError,
    required TResult orElse(),
  }) {
    if (getFavoriteSuccess != null) {
      return getFavoriteSuccess(this);
    }
    return orElse();
  }
}

abstract class GetFavoriteSuccess implements FavoriteState {
  const factory GetFavoriteSuccess({
    required final List<Listing> listings,
    final bool hasMore,
    final bool isFromCache,
  }) = _$GetFavoriteSuccessImpl;

  List<Listing> get listings;
  bool get hasMore;
  bool get isFromCache;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetFavoriteSuccessImplCopyWith<_$GetFavoriteSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetFavoriteErrorImplCopyWith<$Res> {
  factory _$$GetFavoriteErrorImplCopyWith(
    _$GetFavoriteErrorImpl value,
    $Res Function(_$GetFavoriteErrorImpl) then,
  ) = __$$GetFavoriteErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GetFavoriteErrorImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$GetFavoriteErrorImpl>
    implements _$$GetFavoriteErrorImplCopyWith<$Res> {
  __$$GetFavoriteErrorImplCopyWithImpl(
    _$GetFavoriteErrorImpl _value,
    $Res Function(_$GetFavoriteErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$GetFavoriteErrorImpl(
        null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$GetFavoriteErrorImpl implements GetFavoriteError {
  const _$GetFavoriteErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'FavoriteState.getFavoriteError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFavoriteErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFavoriteErrorImplCopyWith<_$GetFavoriteErrorImpl> get copyWith =>
      __$$GetFavoriteErrorImplCopyWithImpl<_$GetFavoriteErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getFavoriteLoading,
    required TResult Function(
      List<Listing> listings,
      bool hasMore,
      bool isFromCache,
    )
    getFavoriteSuccess,
    required TResult Function(String error) getFavoriteError,
  }) {
    return getFavoriteError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getFavoriteLoading,
    TResult? Function(List<Listing> listings, bool hasMore, bool isFromCache)?
    getFavoriteSuccess,
    TResult? Function(String error)? getFavoriteError,
  }) {
    return getFavoriteError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getFavoriteLoading,
    TResult Function(List<Listing> listings, bool hasMore, bool isFromCache)?
    getFavoriteSuccess,
    TResult Function(String error)? getFavoriteError,
    required TResult orElse(),
  }) {
    if (getFavoriteError != null) {
      return getFavoriteError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteInitial value) initial,
    required TResult Function(GetFavoriteLoading value) getFavoriteLoading,
    required TResult Function(GetFavoriteSuccess value) getFavoriteSuccess,
    required TResult Function(GetFavoriteError value) getFavoriteError,
  }) {
    return getFavoriteError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteInitial value)? initial,
    TResult? Function(GetFavoriteLoading value)? getFavoriteLoading,
    TResult? Function(GetFavoriteSuccess value)? getFavoriteSuccess,
    TResult? Function(GetFavoriteError value)? getFavoriteError,
  }) {
    return getFavoriteError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteInitial value)? initial,
    TResult Function(GetFavoriteLoading value)? getFavoriteLoading,
    TResult Function(GetFavoriteSuccess value)? getFavoriteSuccess,
    TResult Function(GetFavoriteError value)? getFavoriteError,
    required TResult orElse(),
  }) {
    if (getFavoriteError != null) {
      return getFavoriteError(this);
    }
    return orElse();
  }
}

abstract class GetFavoriteError implements FavoriteState {
  const factory GetFavoriteError(final String error) = _$GetFavoriteErrorImpl;

  String get error;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetFavoriteErrorImplCopyWith<_$GetFavoriteErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
