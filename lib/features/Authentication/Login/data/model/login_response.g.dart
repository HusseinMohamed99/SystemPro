// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  user:
      json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
  token: json['token'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'user': instance.user,
  'token': instance.token,
};

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  userName: json['name'] as String?,
  email: json['email'] as String?,
  emailVerified: json['email_verified_at'] as String?,
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'email_verified_at': instance.emailVerified,
  'name': instance.userName,
  'email': instance.email,
};
