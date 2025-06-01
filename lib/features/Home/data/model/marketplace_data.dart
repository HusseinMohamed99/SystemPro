import 'package:json_annotation/json_annotation.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';
import 'package:system_pro/features/Home/data/model/pagination.dart';

part 'marketplace_data.g.dart';

/// Represents the response structure for marketplace data,
/// including listings and pagination info.
@JsonSerializable()
class MarketplaceData {
  const MarketplaceData({this.listings = const [], this.pagination});

  /// Factory to create [MarketplaceData] from JSON.
  factory MarketplaceData.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceDataFromJson(json);

  /// Convert [MarketplaceData] instance to JSON.
  Map<String, dynamic> toJson() => _$MarketplaceDataToJson(this);

  /// List of listings (properties or items).
  @JsonKey(defaultValue: [])
  final List<Listing> listings;

  /// Pagination information (e.g., current page, total pages).
  final Pagination? pagination;
}
