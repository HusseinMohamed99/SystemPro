import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_response.g.dart';

@immutable
@JsonSerializable()
class ForgotPasswordResponse {
  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);
  const ForgotPasswordResponse({this.message, this.code, this.status});

  final String? message;
  final String? status;
  final int? code;

  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}
