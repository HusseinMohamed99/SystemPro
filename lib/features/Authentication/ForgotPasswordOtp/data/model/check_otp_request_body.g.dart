// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_otp_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOtpRequestBody _$CheckOtpRequestBodyFromJson(Map<String, dynamic> json) =>
    CheckOtpRequestBody(
      email: json['email'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$CheckOtpRequestBodyToJson(
  CheckOtpRequestBody instance,
) => <String, dynamic>{'email': instance.email, 'otp': instance.otp};
