import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  Company({
    this.id,
    this.name,
    this.email,
    this.role,
    this.status,
    this.phone,
    this.address,
    this.bio,
    this.createdAt,
    this.updatedAt,
    this.emailVerifiedAt,
    this.pictureUrl,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
  final int? id;
  final String? name;
  final String? email;
  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;
  final String? role;
  final String? status;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'picture_url')
  final String? pictureUrl;
  final String? phone;
  final String? address;
  final String? bio;
}
