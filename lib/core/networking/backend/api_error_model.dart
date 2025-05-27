import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

/// Model representing the API Error response.
///
/// Ensure the API always returns at least [message]
///  to avoid null runtime exceptions.
@JsonSerializable()
class ApiErrorModel {
  ApiErrorModel({required this.message, this.code, this.status});

  /// Creates an instance from a JSON map.
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  /// Error message provided by the API.
  final String? message;

  /// Numeric error code provided by the API.
  final int? code;

  /// Optional status description provided by the API.
  final String? status;

  /// Converts the model instance into a JSON map.
  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}
