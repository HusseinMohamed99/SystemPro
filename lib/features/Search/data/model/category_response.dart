import 'package:json_annotation/json_annotation.dart';
part 'category_response.g.dart';
@JsonSerializable()
class CategoryResponse {
  CategoryResponse({this.message, this.data, this.status});
  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
  String? message;
  CategoryData? data;
  String? status;
}
@JsonSerializable()
class CategoryData {
  CategoryData({this.categories});
  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
  List<Category>? categories;
}
@JsonSerializable()
class Category {
  Category({
    this.id,
    this.name,
    this.description,
    this.subcategories,
    this.amenities,
  });
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  int? id;
  String? name;
  String? description;
  List<Subcategory>? subcategories;
  List<Amenity>? amenities;
}
@JsonSerializable()
class Subcategory {
  Subcategory({this.id, this.categoryId, this.name, this.description});
  factory Subcategory.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryFromJson(json);
  @JsonKey(name: 'category_id')
  int? categoryId;
  int? id;
  String? name;
  String? description;
}
@JsonSerializable()
class Amenity {
  Amenity({this.id, this.name, this.categoryId});
  factory Amenity.fromJson(Map<String, dynamic> json) =>
      _$AmenityFromJson(json);
  int? id;
  String? name;
  @JsonKey(name: 'category_id')
  int? categoryId;
}
