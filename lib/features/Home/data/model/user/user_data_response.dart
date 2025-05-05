import 'package:json_annotation/json_annotation.dart';

part 'user_data_response.g.dart';

@JsonSerializable()
class UserDataResponse {
  UserDataResponse({this.message, this.status, this.userData});

  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDataResponseFromJson(json);
  String? message;
  String? status;
  @JsonKey(name: 'data')
  ProfileUserData? userData;
}

@JsonSerializable()
class ProfileUserData {
  ProfileUserData({this.userName, this.email});

  factory ProfileUserData.fromJson(Map<String, dynamic> json) =>
      _$ProfileUserDataFromJson(json);

  @JsonKey(name: 'name')
  String? userName;
  String? email;
}
