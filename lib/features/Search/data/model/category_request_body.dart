import 'package:json_annotation/json_annotation.dart';

part 'category_request_body.g.dart';

@JsonSerializable()
class CategoriesRequestBody {
  CategoriesRequestBody({this.withSubcategories = true});

  @JsonKey(name: 'with_subcategories')
  final bool withSubcategories;

  Map<String, dynamic> toJson() => _$CategoriesRequestBodyToJson(this);
}
