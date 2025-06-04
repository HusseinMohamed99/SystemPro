// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marketplace_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MarketplaceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<Listing> listings,
      String selectedFilter,
      SortType selectedSort,
    )
    success,
    required TResult Function(String error) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<Listing> listings,
      String selectedFilter,
      SortType selectedSort,
    )?
    success,
    TResult? Function(String error)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<Listing> listings,
      String selectedFilter,
      SortType selectedSort,
    )?
    success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MarketPlaceInitial value) initial,
    required TResult Function(MarketPlaceLoading value) loading,
    required TResult Function(MarketPlaceSuccess value) success,
    required TResult Function(MarketPlaceError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MarketPlaceInitial value)? initial,
    TResult? Function(MarketPlaceLoading value)? loading,
    TResult? Function(MarketPlaceSuccess value)? success,
    TResult? Function(MarketPlaceError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MarketPlaceInitial value)? initial,
    TResult Function(MarketPlaceLoading value)? loading,
    TResult Function(MarketPlaceSuccess value)? success,
    TResult Function(MarketPlaceError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketplaceStateCopyWith<$Res> {
  factory $MarketplaceStateCopyWith(
    MarketplaceState value,
    $Res Function(MarketplaceState) then,
  ) = _$MarketplaceStateCopyWithImpl<$Res, MarketplaceState>;
}

/// @nodoc
class _$MarketplaceStateCopyWithImpl<$Res, $Val extends MarketplaceState>
    implements $MarketplaceStateCopyWith<$Res> {
  _$MarketplaceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarketplaceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MarketPlaceInitialImplCopyWith<$Res> {
  factory _$$MarketPlaceInitialImplCopyWith(
    _$MarketPlaceInitialImpl value,
    $Res Function(_$MarketPlaceInitialImpl) then,
  ) = __$$MarketPlaceInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarketPlaceInitialImplCopyWithImpl<$Res>
    extends _$MarketplaceStateCopyWithImpl<$Res, _$MarketPlaceInitialImpl>
    implements _$$MarketPlaceInitialImplCopyWith<$Res> {
  __$$MarketPlaceInitialImplCopyWithImpl(
    _$MarketPlaceInitialImpl _value,
    $Res Function(_$MarketPlaceInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MarketplaceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MarketPlaceInitialImpl implements MarketPlaceInitial {
  const _$MarketPlaceInitialImpl();

  @override
  String toString() {
    return 'MarketplaceState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MarketPlaceInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<Listing> listings,
      String selectedFilter,
      SortType selectedSort,
    )
    success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<Listing> listings,
      String selectedFilter,
      SortType selectedSort,
    )?
    success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<Listing> listings,
      String selectedFilter,
      SortType selectedSort,
    )?
    success,
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
    required TResult Function(MarketPlaceInitial value) initial,
    required TResult Function(MarketPlaceLoading value) loading,
    required TResult Function(MarketPlaceSuccess value) success,
    required TResult Function(MarketPlaceError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MarketPlaceInitial value)? initial,
    TResult? Function(MarketPlaceLoading value)? loading,
    TResult? Function(MarketPlaceSuccess value)? success,
    TResult? Function(MarketPlaceError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MarketPlaceInitial value)? initial,
    TResult Function(MarketPlaceLoading value)? loading,
    TResult Function(MarketPlaceSuccess value)? success,
    TResult Function(MarketPlaceError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MarketPlaceInitial implements MarketplaceState {
  const factory MarketPlaceInitial() = _$MarketPlaceInitialImpl;
}

/// @nodoc
abstract class _$$MarketPlaceLoadingImplCopyWith<$Res> {
  factory _$$MarketPlaceLoadingImplCopyWith(
    _$MarketPlaceLoadingImpl value,
    $Res Function(_$MarketPlaceLoadingImpl) then,
  ) = __$$MarketPlaceLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarketPlaceLoadingImplCopyWithImpl<$Res>
    extends _$MarketplaceStateCopyWithImpl<$Res, _$MarketPlaceLoadingImpl>
    implements _$$MarketPlaceLoadingImplCopyWith<$Res> {
  __$$MarketPlaceLoadingImplCopyWithImpl(
    _$MarketPlaceLoadingImpl _value,
    $Res Function(_$MarketPlaceLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MarketplaceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MarketPlaceLoadingImpl implements MarketPlaceLoading {
  const _$MarketPlaceLoadingImpl();

  @override
  String toString() {
    return 'MarketplaceState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MarketPlaceLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<Listing> listings,
      String selectedFilter,
      SortType selectedSort,
    )
    success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<Listing> listings,
      String selectedFilter,
      SortType selectedSort,
    )?
    success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<Listing> listings,
      String selectedFilter,
      SortType selectedSort,
    )?
    success,
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
    required TResult Function(MarketPlaceInitial value) initial,
    required TResult Function(MarketPlaceLoading value) loading,
    required TResult Function(MarketPlaceSuccess value) success,
    required TResult Function(MarketPlaceError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MarketPlaceInitial value)? initial,
    TResult? Function(MarketPlaceLoading value)? loading,
    TResult? Function(MarketPlaceSuccess value)? success,
    TResult? Function(MarketPlaceError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MarketPlaceInitial value)? initial,
    TResult Function(MarketPlaceLoading value)? loading,
    TResult Function(MarketPlaceSuccess value)? success,
    TResult Function(MarketPlaceError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MarketPlaceLoading implements MarketplaceState {
  const factory MarketPlaceLoading() = _$MarketPlaceLoadingImpl;
}

/// @nodoc
abstract class _$$MarketPlaceSuccessImplCopyWith<$Res> {
  factory _$$MarketPlaceSuccessImplCopyWith(
    _$MarketPlaceSuccessImpl value,
    $Res Function(_$MarketPlaceSuccessImpl) then,
  ) = __$$MarketPlaceSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    List<Listing> listings,
    String selectedFilter,
    SortType selectedSort,
  });
}

/// @nodoc
class __$$MarketPlaceSuccessImplCopyWithImpl<$Res>
    extends _$MarketplaceStateCopyWithImpl<$Res, _$MarketPlaceSuccessImpl>
    implements _$$MarketPlaceSuccessImplCopyWith<$Res> {
  __$$MarketPlaceSuccessImplCopyWithImpl(
    _$MarketPlaceSuccessImpl _value,
    $Res Function(_$MarketPlaceSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MarketplaceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listings = null,
    Object? selectedFilter = null,
    Object? selectedSort = null,
  }) {
    return _then(
      _$MarketPlaceSuccessImpl(
        listings:
            null == listings
                ? _value._listings
                : listings // ignore: cast_nullable_to_non_nullable
                    as List<Listing>,
        selectedFilter:
            null == selectedFilter
                ? _value.selectedFilter
                : selectedFilter // ignore: cast_nullable_to_non_nullable
                    as String,
        selectedSort:
            null == selectedSort
                ? _value.selectedSort
                : selectedSort // ignore: cast_nullable_to_non_nullable
                    as SortType,
      ),
    );
  }
}

/// @nodoc

class _$MarketPlaceSuccessImpl implements MarketPlaceSuccess {
  const _$MarketPlaceSuccessImpl({
    required final List<Listing> listings,
    required this.selectedFilter,
    required this.selectedSort,
  }) : _listings = listings;

  final List<Listing> _listings;
  @override
  List<Listing> get listings {
    if (_listings is EqualUnmodifiableListView) return _listings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listings);
  }

  @override
  final String selectedFilter;
  @override
  final SortType selectedSort;

  @override
  String toString() {
    return 'MarketplaceState.success(listings: $listings, selectedFilter: $selectedFilter, selectedSort: $selectedSort)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketPlaceSuccessImpl &&
            const DeepCollectionEquality().equals(other._listings, _listings) &&
            (identical(other.selectedFilter, selectedFilter) ||
                other.selectedFilter == selectedFilter) &&
            (identical(other.selectedSort, selectedSort) ||
                other.selectedSort == selectedSort));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_listings),
    selectedFilter,
    selectedSort,
  );

  /// Create a copy of MarketplaceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketPlaceSuccessImplCopyWith<_$MarketPlaceSuccessImpl> get copyWith =>
      __$$MarketPlaceSuccessImplCopyWithImpl<_$MarketPlaceSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<Listing> listings,
      String selectedFilter,
      SortType selectedSort,
    )
    success,
    required TResult Function(String error) error,
  }) {
    return success(listings, selectedFilter, selectedSort);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<Listing> listings,
      String selectedFilter,
      SortType selectedSort,
    )?
    success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(listings, selectedFilter, selectedSort);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<Listing> listings,
      String selectedFilter,
      SortType selectedSort,
    )?
    success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(listings, selectedFilter, selectedSort);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MarketPlaceInitial value) initial,
    required TResult Function(MarketPlaceLoading value) loading,
    required TResult Function(MarketPlaceSuccess value) success,
    required TResult Function(MarketPlaceError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MarketPlaceInitial value)? initial,
    TResult? Function(MarketPlaceLoading value)? loading,
    TResult? Function(MarketPlaceSuccess value)? success,
    TResult? Function(MarketPlaceError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MarketPlaceInitial value)? initial,
    TResult Function(MarketPlaceLoading value)? loading,
    TResult Function(MarketPlaceSuccess value)? success,
    TResult Function(MarketPlaceError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class MarketPlaceSuccess implements MarketplaceState {
  const factory MarketPlaceSuccess({
    required final List<Listing> listings,
    required final String selectedFilter,
    required final SortType selectedSort,
  }) = _$MarketPlaceSuccessImpl;

  List<Listing> get listings;
  String get selectedFilter;
  SortType get selectedSort;

  /// Create a copy of MarketplaceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarketPlaceSuccessImplCopyWith<_$MarketPlaceSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarketPlaceErrorImplCopyWith<$Res> {
  factory _$$MarketPlaceErrorImplCopyWith(
    _$MarketPlaceErrorImpl value,
    $Res Function(_$MarketPlaceErrorImpl) then,
  ) = __$$MarketPlaceErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$MarketPlaceErrorImplCopyWithImpl<$Res>
    extends _$MarketplaceStateCopyWithImpl<$Res, _$MarketPlaceErrorImpl>
    implements _$$MarketPlaceErrorImplCopyWith<$Res> {
  __$$MarketPlaceErrorImplCopyWithImpl(
    _$MarketPlaceErrorImpl _value,
    $Res Function(_$MarketPlaceErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MarketplaceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$MarketPlaceErrorImpl(
        null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$MarketPlaceErrorImpl implements MarketPlaceError {
  const _$MarketPlaceErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'MarketplaceState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketPlaceErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of MarketplaceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketPlaceErrorImplCopyWith<_$MarketPlaceErrorImpl> get copyWith =>
      __$$MarketPlaceErrorImplCopyWithImpl<_$MarketPlaceErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      List<Listing> listings,
      String selectedFilter,
      SortType selectedSort,
    )
    success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      List<Listing> listings,
      String selectedFilter,
      SortType selectedSort,
    )?
    success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      List<Listing> listings,
      String selectedFilter,
      SortType selectedSort,
    )?
    success,
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
    required TResult Function(MarketPlaceInitial value) initial,
    required TResult Function(MarketPlaceLoading value) loading,
    required TResult Function(MarketPlaceSuccess value) success,
    required TResult Function(MarketPlaceError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MarketPlaceInitial value)? initial,
    TResult? Function(MarketPlaceLoading value)? loading,
    TResult? Function(MarketPlaceSuccess value)? success,
    TResult? Function(MarketPlaceError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MarketPlaceInitial value)? initial,
    TResult Function(MarketPlaceLoading value)? loading,
    TResult Function(MarketPlaceSuccess value)? success,
    TResult Function(MarketPlaceError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MarketPlaceError implements MarketplaceState {
  const factory MarketPlaceError(final String error) = _$MarketPlaceErrorImpl;

  String get error;

  /// Create a copy of MarketplaceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarketPlaceErrorImplCopyWith<_$MarketPlaceErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
