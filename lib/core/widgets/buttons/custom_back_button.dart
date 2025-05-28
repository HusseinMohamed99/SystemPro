import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

/// A separate widget that returns a back button with adaptive styling
class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, required this.context, this.onBackPress});

  final BuildContext context;
  final VoidCallback? onBackPress;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        minimumSize: Size(40.w, 40.h),
        maximumSize: Size(40.w, 40.h),
        backgroundColor: AdaptiveColor.adaptiveColor(
          context: this.context,
          lightColor: ColorManager.pureWhite,
          darkColor: ColorManager.tertiaryBlack,
        ),
        side: BorderSide(
          color: AdaptiveColor.adaptiveColor(
            context: this.context,
            lightColor: ColorManager.borderGrey,
            darkColor: ColorManager.tertiaryBlack,
          ),
          width: 2.w,
        ),
      ),
      icon: Icon(
        Icons.arrow_back_ios_new,
        size: kIconSizeDefault.sp,
        color: AdaptiveColor.adaptiveColor(
          context: this.context,
          lightColor: ColorManager.primaryBlack,
          darkColor: ColorManager.pureWhite,
        ),
      ),
      // Uses a safe pop function or fallback to avoid crash
      onPressed:
          onBackPress ??
          () {
            if (Navigator.canPop(this.context)) {
              this.context.pop();
            }
          },
    );
  }
}
