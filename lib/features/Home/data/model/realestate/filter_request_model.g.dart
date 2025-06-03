// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterRequestModel _$FilterRequestModelFromJson(Map<String, dynamic> json) =>
    FilterRequestModel(
      direction: json['direction'] as String? ?? 'next',
      cursor: (json['cursor'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? 5,
      location: json['location'] as String?,
      listingType: json['listing_type'] as String?,
      categoryID: (json['category_id'] as num?)?.toInt(),
      subCategoryID: (json['subcategory_id'] as num?)?.toInt(),
      bedrooms: (json['bedrooms'] as num?)?.toInt(),
      bathrooms: (json['bathrooms'] as num?)?.toInt(),
      areaMin: json['area_min'] as num?,
      areaMax: json['area_max'] as num?,
      priceMin: json['price_min'] as num?,
      priceMax: json['price_max'] as num?,
      amenities:
          (json['amenities'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList(),
      companyId: (json['company_id'] as num?)?.toInt(),
      marketerId: (json['marketer_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FilterRequestModelToJson(FilterRequestModel instance) =>
    <String, dynamic>{
      'direction': instance.direction,
      'cursor': instance.cursor,
      'limit': instance.limit,
      if (instance.location case final value?) 'location': value,
      if (instance.listingType case final value?) 'listing_type': value,
      if (instance.categoryID case final value?) 'category_id': value,
      if (instance.subCategoryID case final value?) 'subcategory_id': value,
      if (instance.bedrooms case final value?) 'bedrooms': value,
      if (instance.bathrooms case final value?) 'bathrooms': value,
      if (instance.areaMin case final value?) 'area_min': value,
      if (instance.areaMax case final value?) 'area_max': value,
      if (instance.priceMin case final value?) 'price_min': value,
      if (instance.priceMax case final value?) 'price_max': value,
      if (instance.amenities case final value?) 'amenities': value,
      'company_id': instance.companyId,
      'marketer_id': instance.marketerId,
    };
