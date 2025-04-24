import 'package:json_annotation/json_annotation.dart';

part 'api_success_model.g.dart';

@JsonSerializable()
class ApiSuccessModel {
  ApiSuccessModel({required this.message, this.code, this.status});

  factory ApiSuccessModel.fromJson(Map<String, dynamic> json) =>
      _$ApiSuccessModelFromJson(json);
  String? message;
  bool? status;
  int? code;

  Map<String, dynamic> toJson() => _$ApiSuccessModelToJson(this);
}
