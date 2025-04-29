import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request_body.g.dart';

@JsonSerializable()
class EditProfileRequestBody {


  EditProfileRequestBody({this.userName});
  @JsonKey(name: 'name')
  final String? userName;

  Map<String, dynamic> toJson() => _$EditProfileRequestBodyToJson(this);
}
