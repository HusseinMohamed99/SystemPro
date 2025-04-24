import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_request_body.g.dart';

@JsonSerializable()
class ForgotPasswordRequestBody {
  ForgotPasswordRequestBody({required this.email});
  final String email;

  Map<String, dynamic> toJson() => _$ForgotPasswordRequestBodyToJson(this);
}
