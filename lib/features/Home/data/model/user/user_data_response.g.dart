// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse(
      message: json['message'] as String?,
      status: json['status'] as String?,
      userData:
          json['data'] == null
              ? null
              : ProfileUserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.userData,
    };

ProfileUserData _$ProfileUserDataFromJson(Map<String, dynamic> json) =>
    ProfileUserData(
      userName: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ProfileUserDataToJson(ProfileUserData instance) =>
    <String, dynamic>{'name': instance.userName, 'email': instance.email};
