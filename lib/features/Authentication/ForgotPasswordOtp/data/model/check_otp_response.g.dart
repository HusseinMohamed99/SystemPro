// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOtpResponse _$CheckOtpResponseFromJson(Map<String, dynamic> json) =>
    CheckOtpResponse(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CheckOtpResponseToJson(CheckOtpResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
    };
