import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

/// A customizable screen widget shown when the app fails to initialize.
class InitErrorScreen extends StatelessWidget {
  const InitErrorScreen({
    super.key,
    required this.error,
    this.title,
    this.onExit,
    this.iconColor,
    this.textColor,
    this.backgroundColor,
    this.buttonColor,
  });

  /// The main error message to display.
  final String error;

  /// Optional title (fallbacks to localization)
  final String? title;

  /// Optional callback to override the default app close behavior.
  final VoidCallback? onExit;

  /// Optional icon color
  final Color? iconColor;

  /// Optional text color
  final Color? textColor;

  /// Optional background color for scaffold
  final Color? backgroundColor;

  /// Optional button color
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: kSpacingDefault.h,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64.sp,
                      color: iconColor ?? ColorManager.errorRed,
                    ),
                    Text(
                      title ?? context.localization.init_error_title,
                      style: context.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: textColor ?? ColorManager.errorRed,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      error,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.titleMedium?.copyWith(
                        color: ColorManager.errorRed,
                      ),
                      textAlign: TextAlign.center,
                    ),  Text(
                      context.localization.unknown_error,
                      style: context.titleMedium?.copyWith(
                        color: ColorManager.errorRed,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      onPressed: onExit ?? SystemNavigator.pop,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor ?? ColorManager.errorRed,
                      ),
                      child: Text(
                        context.localization.close_app,
                        style: context.titleLarge?.copyWith(
                          color: ColorManager.pureWhite,
                        ),
                      ),
                    ),
                  ],
                )
                .allPadding(
                  vPadding: kSpacingDefault,
                  hPadding: kSpacingDefault,
                )
                .center(),
      ),
    );
  }
}
