import 'package:json_annotation/json_annotation.dart';
import 'package:system_pro/features/Home/data/model/marketplace_data.dart';

part 'marketplace_response.g.dart';

/// Represents a standard API response for the marketplace endpoint.
/// Includes status, message, response code, and the actual data.
@JsonSerializable()
class MarketplaceResponse {
  /// Creates a [MarketplaceResponse] instance.
  const MarketplaceResponse({this.status, this.code, this.message, this.data});

  /// Creates a [MarketplaceResponse] object from JSON.
  factory MarketplaceResponse.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceResponseFromJson(json);

  /// Converts [MarketplaceResponse] to JSON.
  Map<String, dynamic> toJson() => _$MarketplaceResponseToJson(this);

  /// The response status, typically "success" or "error".
  final String? status;

  /// HTTP-style code (e.g., 200, 400, 500).
  final int? code;

  /// A human-readable message (e.g., "Fetched successfully").
  final String? message;

  /// The actual returned data, including listings and pagination.
  final MarketplaceData? data;
}
