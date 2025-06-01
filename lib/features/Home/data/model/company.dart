import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

/// Represents a company associated with a listing or marketer.
/// Includes basic contact and profile info.
@JsonSerializable()
class Company {
  /// Creates a [Company] instance.
  const Company({
    this.id,
    this.name,
    this.email,
    this.role,
    this.status,
    this.phone,
    this.address,
    this.bio,
    this.pictureUrl,
  });

  /// Factory to create [Company] from a JSON map.
  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  /// Converts the current instance to a JSON map.
  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  /// Unique identifier of the company.
  final int? id;

  /// Name of the company.
  final String? name;

  /// Contact email.
  final String? email;

  /// User role (e.g., admin, agent).
  final String? role;

  /// Status (e.g., active, inactive).
  final String? status;

  /// Profile picture URL.
  @JsonKey(name: 'picture_url')
  final String? pictureUrl;

  /// Contact phone number.
  final String? phone;

  /// Office or physical address.
  final String? address;

  /// Bio or about section for the company.
  final String? bio;
}
