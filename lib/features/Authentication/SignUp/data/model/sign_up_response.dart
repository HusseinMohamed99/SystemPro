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
  String? status;
}

@JsonSerializable()
class SignupUserData {
  SignupUserData({
    this.email,
    this.otp,
  });

  factory SignupUserData.fromJson(Map<String, dynamic> json) =>
      _$SignupUserDataFromJson(json);
  String? email;
  String? otp;
}
