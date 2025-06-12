// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_searches_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RecentSearchesState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isInitialized =>
      throw _privateConstructorUsedError; // ✅ إضافة لتتبع التهيئة
  List<LocationModel> get allLocations => throw _privateConstructorUsedError;
  List<LocationModel> get recentSearches => throw _privateConstructorUsedError;
  List<LocationModel> get searchResults => throw _privateConstructorUsedError;
  LocationModel? get selectedLocation => throw _privateConstructorUsedError;

  /// Create a copy of RecentSearchesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecentSearchesStateCopyWith<RecentSearchesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentSearchesStateCopyWith<$Res> {
  factory $RecentSearchesStateCopyWith(
    RecentSearchesState value,
    $Res Function(RecentSearchesState) then,
  ) = _$RecentSearchesStateCopyWithImpl<$Res, RecentSearchesState>;
  @useResult
  $Res call({
    bool isLoading,
    bool isInitialized,
    List<LocationModel> allLocations,
    List<LocationModel> recentSearches,
    List<LocationModel> searchResults,
    LocationModel? selectedLocation,
  });

  $LocationModelCopyWith<$Res>? get selectedLocation;
}

/// @nodoc
class _$RecentSearchesStateCopyWithImpl<$Res, $Val extends RecentSearchesState>
    implements $RecentSearchesStateCopyWith<$Res> {
  _$RecentSearchesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecentSearchesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isInitialized = null,
    Object? allLocations = null,
    Object? recentSearches = null,
    Object? searchResults = null,
    Object? selectedLocation = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            isInitialized:
                null == isInitialized
                    ? _value.isInitialized
                    : isInitialized // ignore: cast_nullable_to_non_nullable
                        as bool,
            allLocations:
                null == allLocations
                    ? _value.allLocations
                    : allLocations // ignore: cast_nullable_to_non_nullable
                        as List<LocationModel>,
            recentSearches:
                null == recentSearches
                    ? _value.recentSearches
                    : recentSearches // ignore: cast_nullable_to_non_nullable
                        as List<LocationModel>,
            searchResults:
                null == searchResults
                    ? _value.searchResults
                    : searchResults // ignore: cast_nullable_to_non_nullable
                        as List<LocationModel>,
            selectedLocation:
                freezed == selectedLocation
                    ? _value.selectedLocation
                    : selectedLocation // ignore: cast_nullable_to_non_nullable
                        as LocationModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of RecentSearchesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<$Res>? get selectedLocation {
    if (_value.selectedLocation == null) {
      return null;
    }

    return $LocationModelCopyWith<$Res>(_value.selectedLocation!, (value) {
      return _then(_value.copyWith(selectedLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecentSearchesStateImplCopyWith<$Res>
    implements $RecentSearchesStateCopyWith<$Res> {
  factory _$$RecentSearchesStateImplCopyWith(
    _$RecentSearchesStateImpl value,
    $Res Function(_$RecentSearchesStateImpl) then,
  ) = __$$RecentSearchesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    bool isInitialized,
    List<LocationModel> allLocations,
    List<LocationModel> recentSearches,
    List<LocationModel> searchResults,
    LocationModel? selectedLocation,
  });

  @override
  $LocationModelCopyWith<$Res>? get selectedLocation;
}

/// @nodoc
class __$$RecentSearchesStateImplCopyWithImpl<$Res>
    extends _$RecentSearchesStateCopyWithImpl<$Res, _$RecentSearchesStateImpl>
    implements _$$RecentSearchesStateImplCopyWith<$Res> {
  __$$RecentSearchesStateImplCopyWithImpl(
    _$RecentSearchesStateImpl _value,
    $Res Function(_$RecentSearchesStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecentSearchesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isInitialized = null,
    Object? allLocations = null,
    Object? recentSearches = null,
    Object? searchResults = null,
    Object? selectedLocation = freezed,
  }) {
    return _then(
      _$RecentSearchesStateImpl(
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        isInitialized:
            null == isInitialized
                ? _value.isInitialized
                : isInitialized // ignore: cast_nullable_to_non_nullable
                    as bool,
        allLocations:
            null == allLocations
                ? _value._allLocations
                : allLocations // ignore: cast_nullable_to_non_nullable
                    as List<LocationModel>,
        recentSearches:
            null == recentSearches
                ? _value._recentSearches
                : recentSearches // ignore: cast_nullable_to_non_nullable
                    as List<LocationModel>,
        searchResults:
            null == searchResults
                ? _value._searchResults
                : searchResults // ignore: cast_nullable_to_non_nullable
                    as List<LocationModel>,
        selectedLocation:
            freezed == selectedLocation
                ? _value.selectedLocation
                : selectedLocation // ignore: cast_nullable_to_non_nullable
                    as LocationModel?,
      ),
    );
  }
}

/// @nodoc

class _$RecentSearchesStateImpl implements _RecentSearchesState {
  const _$RecentSearchesStateImpl({
    this.isLoading = false,
    this.isInitialized = false,
    final List<LocationModel> allLocations = const [],
    final List<LocationModel> recentSearches = const [],
    final List<LocationModel> searchResults = const [],
    this.selectedLocation,
  }) : _allLocations = allLocations,
       _recentSearches = recentSearches,
       _searchResults = searchResults;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isInitialized;
  // ✅ إضافة لتتبع التهيئة
  final List<LocationModel> _allLocations;
  // ✅ إضافة لتتبع التهيئة
  @override
  @JsonKey()
  List<LocationModel> get allLocations {
    if (_allLocations is EqualUnmodifiableListView) return _allLocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allLocations);
  }

  final List<LocationModel> _recentSearches;
  @override
  @JsonKey()
  List<LocationModel> get recentSearches {
    if (_recentSearches is EqualUnmodifiableListView) return _recentSearches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentSearches);
  }

  final List<LocationModel> _searchResults;
  @override
  @JsonKey()
  List<LocationModel> get searchResults {
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResults);
  }

  @override
  final LocationModel? selectedLocation;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentSearchesStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized) &&
            const DeepCollectionEquality().equals(
              other._allLocations,
              _allLocations,
            ) &&
            const DeepCollectionEquality().equals(
              other._recentSearches,
              _recentSearches,
            ) &&
            const DeepCollectionEquality().equals(
              other._searchResults,
              _searchResults,
            ) &&
            (identical(other.selectedLocation, selectedLocation) ||
                other.selectedLocation == selectedLocation));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    isInitialized,
    const DeepCollectionEquality().hash(_allLocations),
    const DeepCollectionEquality().hash(_recentSearches),
    const DeepCollectionEquality().hash(_searchResults),
    selectedLocation,
  );

  /// Create a copy of RecentSearchesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentSearchesStateImplCopyWith<_$RecentSearchesStateImpl> get copyWith =>
      __$$RecentSearchesStateImplCopyWithImpl<_$RecentSearchesStateImpl>(
        this,
        _$identity,
      );
}

abstract class _RecentSearchesState implements RecentSearchesState {
  const factory _RecentSearchesState({
    final bool isLoading,
    final bool isInitialized,
    final List<LocationModel> allLocations,
    final List<LocationModel> recentSearches,
    final List<LocationModel> searchResults,
    final LocationModel? selectedLocation,
  }) = _$RecentSearchesStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isInitialized; // ✅ إضافة لتتبع التهيئة
  @override
  List<LocationModel> get allLocations;
  @override
  List<LocationModel> get recentSearches;
  @override
  List<LocationModel> get searchResults;
  @override
  LocationModel? get selectedLocation;

  /// Create a copy of RecentSearchesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecentSearchesStateImplCopyWith<_$RecentSearchesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
