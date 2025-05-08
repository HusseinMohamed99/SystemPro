// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favorites_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFavoritesResponse _$GetFavoritesResponseFromJson(
  Map<String, dynamic> json,
) => GetFavoritesResponse(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => Listing.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$GetFavoritesResponseToJson(
  GetFavoritesResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
