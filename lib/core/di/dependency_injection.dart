import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:system_pro/core/logic/localization/localization_cubit.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
import 'package:system_pro/core/theming/styleManager/text_style.dart';
import 'package:system_pro/core/theming/themingManager/light_theming.dart';

final getIt = GetIt.instance;

void setupGetIt({required BuildContext context}) {
  // تأجيل التسجيل إلى وقت يكون فيه context متاحًا
  final lightText = AppTextStyleManager.lightTextTheme(context);
  final darkText = AppTextStyleManager.darkTextTheme(context);

  // تسجيل الـ Cubits بعد أن يكون context متاحًا
  if (!getIt.isRegistered<ChangeThemingCubit>()) {
    getIt.registerLazySingleton<ChangeThemingCubit>(
      () => ChangeThemingCubit(
        initialTheme: buildLightTheming(textTheme: lightText),
        lightTextTheme: lightText,
        darkTextTheme: darkText,
      ),
    );
  }

  if (!getIt.isRegistered<ChangeLocalizationCubit>()) {
    getIt.registerLazySingleton<ChangeLocalizationCubit>(
      ChangeLocalizationCubit.new,
    );
  }
}
