// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Listing _$ListingFromJson(Map<String, dynamic> json) => Listing(
  id: (json['id'] as num?)?.toInt(),
  employeeId: (json['employee_id'] as num?)?.toInt(),
  companyId: (json['company_id'] as num?)?.toInt(),
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
);

Map<String, dynamic> _$ListingToJson(Listing instance) => <String, dynamic>{
  'id': instance.id,
  'employee_id': instance.employeeId,
  'company_id': instance.companyId,
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
  'employee': instance.employee,
  'company': instance.company,
  'images': instance.images,
};
