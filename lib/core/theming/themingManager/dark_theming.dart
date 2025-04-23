import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_family.dart';

ThemeData buildDarkTheming({Color? seedColor}) {
  return ThemeData(
    fontFamily: FontFamilyHelper.standardFont,
    scaffoldBackgroundColor: ColorManager.primaryBlue,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.primaryBlue,
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.primaryBlue,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: ColorManager.primaryBlue,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: seedColor ?? ColorManager.primaryBlue,
    ),
  );
}
