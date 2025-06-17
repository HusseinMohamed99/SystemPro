import 'package:json_annotation/json_annotation.dart';
import 'package:system_pro/features/CompanyProfile/data/model/realestate_source.dart';

part 'company.g.dart';

/// Interface for any real estate source (Company or Marketer)
/// Provides common profile fields such as name, image, address, and bio


/// Represents a company associated with listings or marketing activities.
/// Implements [RealEstateSource] to allow unified display with marketers.
@JsonSerializable()
class Company implements RealEstateSource {
  /// Creates a [Company] instance with optional details.
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

  /// Factory constructor to create a [Company] instance from a JSON map.
  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  /// Converts the current [Company] instance to a JSON map.
  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  /// Unique identifier of the company.
  final int? id;

  /// Company name, also used for display.
  @override
  final String? name;

  /// Contact email for the company.
  @override
  final String? email;

  /// User role (e.g., admin, agent, owner).
  @override
  final String? role;

  /// Account status (e.g., active, suspended).
  @override
  final String? status;

  /// Profile picture URL of the company.
  @override
  @JsonKey(name: 'picture_url')
  final String? pictureUrl;

  /// Contact phone number for customer inquiries.
  @override
  final String? phone;

  /// Company’s physical or mailing address.
  @override
  final String? address;

  /// A short biography or description about the company.
  @override
  final String? bio;
}
