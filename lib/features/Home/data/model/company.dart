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
    this.picture,
    this.phone,
    this.address,
    this.bio,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
  final int? id;
  final String? name;
  final String? email;
  final String? role;
  final String? status;
  final String? picture;
  final String? phone;
  final String? address;
  final String? bio;
}
