
// lib/features/shared/models/marketer.dart
import 'package:json_annotation/json_annotation.dart';
import 'profile_entity.dart';

part 'marketer.g.dart';

@JsonSerializable()
class Marketer implements ProfileEntity {
  Marketer({this.name, this.pictureUrl, this.bio, this.address});

  factory Marketer.fromJson(Map<String, dynamic> json) =>
      _$MarketerFromJson(json);

  @override
  final String? name;
  @override
  final String? pictureUrl;
  @override
  final String? bio;
  @override
  final String? address;

  Map<String, dynamic> toJson() => _$MarketerToJson(this);
}
