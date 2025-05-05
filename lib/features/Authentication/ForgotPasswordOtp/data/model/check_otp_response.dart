import 'package:json_annotation/json_annotation.dart';

part 'check_otp_response.g.dart';

@JsonSerializable()
class CheckOtpResponse {
  CheckOtpResponse({this.message, this.status});

  factory CheckOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckOtpResponseFromJson(json);
 final String? message;
 final String? status;

}
