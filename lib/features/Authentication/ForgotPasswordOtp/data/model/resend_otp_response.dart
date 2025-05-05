import 'package:json_annotation/json_annotation.dart';

part 'resend_otp_response.g.dart';

@JsonSerializable()
class ResendOtpResponse {
  ResendOtpResponse({this.message, this.status});

  factory ResendOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$ResendOtpResponseFromJson(json);
  String? message;
  String? status;
}
