import 'package:json_annotation/json_annotation.dart';

part 'email_verify_response.g.dart';

@JsonSerializable()
class EmailVerifyResponse {
  String? message;
  bool? status;
  int? code;

  EmailVerifyResponse({this.message, this.status, this.code});

  factory EmailVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailVerifyResponseFromJson(json);
}
