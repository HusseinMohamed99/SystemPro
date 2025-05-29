import 'package:json_annotation/json_annotation.dart';
import 'package:system_pro/features/Home/data/model/marketplace_data.dart';

part 'marketplace_response.g.dart';

@JsonSerializable()
class MarketplaceResponse {
  MarketplaceResponse({this.status,this.code, this.message, this.data});

  factory MarketplaceResponse.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceResponseFromJson(json);
  final String? status;
  final String? message;
  final MarketplaceData? data;
  final int? code;
}
