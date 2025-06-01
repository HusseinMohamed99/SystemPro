// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingImage _$ListingImageFromJson(Map<String, dynamic> json) => ListingImage(
  id: (json['id'] as num?)?.toInt(),
  listingId: (json['listing_id'] as num?)?.toInt(),
  imagePath: json['image_path'] as String?,
  imageUrl: json['image_url'] as String?,
  isPrimary: json['is_primary'] as bool?,
);

Map<String, dynamic> _$ListingImageToJson(ListingImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'listing_id': instance.listingId,
      'image_path': instance.imagePath,
      'image_url': instance.imageUrl,
      'is_primary': instance.isPrimary,
    };
