import 'package:json_annotation/json_annotation.dart';

part 'change_password_request_body.g.dart';

@JsonSerializable()
class ChangePasswordRequestBody {
  // Create from JSON (recommended for completeness)
  factory ChangePasswordRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestBodyFromJson(json);
  ChangePasswordRequestBody({
    required this.newPassword,
    required this.confirmPassword,
    required this.email,
  });

  @JsonKey(name: 'password')
  final String newPassword;

  @JsonKey(name: 'password_confirmation')
  final String confirmPassword;

  final String email;

  // Convert to JSON
  Map<String, dynamic> toJson() => _$ChangePasswordRequestBodyToJson(this);
}
