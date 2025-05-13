// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesRequestBody _$CategoriesRequestBodyFromJson(
  Map<String, dynamic> json,
) => CategoriesRequestBody(
  withSubcategories: json['with_subcategories'] as bool? ?? true,
);

Map<String, dynamic> _$CategoriesRequestBodyToJson(
  CategoriesRequestBody instance,
) => <String, dynamic>{'with_subcategories': instance.withSubcategories};
