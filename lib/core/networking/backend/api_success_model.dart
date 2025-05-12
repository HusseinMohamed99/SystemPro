import 'package:json_annotation/json_annotation.dart';

part 'api_success_model.g.dart';

@JsonSerializable()
class ApiSuccessModel {
  ApiSuccessModel({required this.message, this.status});
  factory ApiSuccessModel.fromJson(Map<String, dynamic> json) =>
      _$ApiSuccessModelFromJson(json);
  String? message;
  String? status;
  Map<String, dynamic> toJson() => _$ApiSuccessModelToJson(this);
}
