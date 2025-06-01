// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketplaceData _$MarketplaceDataFromJson(Map<String, dynamic> json) =>
    MarketplaceData(
      listings:
          (json['listings'] as List<dynamic>?)
              ?.map((e) => Listing.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      pagination:
          json['pagination'] == null
              ? null
              : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MarketplaceDataToJson(MarketplaceData instance) =>
    <String, dynamic>{
      'listings': instance.listings,
      'pagination': instance.pagination,
    };
