import 'package:json_annotation/json_annotation.dart';

part 'toggle_favorite_response.g.dart';

@JsonSerializable()
class ToggleFavoriteResponse {
  ToggleFavoriteResponse({this.status, this.message, this.data});

  factory ToggleFavoriteResponse.fromJson(Map<String, dynamic> json) =>
      _$ToggleFavoriteResponseFromJson(json);
  final String? status;
  final String? message;

  @JsonKey(name: 'data')
  final ToggleFavoriteData? data;

  Map<String, dynamic> toJson() => _$ToggleFavoriteResponseToJson(this);
}

@JsonSerializable()
class ToggleFavoriteData {
  ToggleFavoriteData({required this.isFavorited});

  factory ToggleFavoriteData.fromJson(Map<String, dynamic> json) =>
      _$ToggleFavoriteDataFromJson(json);
  @JsonKey(name: 'is_favorited')
  final bool isFavorited;

  Map<String, dynamic> toJson() => _$ToggleFavoriteDataToJson(this);
}
