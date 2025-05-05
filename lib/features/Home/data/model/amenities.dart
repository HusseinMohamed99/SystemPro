import 'package:json_annotation/json_annotation.dart';

part 'amenities.g.dart';

@JsonSerializable()
class Amenities {
  Amenities({this.pivot, this.id, this.name});

  factory Amenities.fromJson(Map<String, dynamic> json) =>
      _$AmenitiesFromJson(json);
  final int? id;
  final String? name;
  final Pivot? pivot;
}

@JsonSerializable()
class Pivot {
  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);
  Pivot({this.amenityID, this.realEstateListingID});
  @JsonKey(name: 'amenity_id')
  final int? amenityID;
  @JsonKey(name: 'real_estate_listing_id')
  final int? realEstateListingID;
}
