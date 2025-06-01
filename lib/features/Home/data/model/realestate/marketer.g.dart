// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Marketer _$MarketerFromJson(Map<String, dynamic> json) => Marketer(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  role: json['role'] as String?,
  status: json['status'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  bio: json['bio'] as String?,
  pictureUrl: json['picture_url'] as String?,
);

Map<String, dynamic> _$MarketerToJson(Marketer instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'role': instance.role,
  'status': instance.status,
  'phone': instance.phone,
  'address': instance.address,
  'bio': instance.bio,
  'picture_url': instance.pictureUrl,
};
