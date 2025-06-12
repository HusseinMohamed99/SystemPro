// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationModelImpl _$$LocationModelImplFromJson(Map<String, dynamic> json) =>
    _$LocationModelImpl(
      districtAr: json['districtAr'] as String,
      districtEn: json['districtEn'] as String,
      cityAr: json['cityAr'] as String,
      cityEn: json['cityEn'] as String,
      regionAr: json['regionAr'] as String?,
      regionEn: json['regionEn'] as String?,
    );

Map<String, dynamic> _$$LocationModelImplToJson(_$LocationModelImpl instance) =>
    <String, dynamic>{
      'districtAr': instance.districtAr,
      'districtEn': instance.districtEn,
      'cityAr': instance.cityAr,
      'cityEn': instance.cityEn,
      'regionAr': instance.regionAr,
      'regionEn': instance.regionEn,
    };
