import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

/// A customizable widget to display error messages centered on screen.
/// Supports adaptive theming, text style overrides, and retry callback.
class CustomErrorTextWidget extends StatelessWidget {
  const CustomErrorTextWidget({
    super.key,
    required this.errorMessage,
    this.textStyle,
    this.textAlign = TextAlign.center,
    this.textColor,
    this.onRetry,
  });

  final String errorMessage;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final Color? textColor;

  /// Optional callback to allow retry (e.g., reload action)
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
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
            if (onRetry != null) ...[
              verticalSpacing(12),
              GestureDetector(
                onTap: onRetry,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.refresh_outlined,
                      size: kIconSizeDefault.sp,
                      color: AdaptiveColor.adaptiveColor(
                        context: context,
                        lightColor: ColorManager.primaryBlue,
                        darkColor: ColorManager.secondaryBlue,
                      ),
                    ),

                    horizontalSpacing(4),
                    Text(
                      context.localization.try_again,
                      style: context.titleMedium?.copyWith(
                        color: AdaptiveColor.adaptiveColor(
                          context: context,
                          lightColor: ColorManager.primaryBlue,
                          darkColor: ColorManager.secondaryBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        )
        .allPadding(
          vPadding: kPaddingDefaultVertical,
          hPadding: kPaddingDefaultHorizontal,
        )
        .center();
  }
}
