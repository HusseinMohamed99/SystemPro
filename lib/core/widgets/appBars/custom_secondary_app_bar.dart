import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    leadingWidth: 100.w,
    leading: Row(
      children: [
        SizedBox(width: 20.w),
        customAppBarBack(context, onBackPress: onBackPress),
      ],
    ),
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Theme.of(
        context,
      ).textTheme.headlineMedium?.copyWith(color: ColorManager.primaryBlue),
    ),
  );
}

IconButton customAppBarBack(BuildContext context, {VoidCallback? onBackPress}) {
  return IconButton(
    style: IconButton.styleFrom(
      minimumSize: Size(40.w, 40.h),
      maximumSize: Size(40.w, 40.h),
      side: BorderSide(color: ColorManager.borderGrey, width: 2.w),
    ),
    icon: Icon(
      Icons.arrow_back_ios_new,
      color: ColorManager.pureBlack,
      size: 20.sp,
    ),
    onPressed:
        onBackPress ??
        () {
          context.pop();
        },
  );
}
