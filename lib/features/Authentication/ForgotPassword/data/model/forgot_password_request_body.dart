import 'package:flutter/foundation.dart'; // for @immutable
import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_request_body.g.dart';

@immutable
@JsonSerializable()
class ForgotPasswordRequestBody {
  /// Factory method to create from JSON
  factory ForgotPasswordRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestBodyFromJson(json);
  const ForgotPasswordRequestBody({required this.email});

  final String email;

  /// Converts instance to JSON map
  Map<String, dynamic> toJson() => _$ForgotPasswordRequestBodyToJson(this);
}
