// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amenities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Amenities _$AmenitiesFromJson(Map<String, dynamic> json) => Amenities(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  pivot:
      json['pivot'] == null
          ? null
          : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AmenitiesToJson(Amenities instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'pivot': instance.pivot,
};

Pivot _$PivotFromJson(Map<String, dynamic> json) => Pivot(
  amenityID: (json['amenity_id'] as num?)?.toInt(),
  realEstateListingID: (json['real_estate_listing_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$PivotToJson(Pivot instance) => <String, dynamic>{
  'amenity_id': instance.amenityID,
  'real_estate_listing_id': instance.realEstateListingID,
};
