// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return _LocationModel.fromJson(json);
}

/// @nodoc
mixin _$LocationModel {
  String get districtAr => throw _privateConstructorUsedError;
  String get districtEn => throw _privateConstructorUsedError;
  String get cityAr => throw _privateConstructorUsedError;
  String get cityEn => throw _privateConstructorUsedError;
  String? get regionAr => throw _privateConstructorUsedError;
  String? get regionEn => throw _privateConstructorUsedError;

  /// Serializes this LocationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationModelCopyWith<LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
    LocationModel value,
    $Res Function(LocationModel) then,
  ) = _$LocationModelCopyWithImpl<$Res, LocationModel>;
  @useResult
  $Res call({
    String districtAr,
    String districtEn,
    String cityAr,
    String cityEn,
    String? regionAr,
    String? regionEn,
  });
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res, $Val extends LocationModel>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? districtAr = null,
    Object? districtEn = null,
    Object? cityAr = null,
    Object? cityEn = null,
    Object? regionAr = freezed,
    Object? regionEn = freezed,
  }) {
    return _then(
      _value.copyWith(
            districtAr:
                null == districtAr
                    ? _value.districtAr
                    : districtAr // ignore: cast_nullable_to_non_nullable
                        as String,
            districtEn:
                null == districtEn
                    ? _value.districtEn
                    : districtEn // ignore: cast_nullable_to_non_nullable
                        as String,
            cityAr:
                null == cityAr
                    ? _value.cityAr
                    : cityAr // ignore: cast_nullable_to_non_nullable
                        as String,
            cityEn:
                null == cityEn
                    ? _value.cityEn
                    : cityEn // ignore: cast_nullable_to_non_nullable
                        as String,
            regionAr:
                freezed == regionAr
                    ? _value.regionAr
                    : regionAr // ignore: cast_nullable_to_non_nullable
                        as String?,
            regionEn:
                freezed == regionEn
                    ? _value.regionEn
                    : regionEn // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LocationModelImplCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$$LocationModelImplCopyWith(
    _$LocationModelImpl value,
    $Res Function(_$LocationModelImpl) then,
  ) = __$$LocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String districtAr,
    String districtEn,
    String cityAr,
    String cityEn,
    String? regionAr,
    String? regionEn,
  });
}

/// @nodoc
class __$$LocationModelImplCopyWithImpl<$Res>
    extends _$LocationModelCopyWithImpl<$Res, _$LocationModelImpl>
    implements _$$LocationModelImplCopyWith<$Res> {
  __$$LocationModelImplCopyWithImpl(
    _$LocationModelImpl _value,
    $Res Function(_$LocationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? districtAr = null,
    Object? districtEn = null,
    Object? cityAr = null,
    Object? cityEn = null,
    Object? regionAr = freezed,
    Object? regionEn = freezed,
  }) {
    return _then(
      _$LocationModelImpl(
        districtAr:
            null == districtAr
                ? _value.districtAr
                : districtAr // ignore: cast_nullable_to_non_nullable
                    as String,
        districtEn:
            null == districtEn
                ? _value.districtEn
                : districtEn // ignore: cast_nullable_to_non_nullable
                    as String,
        cityAr:
            null == cityAr
                ? _value.cityAr
                : cityAr // ignore: cast_nullable_to_non_nullable
                    as String,
        cityEn:
            null == cityEn
                ? _value.cityEn
                : cityEn // ignore: cast_nullable_to_non_nullable
                    as String,
        regionAr:
            freezed == regionAr
                ? _value.regionAr
                : regionAr // ignore: cast_nullable_to_non_nullable
                    as String?,
        regionEn:
            freezed == regionEn
                ? _value.regionEn
                : regionEn // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationModelImpl implements _LocationModel {
  const _$LocationModelImpl({
    required this.districtAr,
    required this.districtEn,
    required this.cityAr,
    required this.cityEn,
    this.regionAr,
    this.regionEn,
  });

  factory _$LocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationModelImplFromJson(json);

  @override
  final String districtAr;
  @override
  final String districtEn;
  @override
  final String cityAr;
  @override
  final String cityEn;
  @override
  final String? regionAr;
  @override
  final String? regionEn;

  @override
  String toString() {
    return 'LocationModel(districtAr: $districtAr, districtEn: $districtEn, cityAr: $cityAr, cityEn: $cityEn, regionAr: $regionAr, regionEn: $regionEn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationModelImpl &&
            (identical(other.districtAr, districtAr) ||
                other.districtAr == districtAr) &&
            (identical(other.districtEn, districtEn) ||
                other.districtEn == districtEn) &&
            (identical(other.cityAr, cityAr) || other.cityAr == cityAr) &&
            (identical(other.cityEn, cityEn) || other.cityEn == cityEn) &&
            (identical(other.regionAr, regionAr) ||
                other.regionAr == regionAr) &&
            (identical(other.regionEn, regionEn) ||
                other.regionEn == regionEn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    districtAr,
    districtEn,
    cityAr,
    cityEn,
    regionAr,
    regionEn,
  );

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      __$$LocationModelImplCopyWithImpl<_$LocationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationModelImplToJson(this);
  }
}

abstract class _LocationModel implements LocationModel {
  const factory _LocationModel({
    required final String districtAr,
    required final String districtEn,
    required final String cityAr,
    required final String cityEn,
    final String? regionAr,
    final String? regionEn,
  }) = _$LocationModelImpl;

  factory _LocationModel.fromJson(Map<String, dynamic> json) =
      _$LocationModelImpl.fromJson;

  @override
  String get districtAr;
  @override
  String get districtEn;
  @override
  String get cityAr;
  @override
  String get cityEn;
  @override
  String? get regionAr;
  @override
  String? get regionEn;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
