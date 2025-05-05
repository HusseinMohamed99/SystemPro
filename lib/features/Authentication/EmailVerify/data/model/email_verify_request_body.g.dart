// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verify_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailVerifyRequestBody _$EmailVerifyRequestBodyFromJson(
  Map<String, dynamic> json,
) => EmailVerifyRequestBody(
  email: json['email'] as String,
  otp: json['otp'] as String,
);

Map<String, dynamic> _$EmailVerifyRequestBodyToJson(
  EmailVerifyRequestBody instance,
) => <String, dynamic>{'otp': instance.otp, 'email': instance.email};
