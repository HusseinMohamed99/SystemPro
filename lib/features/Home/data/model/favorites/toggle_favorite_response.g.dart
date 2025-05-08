// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_favorite_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToggleFavoriteResponse _$ToggleFavoriteResponseFromJson(
  Map<String, dynamic> json,
) => ToggleFavoriteResponse(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : ToggleFavoriteData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ToggleFavoriteResponseToJson(
  ToggleFavoriteResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

ToggleFavoriteData _$ToggleFavoriteDataFromJson(Map<String, dynamic> json) =>
    ToggleFavoriteData(isFavorited: json['is_favorited'] as bool);

Map<String, dynamic> _$ToggleFavoriteDataToJson(ToggleFavoriteData instance) =>
    <String, dynamic>{'is_favorited': instance.isFavorited};
