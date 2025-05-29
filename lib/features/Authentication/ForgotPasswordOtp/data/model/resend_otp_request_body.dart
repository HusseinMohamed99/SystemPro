import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resend_otp_request_body.g.dart';

/// Request body model for resending OTP to a given email address.
@immutable
@JsonSerializable()
class ResendOtpRequestBody {
  /// Deserialize from JSON
  factory ResendOtpRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ResendOtpRequestBodyFromJson(json);
  const ResendOtpRequestBody({required this.email, this.type});

  /// User's email address.
  final String email;

  /// Optional type of the OTP (e.g., "register", "reset_password").
  final String? type;

  /// Serialize to JSON
  Map<String, dynamic> toJson() => _$ResendOtpRequestBodyToJson(this);
}
