// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      message: json['message'] as String?,
      userData:
          json['data'] == null
              ? null
              : SignupUserData.fromJson(json['data'] as Map<String, dynamic>),
      code: (json['code'] as num?)?.toInt(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.userData,
      'status': instance.status,
      'code': instance.code,
    };

SignupUserData _$SignupUserDataFromJson(Map<String, dynamic> json) =>
    SignupUserData(
      email: json['email'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$SignupUserDataToJson(SignupUserData instance) =>
    <String, dynamic>{'email': instance.email, 'otp': instance.otp};
