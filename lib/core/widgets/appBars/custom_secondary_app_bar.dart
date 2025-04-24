import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

AppBar customSecondaryAppBar(
  BuildContext context, {
  VoidCallback? onBackPress,
  String? title,
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
      child: Container(
        width: 2.w,
        height: 2.h,
        decoration: ShapeDecoration(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: const BorderSide(
              strokeAlign: BorderSide.strokeAlignOutside,
              color: ColorManager.borderGrey,
            ),
          ),
        ),

        child: Icon(
          Icons.arrow_back_ios_new,
          color: ColorManager.pureBlack,
          size: kIconSizeDefault.sp,
        ),
      ),
    ),
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      // style: TextStyleManager.bold13(context: context),
    ),
  );
}
