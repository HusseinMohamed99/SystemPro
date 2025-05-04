// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  role: json['role'] as String?,
  status: json['status'] as String?,
  picture: json['picture'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  bio: json['bio'] as String?,
);

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'role': instance.role,
  'status': instance.status,
  'picture': instance.picture,
  'phone': instance.phone,
  'address': instance.address,
  'bio': instance.bio,
};
