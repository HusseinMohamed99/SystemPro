import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:system_pro/core/logic/localization/localization_cubit.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
import 'package:system_pro/core/networking/backend/api_service.dart';
import 'package:system_pro/core/networking/backend/dio_factory.dart';
import 'package:system_pro/core/theming/styleManager/text_style.dart';
import 'package:system_pro/core/theming/themingManager/light_theming.dart';
import 'package:system_pro/features/Authentication/Login/data/repo/login_repo.dart';
import 'package:system_pro/features/Authentication/Login/logic/login_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt({required BuildContext context}) {
  // Dio & ApiService
  if (!getIt.isRegistered<Dio>()) {
    final Dio dio = DioFactory.getDio();
    if (!getIt.isRegistered<ApiService>()) {
      getIt.registerSingleton<ApiService>(ApiService(dio));
    }
  }
  // THEME
  // تأجيل التسجيل إلى وقت يكون فيه context متاحًا
  final lightText = AppTextStyleManager.lightTextTheme(context);
  final darkText = AppTextStyleManager.darkTextTheme(context);

  if (!getIt.isRegistered<ChangeThemingCubit>()) {
    getIt.registerLazySingleton<ChangeThemingCubit>(
      () => ChangeThemingCubit(
        initialTheme: buildLightTheming(textTheme: lightText),
        lightTextTheme: lightText,
        darkTextTheme: darkText,
      ),
    );
  }
  // LOCALIZATION
  if (!getIt.isRegistered<ChangeLocalizationCubit>()) {
    getIt.registerLazySingleton<ChangeLocalizationCubit>(
      ChangeLocalizationCubit.new,
    );
  }

  // LOGIN
  if (!getIt.isRegistered<LoginCubit>()) {
    getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
    getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  }
}
