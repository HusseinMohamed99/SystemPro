// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordResponse _$ChangePasswordResponseFromJson(
  Map<String, dynamic> json,
) => ChangePasswordResponse(
  message: json['message'] as String?,
  code: (json['code'] as num?)?.toInt(),
  status: json['status'] as String?,
);

Map<String, dynamic> _$ChangePasswordResponseToJson(
  ChangePasswordResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'status': instance.status,
  'code': instance.code,
};
