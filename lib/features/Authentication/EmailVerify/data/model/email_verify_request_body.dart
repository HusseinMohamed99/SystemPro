import 'package:json_annotation/json_annotation.dart';

part 'email_verify_request_body.g.dart';

/// Request body for verifying user email with OTP.
@JsonSerializable()
class EmailVerifyRequestBody {
  EmailVerifyRequestBody({required this.email, required this.otp});

  /// Creates object from JSON map
  factory EmailVerifyRequestBody.fromJson(Map<String, dynamic> json) =>
      _$EmailVerifyRequestBodyFromJson(json);

  /// User email address
  final String email;

  /// One-Time Password sent to the user
  final String otp;

  /// Converts object to JSON map
  Map<String, dynamic> toJson() => _$EmailVerifyRequestBodyToJson(this);

  @override
  String toString() => 'EmailVerifyRequestBody(email: $email, otp: $otp)';
}
