import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

/// A customizable widget to display error messages centered on screen.
/// Supports adaptive theming, text style overrides, and responsive layout.
class CustomErrorTextWidget extends StatelessWidget {
  const CustomErrorTextWidget({
    super.key,
    required this.errorMessage,
    this.textStyle,
    this.textAlign = TextAlign.center,
    this.textColor,
  });

  /// The error message to display.
  final String errorMessage;

  /// Optional text style override.
  final TextStyle? textStyle;

  /// Optional alignment (default is center).
  final TextAlign textAlign;

  /// Optional custom color. If not provided, adapts based on theme.
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        textAlign: textAlign,
        style:
            textStyle ??
            context.titleMedium?.copyWith(
              fontSize: 16.sp,
              color:
                  textColor ??
                  AdaptiveColor.adaptiveColor(
                    context: context,
                    lightColor: ColorManager.softGray,
                    darkColor: ColorManager.hintGrey,
                  ),
            ),
      ),
    );
  }
}
