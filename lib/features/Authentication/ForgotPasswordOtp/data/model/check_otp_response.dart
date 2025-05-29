import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_otp_response.g.dart';

/// Response model received after checking OTP validity.
@immutable
@JsonSerializable()
class CheckOtpResponse {

  /// Creates an instance from JSON.
  factory CheckOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckOtpResponseFromJson(json);
  const CheckOtpResponse({this.message, this.status});

  /// Message from the server, usually success or error explanation.
  final String? message;

  /// Response status (e.g., 'success', 'failed').
  final String? status;

  /// Converts this instance to JSON.
  Map<String, dynamic> toJson() => _$CheckOtpResponseToJson(this);
}
