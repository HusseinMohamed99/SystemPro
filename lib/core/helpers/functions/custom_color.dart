import 'package:flutter/material.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

Color customWhiteAndTertiaryBlackColor(BuildContext context) {
  return AdaptiveColor.adaptiveColor(
    context: context,
    lightColor: ColorManager.pureWhite,
    darkColor: ColorManager.tertiaryBlack,
  );
}Color customBlackWhiteColor(BuildContext context) {
  return AdaptiveColor.adaptiveColor(
    context: context,
    lightColor: ColorManager.primaryBlack,
    darkColor: ColorManager.pureWhite,
  );
}

Color customWhiteAndBlackColor(BuildContext context) {
  return AdaptiveColor.adaptiveColor(
    context: context,
    lightColor: ColorManager.pureWhite,
    darkColor: ColorManager.pureBlack,
  );
}

Color customBorderGreyAndTertiaryBlackColor(BuildContext context) {
  return AdaptiveColor.adaptiveColor(
    context: context,
    lightColor: ColorManager.borderGrey,
    darkColor: ColorManager.tertiaryBlack,
  );
}

Color customPrimaryAndSecondaryBlueColor(BuildContext context) {
  return AdaptiveColor.adaptiveColor(
    context: context,
    lightColor: ColorManager.primaryBlue,
    darkColor: ColorManager.secondaryBlue,
  );
}

Color customPrimaryAndShadowBlueColor(BuildContext context) {
  return AdaptiveColor.adaptiveColor(
    context: context,
    lightColor: ColorManager.shadowBlue,
    darkColor: ColorManager.primaryBlue,
  );
}

Color customHintGreyAndBlackColor(BuildContext context) {
  return AdaptiveColor.adaptiveColor(
    context: context,
    lightColor: ColorManager.pureBlack,
    darkColor: ColorManager.hintGrey,
  );
}

Color customHintAndSoftGreyColor(BuildContext context) {
  return AdaptiveColor.adaptiveColor(
    context: context,
    lightColor: ColorManager.softGrey,
    darkColor: ColorManager.hintGrey,
  );
}

Color customPrimaryBlueAndWhiteColor(BuildContext context) {
  return AdaptiveColor.adaptiveColor(
    context: context,
    lightColor: ColorManager.primaryBlue,
    darkColor: ColorManager.pureWhite,
  );
}

Color customIconAndSoftGreyColor(BuildContext context) {
  return AdaptiveColor.adaptiveColor(
    context: context,
    lightColor: ColorManager.softGrey,
    darkColor: ColorManager.iconGrey,
  );
}

Color customShowBlueAndFourthBlackColor(BuildContext context) {
  return AdaptiveColor.adaptiveColor(
    context: context,
    lightColor: ColorManager.shadowBlue,
    darkColor: ColorManager.fourthBlack,
  );
}

Color customShowBlueAndTertiaryBlackColor(BuildContext context) {
  return AdaptiveColor.adaptiveColor(
    context: context,
    lightColor: ColorManager.shadowBlue,
    darkColor: ColorManager.tertiaryBlack,
  );
}
