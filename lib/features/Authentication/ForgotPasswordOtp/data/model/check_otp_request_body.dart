import 'package:json_annotation/json_annotation.dart';

part 'check_otp_request_body.g.dart';

@JsonSerializable()
class CheckOtpRequestBody {
  final String email;
  final String otp;

  CheckOtpRequestBody({required this.email, required this.otp});

  Map<String, dynamic> toJson() => _$CheckOtpRequestBodyToJson(this);
}
