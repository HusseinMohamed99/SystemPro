import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/text_style.dart';

AppBar customSecondaryAppBar(
  BuildContext context, {
  VoidCallback? onBackPress,
  required String title,
}) {
  return AppBar(
    backgroundColor: ColorManager.pureWhite,
    elevation: 0,
    centerTitle: true,
    leading: GestureDetector(
      onTap:
          onBackPress ??
          () {
            context.pop();
          },
      child: Icon(
        Icons.arrow_back_ios_new,
        color: ColorManager.pureBlack,
        size: kIconSizeDefault.sp,
      ),
    ),
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyleManager.bold13(context: context),
    ),
  );
}
