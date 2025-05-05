import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignupResponse {
  SignupResponse({this.message, this.userData, this.status});

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
  String? message;
  @JsonKey(name: 'data')
  SignupUserData? userData;
  bool? status;
}

@JsonSerializable()
class SignupUserData {
  SignupUserData({
    // this.token,
    // this.userName,
    this.email,
    this.otp,
    // this.userImage,
    // this.uId,
    // this.iD,
  });

  factory SignupUserData.fromJson(Map<String, dynamic> json) =>
      _$SignupUserDataFromJson(json);
  // @JsonKey(name: 'id')
  // int? iD;
  // @JsonKey(name: 'uuid')
  // String? uId;
  // String? token;
  // @JsonKey(name: 'name')
  // String? userName;
  String? email;
  String? otp;
  // @JsonKey(name: 'image')
  // String? userImage;
}
