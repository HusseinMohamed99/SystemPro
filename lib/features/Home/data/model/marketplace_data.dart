import 'package:json_annotation/json_annotation.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';
import 'package:system_pro/features/Home/data/model/pagination.dart';

part 'marketplace_data.g.dart';

@JsonSerializable()
class MarketplaceData {
  MarketplaceData({this.listings, this.pagination});

  factory MarketplaceData.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceDataFromJson(json);
  final List<Listing>? listings;
  final Pagination? pagination;
}
