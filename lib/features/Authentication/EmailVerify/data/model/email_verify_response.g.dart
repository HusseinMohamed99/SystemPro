// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailVerifyResponse _$EmailVerifyResponseFromJson(Map<String, dynamic> json) =>
    EmailVerifyResponse(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EmailVerifyResponseToJson(
  EmailVerifyResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'status': instance.status,
  'code': instance.code,
};
