
// lib/features/shared/models/company.dart
import 'package:json_annotation/json_annotation.dart';
import 'profile_entity.dart';

part 'company.g.dart';

@JsonSerializable()
class Company implements ProfileEntity {
  Company({this.name, this.pictureUrl, this.bio, this.address});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  @override
  final String? name;
  @override
  final String? pictureUrl;
  @override
  final String? bio;
  @override
  final String? address;

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
