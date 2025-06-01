import 'package:json_annotation/json_annotation.dart';

part 'amenities.g.dart';

/// Represents an amenity associated with a listing,
/// such as "Parking", "Elevator", etc.
@JsonSerializable()
class Amenities {
  /// Creates an [Amenities] instance.
  const Amenities({this.id, this.name, this.pivot});

  /// Factory to create [Amenities] from a JSON map.
  factory Amenities.fromJson(Map<String, dynamic> json) =>
      _$AmenitiesFromJson(json);

  /// Converts [Amenities] instance to JSON.
  Map<String, dynamic> toJson() => _$AmenitiesToJson(this);

  /// Unique identifier of the amenity.
  final int? id;

  /// Name of the amenity (localized or plain text).
  final String? name;

  /// Pivot info linking this amenity to a specific listing.
  final Pivot? pivot;
}

/// Represents a pivot table entry linking an amenity
/// to a real estate listing (many-to-many relationship).
@JsonSerializable()
class Pivot {
  /// Creates a [Pivot] instance.
  const Pivot({this.amenityID, this.realEstateListingID});

  /// Factory to create [Pivot] from JSON.
  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

  /// Converts [Pivot] instance to JSON.
  Map<String, dynamic> toJson() => _$PivotToJson(this);

  /// Amenity ID in pivot relation.
  @JsonKey(name: 'amenity_id')
  final int? amenityID;

  /// Listing ID in pivot relation.
  @JsonKey(name: 'real_estate_listing_id')
  final int? realEstateListingID;
}
