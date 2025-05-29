import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_otp_request_body.g.dart';

/// Request body used to validate OTP during email/phone verification.
@immutable
@JsonSerializable()
class CheckOtpRequestBody {
  /// Creates an instance from JSON.
  factory CheckOtpRequestBody.fromJson(Map<String, dynamic> json) =>
      _$CheckOtpRequestBodyFromJson(json);
  const CheckOtpRequestBody({required this.email, required this.otp});

  final String email;
  final String otp;

  /// Converts the instance to JSON.
  Map<String, dynamic> toJson() => _$CheckOtpRequestBodyToJson(this);
}
