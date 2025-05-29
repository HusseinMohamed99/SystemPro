import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignupResponse {
  SignupResponse({this.message, this.userData, this.code, this.status});

  /// Factory constructor to create instance from JSON map
  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  /// Converts this object to a JSON map
  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);

  /// Response message from the API (e.g. success message)
  String? message;

  /// The actual user data returned upon signup
  @JsonKey(name: 'data')
  SignupUserData? userData;

  /// Status of the response (e.g. "success", "fail")
  String? status;

  /// Response code from the API (e.g. 200)
  int? code;

  @override
  String toString() =>
      'SignupResponse(message: $message, code: $code, status: $status, userData: $userData)';
}

@JsonSerializable()
class SignupUserData {
  SignupUserData({this.email});

  factory SignupUserData.fromJson(Map<String, dynamic> json) =>
      _$SignupUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$SignupUserDataToJson(this);

  /// Email of the user who signed up
  String? email;

  @override
  String toString() => 'SignupUserData(email: $email)';
}
