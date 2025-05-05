import 'package:json_annotation/json_annotation.dart';

part 'subcategory.g.dart';

@JsonSerializable()
class Subcategory {
  Subcategory({this.id, this.name});

  factory Subcategory.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryFromJson(json);
  final int? id;
  final String? name;
}
