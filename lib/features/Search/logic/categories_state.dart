import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:system_pro/features/Search/data/model/category_response.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;
  const factory CategoriesState.loading() = Loading;
  const factory CategoriesState.success(CategoryResponse data) = Success;
  const factory CategoriesState.error({required String error}) = Error;
}
