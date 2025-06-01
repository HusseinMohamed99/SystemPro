// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterRequestModel _$FilterRequestModelFromJson(Map<String, dynamic> json) =>
    FilterRequestModel(
      direction: json['direction'] as String,
      cursor: (json['cursor'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      location: json['location'] as String?,
      listingType: json['listingType'] as String?,
      categoryID: (json['categoryID'] as num?)?.toInt(),
      subCategoryID: (json['subCategoryID'] as num?)?.toInt(),
      bedrooms: (json['bedrooms'] as num?)?.toInt(),
      bathrooms: (json['bathrooms'] as num?)?.toInt(),
      areaMin: json['areaMin'] as num?,
      areaMax: json['areaMax'] as num?,
      priceMin: json['priceMin'] as num?,
      priceMax: json['priceMax'] as num?,
      amenities:
          (json['amenities'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList(),
    );

Map<String, dynamic> _$FilterRequestModelToJson(FilterRequestModel instance) =>
    <String, dynamic>{
      'direction': instance.direction,
      'cursor': instance.cursor,
      'limit': instance.limit,
      'location': instance.location,
      'listingType': instance.listingType,
      'categoryID': instance.categoryID,
      'subCategoryID': instance.subCategoryID,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'areaMin': instance.areaMin,
      'areaMax': instance.areaMax,
      'priceMin': instance.priceMin,
      'priceMax': instance.priceMax,
      'amenities': instance.amenities,
    };
