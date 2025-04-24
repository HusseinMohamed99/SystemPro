import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignupResponse {
  String? message;
  @JsonKey(name: 'data')
  SignupUserData? userData;
  bool? status;
  int? code;

  SignupResponse({this.message, this.userData, this.status, this.code});

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}

@JsonSerializable()
class SignupUserData {
  @JsonKey(name: 'id')
  int? iD;
  @JsonKey(name: 'uuid')
  String? uId;
  String? token;
  @JsonKey(name: 'name')
  String? userName;
  String? email;
  @JsonKey(name: 'image')
  String? userImage;

  SignupUserData({
    this.token,
    this.userName,
    this.email,
    this.userImage,
    this.uId,
    this.iD,
  });

  factory SignupUserData.fromJson(Map<String, dynamic> json) =>
      _$SignupUserDataFromJson(json);
}
