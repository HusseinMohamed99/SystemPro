import 'package:json_annotation/json_annotation.dart';
import 'package:system_pro/features/Search/data/model/filter_result_arg.dart';

part 'filter_request_model.g.dart';

/// Represents the full filter criteria used to query marketplace listings.
@JsonSerializable()
class FilterRequestModel {
  /// Main constructor with optional filters and required pagination fields.
  const FilterRequestModel({
    this.direction = 'next', // Default pagination direction
    this.cursor = 0, // Default cursor for initial load
    this.limit = 5, // Default page size
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
    this.companyId,
    this.marketerId,
  });

  /// Factory constructor to generate a FilterRequestModel
  ///  from FilterResultArguments.
  factory FilterRequestModel.fromArgs(FilterResultArguments args) {
    return FilterRequestModel(
      location: args.location,
      listingType: args.listingType,
      categoryID: args.category,
      subCategoryID: args.selectedSubcategories,
      bedrooms: args.bedrooms,
      bathrooms: args.bathrooms,
      areaMin: args.minSize,
      areaMax: args.maxSize,
      priceMin: args.minPrice,
      priceMax: args.maxPrice,
      amenities: args.selectedAmenities,
      companyId: args.companyId,
      marketerId: args.marketerId,
    );
  }

  /// Deserialize from JSON
  factory FilterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FilterRequestModelFromJson(json);

  /// Serialize to JSON
  Map<String, dynamic> toJson() => _$FilterRequestModelToJson(this);

  /// Pagination direction ('next' or 'prev')
  final String direction;

  /// Pagination cursor
  final int cursor;

  /// Pagination limit
  final int limit;

  /// Location filter
  @JsonKey(includeIfNull: false)
  final String? location;

  /// Listing type: sale, rent, etc.
  @JsonKey(name: 'listing_type', includeIfNull: false)
  final String? listingType;

  /// Selected main category ID
  @JsonKey(name: 'category_id', includeIfNull: false)
  final int? categoryID;

  /// Selected subcategory ID
  @JsonKey(name: 'subcategory_id', includeIfNull: false)
  final int? subCategoryID;

  /// Minimum bedrooms
  @JsonKey(includeIfNull: false)
  final int? bedrooms;

  /// Minimum bathrooms
  @JsonKey(includeIfNull: false)
  final int? bathrooms;

  /// Minimum area in m²
  @JsonKey(name: 'area_min', includeIfNull: false)
  final num? areaMin;

  /// Maximum area in m²
  @JsonKey(name: 'area_max', includeIfNull: false)
  final num? areaMax;

  /// Minimum price
  @JsonKey(name: 'price_min', includeIfNull: false)
  final num? priceMin;

  /// Maximum price
  @JsonKey(name: 'price_max', includeIfNull: false)
  final num? priceMax;

  /// List of amenity IDs selected
  @JsonKey(includeIfNull: false)
  final List<int>? amenities;

  /// Company ID for company listings
  @JsonKey(name: 'company_id', includeIfNull: false)
  final int? companyId;

  /// Marketer ID for marketer listings
  @JsonKey(name: 'marketer_id', includeIfNull: false)
  final int? marketerId;

  /// Returns a copy of this model with updated fields.
  FilterRequestModel copyWith({
    String? direction,
    int? cursor,
    int? limit,
    String? location,
    String? listingType,
    int? categoryID,
    int? subCategoryID,
    int? bedrooms,
    int? bathrooms,
    num? areaMin,
    num? areaMax,
    num? priceMin,
    num? priceMax,
    List<int>? amenities,
    int? companyId,
    int? marketerId,
  }) {
    return FilterRequestModel(
      direction: direction ?? this.direction,
      cursor: cursor ?? this.cursor,
      limit: limit ?? this.limit,
      location: location ?? this.location,
      listingType: listingType ?? this.listingType,
      categoryID: categoryID ?? this.categoryID,
      subCategoryID: subCategoryID ?? this.subCategoryID,
      bedrooms: bedrooms ?? this.bedrooms,
      bathrooms: bathrooms ?? this.bathrooms,
      areaMin: areaMin ?? this.areaMin,
      areaMax: areaMax ?? this.areaMax,
      priceMin: priceMin ?? this.priceMin,
      priceMax: priceMax ?? this.priceMax,
      amenities: amenities ?? this.amenities,
      companyId: companyId ?? this.companyId,
      marketerId: marketerId ?? this.marketerId,
    );
  }
}
