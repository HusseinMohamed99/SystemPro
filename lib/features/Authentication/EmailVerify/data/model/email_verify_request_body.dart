import 'package:json_annotation/json_annotation.dart';

part 'email_verify_request_body.g.dart';

@JsonSerializable()
class EmailVerifyRequestBody {


  EmailVerifyRequestBody( {required this.email, required this.otp});
  final String otp;
  final String email;
  Map<String, dynamic> toJson() => _$EmailVerifyRequestBodyToJson(this);
}
