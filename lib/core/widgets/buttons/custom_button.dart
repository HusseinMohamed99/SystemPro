import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';

/// A customizable, scalable button with optional loading and disabled states
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.backgroundColor,
    this.textStyleColor,
    this.width,
    this.isLoading = false,
    this.isDisabled = false,
    this.loadingIndicatorColor,
  });

  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? textStyleColor;
  final double? width;
  final bool isLoading;
  final bool isDisabled;
  final Color? loadingIndicatorColor;

  @override
  Widget build(BuildContext context) {
    // Disable the button when loading or explicitly disabled
    final bool shouldDisable = isDisabled || isLoading;

    return SizedBox(
      width: width ?? context.width, // Defaults to screen width
      height: kButtonHeightPrimary.h,
      child: ElevatedButton(
        onPressed: shouldDisable ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorManager.primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusLarge).r,
          ),
        ),
        child: isLoading
            ? CircularIndicator(loadingIndicatorColor: loadingIndicatorColor)
            : Text(
                text,
                textAlign: TextAlign.center,
                style: (textStyle ?? context.titleLarge)?.copyWith(
                  color: textStyleColor ?? ColorManager.pureWhite,
                ),
              ),
      ),
    );
  }
}

