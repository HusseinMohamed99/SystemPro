import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/features/Search/data/repo/categories_repo.dart';
import 'package:system_pro/features/Search/logic/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._repo) : super(const CategoriesState.initial());

  final CategoriesRepo _repo;

  Future<void> getCategories() async {
    emit(const CategoriesState.loading());

    final response = await _repo.getCategories();

    response.when(
      success: (data) {
        emit(CategoriesState.success(data));
      },
      failure: (error) {
        emit(
          CategoriesState.error(
            error: error.apiErrorModel.message ?? 'حدث خطأ',
          ),
        );
      },
    );
  }
}
