import 'package:json_annotation/json_annotation.dart';
part 'change_password_response.g.dart';


@JsonSerializable()
class ChangePasswordResponse {
  ChangePasswordResponse({this.message, this.status, this.code});

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);
  String? message;
  bool? status;
  int? code;
}
