// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
  name: json['name'] as String?,
  pictureUrl: json['pictureUrl'] as String?,
  bio: json['bio'] as String?,
  address: json['address'] as String?,
);

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
  'name': instance.name,
  'pictureUrl': instance.pictureUrl,
  'bio': instance.bio,
  'address': instance.address,
};
