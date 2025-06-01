import 'package:json_annotation/json_annotation.dart';

part 'filter_request_model.g.dart';

/// Represents the full filter criteria used to query marketplace listings.
@JsonSerializable()
class FilterRequestModel {
  const FilterRequestModel({
    required this.direction,
    required this.cursor,
    required this.limit,
    this.location,
    this.listingType,
    this.categoryID,
    this.subCategoryID,
    this.bedrooms,
    this.bathrooms,
    this.areaMin,
    this.areaMax,
    this.priceMin,
    this.priceMax,
    this.amenities,
  });

  /// Factory constructor for creating a new `FilterRequestModel` from JSON.
  factory FilterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FilterRequestModelFromJson(json);

  /// Converts the model into JSON.
  Map<String, dynamic> toJson() => _$FilterRequestModelToJson(this);

  /// Pagination direction: 'next' or 'prev'
  final String direction;

  /// Current cursor for pagination.
  final int cursor;

  /// Maximum items to fetch.
  final int limit;

  /// Text location filter (e.g. district, city).
  final String? location;

  /// Listing type (e.g. 'sale', 'rent').
  final String? listingType;

  /// ID of selected category.
  final int? categoryID;

  /// ID of selected subcategory.
  final int? subCategoryID;

  /// Minimum number of bedrooms.
  final int? bedrooms;

  /// Minimum number of bathrooms.
  final int? bathrooms;

  /// Minimum property area.
  final num? areaMin;

  /// Maximum property area.
  final num? areaMax;

  /// Minimum price.
  final num? priceMin;

  /// Maximum price.
  final num? priceMax;

  /// List of selected amenities IDs.
  final List<int>? amenities;
}
