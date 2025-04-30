import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.backgroundColor, this.textStyleColor,
  });
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? textStyleColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: kButtonHeightPrimary.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorManager.primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusLarge).r,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style:
              textStyle ??
              Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color:textStyleColor?? ColorManager.pureWhite),
        ),
      ),
    );
  }
}
