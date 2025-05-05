import 'package:json_annotation/json_annotation.dart';

part 'resend_otp_request_body.g.dart';

@JsonSerializable()
class ResendOtpRequestBody {
  ResendOtpRequestBody({this.type, required this.email});
  final String email;
  final String? type;

  Map<String, dynamic> toJson() => _$ResendOtpRequestBodyToJson(this);
}
