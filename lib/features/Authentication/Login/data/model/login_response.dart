import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {

  LoginResponse({this.message, this.data, this.status, this.code});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  String? message;
  @JsonKey(name: 'data')
  Data? data;
  bool? status;
  int? code;
}


@JsonSerializable()
class Data {
  Data({
    this.user,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  UserData? user;
  String? token;

}
@JsonSerializable()
class UserData {
  UserData({
    this.userName,
    this.email,
    this.emailVerified,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  @JsonKey(name: 'email_verified_at')
  bool? emailVerified;
  @JsonKey(name: 'name')
  String? userName;
  String? email;

}
