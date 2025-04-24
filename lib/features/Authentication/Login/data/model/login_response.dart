import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {

  LoginResponse({this.message, this.userData, this.status, this.code});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  bool? status;
  int? code;
}

@JsonSerializable()
class UserData {


  UserData({
    this.token,
    this.userName,
    this.email,
    this.userImage,
    this.uId,
    this.emailVerified,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  @JsonKey(name: 'uuid')
  String? uId;
  @JsonKey(name: 'email_verified')
  bool? emailVerified;
  String? token;
  @JsonKey(name: 'name')
  String? userName;
  String? email;
  @JsonKey(name: 'image')
  String? userImage;
}
