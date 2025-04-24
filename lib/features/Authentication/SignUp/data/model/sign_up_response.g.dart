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
      status: json['status'] as bool?,
      code: (json['code'] as num?)?.toInt(),
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
      token: json['token'] as String?,
      userName: json['name'] as String?,
      email: json['email'] as String?,
      userImage: json['image'] as String?,
      uId: json['uuid'] as String?,
      iD: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SignupUserDataToJson(SignupUserData instance) =>
    <String, dynamic>{
      'id': instance.iD,
      'uuid': instance.uId,
      'token': instance.token,
      'name': instance.userName,
      'email': instance.email,
      'image': instance.userImage,
    };
