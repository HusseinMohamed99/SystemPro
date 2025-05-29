import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  /// Create object from JSON (optional but recommended)
  factory SignupRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestBodyFromJson(json);

  /// Create a SignupRequestBody to be sent to the signup endpoint
  SignupRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  /// Full name of the user
  final String name;

  /// Email address of the user
  final String email;

  /// Desired password
  final String password;

  /// Confirmation of the password to match API requirements
  @JsonKey(name: 'password_confirmation')
  final String confirmPassword;

  /// Convert this object to JSON
  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);

  @override
  String toString() =>
      'SignupRequestBody(name: $name, email: $email, password: $password)';
}
