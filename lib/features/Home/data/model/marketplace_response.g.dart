// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketplaceResponse _$MarketplaceResponseFromJson(Map<String, dynamic> json) =>
    MarketplaceResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : MarketplaceData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MarketplaceResponseToJson(
  MarketplaceResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
