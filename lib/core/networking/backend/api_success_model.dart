import 'package:json_annotation/json_annotation.dart';

part 'api_success_model.g.dart';

/// Model representing a standard successful API response.
///
/// [message]: Main success message returned from API.
/// [status]: Optional status detail from API.
@JsonSerializable()
class ApiSuccessModel {
  const ApiSuccessModel({required this.message, this.status});

  /// Creates an instance from a JSON map.
  factory ApiSuccessModel.fromJson(Map<String, dynamic> json) =>
      _$ApiSuccessModelFromJson(json);

  /// Success message provided by the API.
  final String? message;

  /// Optional status description provided by the API.
  final String? status;

  /// Converts this instance into a JSON map.
  Map<String, dynamic> toJson() => _$ApiSuccessModelToJson(this);
}
