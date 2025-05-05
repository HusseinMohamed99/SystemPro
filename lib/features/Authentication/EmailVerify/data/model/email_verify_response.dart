import 'package:json_annotation/json_annotation.dart';

part 'email_verify_response.g.dart';

@JsonSerializable()
class EmailVerifyResponse {
  factory EmailVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailVerifyResponseFromJson(json);

  EmailVerifyResponse({this.message, this.status});
  String? message;
  String? status;
}
