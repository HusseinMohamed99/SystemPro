// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequestBody _$ChangePasswordRequestBodyFromJson(
  Map<String, dynamic> json,
) => ChangePasswordRequestBody(
  newPassword: json['password'] as String,
  confirmPassword: json['password_confirmation'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$ChangePasswordRequestBodyToJson(
  ChangePasswordRequestBody instance,
) => <String, dynamic>{
  'password': instance.newPassword,
  'password_confirmation': instance.confirmPassword,
  'email': instance.email,
};
