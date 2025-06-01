import 'package:json_annotation/json_annotation.dart';

part 'marketer.g.dart';

/// Represents a marketer who manages or posts real estate listings.
/// Similar to Company, but includes email verification and timestamps.
@JsonSerializable()
class Marketer {
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

  /// Creates a [Marketer] from a JSON map.
  factory Marketer.fromJson(Map<String, dynamic> json) =>
      _$MarketerFromJson(json);

  /// Converts this instance into a JSON map.
  Map<String, dynamic> toJson() => _$MarketerToJson(this);

  /// Unique identifier of the marketer.
  final int? id;

  /// Full name.
  final String? name;

  /// Email address.
  final String? email;

  /// Role (e.g., agent, admin).
  final String? role;

  /// Account status (e.g., active, inactive).
  final String? status;

  /// Phone number.
  final String? phone;

  /// Office or home address.
  final String? address;

  /// Marketer biography or profile summary.
  final String? bio;

  /// Profile image URL.
  @JsonKey(name: 'picture_url')
  final String? pictureUrl;
}
