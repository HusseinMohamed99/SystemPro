// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_otp_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendOtpRequestBody _$ResendOtpRequestBodyFromJson(
  Map<String, dynamic> json,
) => ResendOtpRequestBody(
  email: json['email'] as String,
  type: json['type'] as String?,
);

Map<String, dynamic> _$ResendOtpRequestBodyToJson(
  ResendOtpRequestBody instance,
) => <String, dynamic>{'email': instance.email, 'type': instance.type};
