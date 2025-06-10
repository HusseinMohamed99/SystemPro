import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

/// A reusable divider that adapts its color based on the current theme.
/// Also supports custom thickness and height with default values.
class AdaptiveDivider extends StatelessWidget {
  const AdaptiveDivider({
    super.key,
    this.color,
    this.thickness = 1.0,
    this.height,
  });

  /// Optional static color override. If null, adaptive color will be used.
  final Color? color;

  /// Divider thickness (default is 1.0)
  final double thickness;

  /// Divider height (defaults to 1.h if not provided)
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color:
          color ??
          // Use adaptive color depending on theme mode
         customBorderGreyAndIconGreyColor(context), 
      thickness: thickness,
      height: height ?? 1.h,
    );
  }
}
