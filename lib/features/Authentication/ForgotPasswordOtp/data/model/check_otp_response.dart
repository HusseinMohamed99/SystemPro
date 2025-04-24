import 'package:json_annotation/json_annotation.dart';

part 'check_otp_response.g.dart';

@JsonSerializable()
class CheckOtpResponse {
  String? message;
  bool? status;
  int? code;

  CheckOtpResponse({this.message, this.status, this.code});

  factory CheckOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckOtpResponseFromJson(json);
}
