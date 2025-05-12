import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_family.dart';
import 'package:system_pro/core/theming/styleManager/text_style.dart';

ThemeData buildDarkTheming({required TextTheme textTheme}) {
  return ThemeData(
    fontFamily: FontFamilyHelper.standardFont,
    scaffoldBackgroundColor: ColorManager.primaryBlack,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.primaryBlack,
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.secondaryBlack,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: ColorManager.primaryBlack,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorManager.primaryBlack,
    ),
    textTheme: textTheme,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorManager.tertiaryBlack,

    ),
  );
}
