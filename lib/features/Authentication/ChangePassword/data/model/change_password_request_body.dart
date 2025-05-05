import 'package:json_annotation/json_annotation.dart';

part 'change_password_request_body.g.dart';

@JsonSerializable()
class ChangePasswordRequestBody {
  ChangePasswordRequestBody({
    required this.newPassword,
    required this.confirmPassword,
  });
  @JsonKey(name: 'password')
  final String newPassword;
  @JsonKey(name: 'password_confirmation')
  final String confirmPassword;

  Map<String, dynamic> toJson() => _$ChangePasswordRequestBodyToJson(this);
}
