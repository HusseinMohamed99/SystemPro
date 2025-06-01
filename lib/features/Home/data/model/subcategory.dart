import 'package:json_annotation/json_annotation.dart';

part 'subcategory.g.dart';

/// Represents a subcategory of a real estate listing,
/// such as "studio", "duplex", etc.
@JsonSerializable()
class Subcategory {
  /// Creates a [Subcategory] instance with optional id and name.
  const Subcategory({this.id, this.name});

  /// Creates a [Subcategory] from JSON.
  factory Subcategory.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryFromJson(json);

  /// Converts this instance to a JSON map.
  Map<String, dynamic> toJson() => _$SubcategoryToJson(this);

  /// Unique identifier of the subcategory.
  final int? id;

  /// Name of the subcategory (e.g. Studio, Apartment).
  final String? name;
}
