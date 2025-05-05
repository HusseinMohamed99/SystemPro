import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_response.g.dart';

@JsonSerializable()
class EditProfileResponse {
  EditProfileResponse({this.message, this.status, this.userData});

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseFromJson(json);
  String? message;
  String? status;
  @JsonKey(name: 'data')
  UserProfileData? userData;
}

@JsonSerializable()
class UserProfileData {
  UserProfileData({this.userName, this.email});
  factory UserProfileData.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDataFromJson(json);
  @JsonKey(name: 'name')
  String? userName;
  String? email;
}
