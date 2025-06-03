import 'package:json_annotation/json_annotation.dart';
import 'package:system_pro/features/CompanyProfile/data/model/realestate_source.dart';

part 'marketer.g.dart';

/// Interface that defines shared fields for Company and Marketer profile views


/// Represents a marketer who manages or posts real estate listings.
/// Implements [RealEstateSource] for shared UI presentation.
@JsonSerializable()
class Marketer implements RealEstateSource {
  /// Creates a [Marketer] instance with all optional parameters.
  const Marketer({
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

  /// Factory constructor to create a [Marketer] from a JSON map.
  factory Marketer.fromJson(Map<String, dynamic> json) =>
      _$MarketerFromJson(json);

  /// Converts this [Marketer] instance into a JSON map.
  Map<String, dynamic> toJson() => _$MarketerToJson(this);

  /// Unique identifier for the marketer.
  final int? id;

  /// Full name of the marketer.
  @override
  final String? name;

  /// Email address used for contact.
  final String? email;

  /// Role of the user in the platform (e.g., agent, admin).
  final String? role;

  /// Status of the account (e.g., active, inactive).
  final String? status;

  /// Phone number for calls or messages.
  final String? phone;

  /// Marketer's address (can be office or residential).
  @override
  final String? address;

  /// Short biography or profile summary.
  @override
  final String? bio;

  /// Profile image URL.
  @override
  @JsonKey(name: 'picture_url')
  final String? pictureUrl;
}
