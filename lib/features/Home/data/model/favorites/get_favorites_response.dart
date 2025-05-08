import 'package:json_annotation/json_annotation.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';

part 'get_favorites_response.g.dart';

@JsonSerializable()
class GetFavoritesResponse {
  GetFavoritesResponse({this.status, this.message, this.data});

  factory GetFavoritesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFavoritesResponseFromJson(json);
  final String? status;
  final String? message;
  final List<Listing>? data;

  Map<String, dynamic> toJson() => _$GetFavoritesResponseToJson(this);
}
