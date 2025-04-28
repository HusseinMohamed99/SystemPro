import 'package:json_annotation/json_annotation.dart';

part 'change_password_request_body.g.dart';

@JsonSerializable()
class ChangePasswordRequestBody {
  ChangePasswordRequestBody({
    required this.newPassword,
    required this.confirmPassword,
  });
  @JsonKey(name: 'new_password')
  final String newPassword;
  @JsonKey(name: 'confirm_password')
  final String confirmPassword;

  Map<String, dynamic> toJson() => _$ChangePasswordRequestBodyToJson(this);
}
