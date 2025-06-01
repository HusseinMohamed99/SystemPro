import 'package:json_annotation/json_annotation.dart';

part 'listing_image.g.dart';

/// Represents a single image of a real estate listing.
/// Can be used in gallery view or as a primary thumbnail.
@JsonSerializable()
class ListingImage {
  /// Creates a [ListingImage] instance.
  const ListingImage({
    this.id,
    this.listingId,
    this.imagePath,
    this.imageUrl,
    this.isPrimary,
  });

  /// Factory to create a [ListingImage] from JSON.
  factory ListingImage.fromJson(Map<String, dynamic> json) =>
      _$ListingImageFromJson(json);

  /// Converts [ListingImage] to JSON format.
  Map<String, dynamic> toJson() => _$ListingImageToJson(this);

  /// Unique identifier of the image.
  final int? id;

  /// ID of the listing this image belongs to.
  @JsonKey(name: 'listing_id')
  final int? listingId;

  /// The local path of the image on the server or storage.
  @JsonKey(name: 'image_path')
  final String? imagePath;

  /// Fully qualified image URL.
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  /// Whether this image is the primary display image (e.g., thumbnail).
  @JsonKey(name: 'is_primary')
  final bool? isPrimary;
}
