import 'package:json_annotation/json_annotation.dart';
part 'listing_image.g.dart';

@JsonSerializable()
class ListingImage {
  ListingImage({
    this.id,
    this.listingId,
    this.imagePath,
    this.imageUrl,
    this.isPrimary,
  });

  factory ListingImage.fromJson(Map<String, dynamic> json) =>
      _$ListingImageFromJson(json);
  final int? id;
  @JsonKey(name: 'listing_id')
  final int? listingId;
  @JsonKey(name: 'image_path')
  final String? imagePath;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'is_primary')
  final bool? isPrimary;
}
