// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Listing _$ListingFromJson(Map<String, dynamic> json) => Listing(
  id: (json['id'] as num?)?.toInt(),
  employeeId: (json['employee_id'] as num?)?.toInt(),
  companyId: (json['company_id'] as num?)?.toInt(),
  categoryId: (json['category_id'] as num?)?.toInt(),
  subcategoryId: (json['subcategory_id'] as num?)?.toInt(),
  title: json['title'] as String?,
  description: json['description'] as String?,
  category: json['category'] as String?,
  price: json['price'] as String?,
  downPayment: json['down_payment'] as String?,
  location: json['location'] as String?,
  picture: json['picture'] as String?,
  pictureUrl: json['picture_url'] as String?,
  rooms: (json['rooms'] as num?)?.toInt(),
  bathrooms: (json['bathrooms'] as num?)?.toInt(),
  floors: (json['floors'] as num?)?.toInt(),
  area: json['area'] as String?,
  sellingStatus: (json['selling_status'] as num?)?.toInt(),
  status: json['status'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  rejectionReason: json['rejection_reason'] as String?,
  releaseDate: json['release_date'] as String?,
  employee:
      json['employee'] == null
          ? null
          : Employee.fromJson(json['employee'] as Map<String, dynamic>),
  company:
      json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => ListingImage.fromJson(e as Map<String, dynamic>))
          .toList(),
  amenities:
      (json['amenities'] as List<dynamic>?)
          ?.map((e) => Amenities.fromJson(e as Map<String, dynamic>))
          .toList(),
  subcategory:
      json['subcategory'] == null
          ? null
          : Subcategory.fromJson(json['subcategory'] as Map<String, dynamic>),
  listingType: json['listing_type'] as String?,
);

Map<String, dynamic> _$ListingToJson(Listing instance) => <String, dynamic>{
  'id': instance.id,
  'employee_id': instance.employeeId,
  'company_id': instance.companyId,
  'category_id': instance.categoryId,
  'subcategory_id': instance.subcategoryId,
  'title': instance.title,
  'description': instance.description,
  'category': instance.category,
  'price': instance.price,
  'down_payment': instance.downPayment,
  'location': instance.location,
  'picture': instance.picture,
  'picture_url': instance.pictureUrl,
  'rooms': instance.rooms,
  'bathrooms': instance.bathrooms,
  'floors': instance.floors,
  'area': instance.area,
  'selling_status': instance.sellingStatus,
  'status': instance.status,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'listing_type': instance.listingType,
  'rejection_reason': instance.rejectionReason,
  'release_date': instance.releaseDate,
  'employee': instance.employee,
  'company': instance.company,
  'subcategory': instance.subcategory,
  'amenities': instance.amenities,
  'images': instance.images,
};
