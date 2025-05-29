import 'package:json_annotation/json_annotation.dart';

part 'email_verify_response.g.dart';

/// Represents the response received after verifying the email with OTP.
@JsonSerializable()
class EmailVerifyResponse {
  EmailVerifyResponse({this.message, this.status});

  /// Converts JSON map into EmailVerifyResponse object
  factory EmailVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailVerifyResponseFromJson(json);

  /// Optional success or error message from the API
  final String? message;

  /// Status string (e.g., "success", "failed")
  final String? status;

  /// Converts this object into a JSON map
  Map<String, dynamic> toJson() => _$EmailVerifyResponseToJson(this);

  @override
  String toString() =>
      'EmailVerifyResponse(message: $message, status: $status)';
}
