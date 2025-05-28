import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

/// A screen that displays an initialization error message with exit option.
class InitErrorScreen extends StatelessWidget {
  const InitErrorScreen({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 24.w,
              vertical: 24.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Error Icon
                Icon(
                  Icons.error_outline,
                  size: 64.sp,
                  color: ColorManager.errorRed,
                ),

                verticalSpacing(16),

                // Localized error title
                Text(
                  context.localization.init_error_title,
                  style: context.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorManager.pureWhite,
                  ),
                  textAlign: TextAlign.center,
                ),

                verticalSpacing(12),

                // Error message from system
                Text(
                  error,
                  style: context.titleLarge?.copyWith(
                    color: ColorManager.errorRed,
                  ),
                  textAlign: TextAlign.center,
                ),

                verticalSpacing(20),

                // Exit button
                ElevatedButton(
                  onPressed: SystemNavigator.pop, // wrap as a lambda
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.errorRed,
                  ),
                  child: Text(
                    context.localization.close_app, // e.g., "Close App"
                    style: context.titleLarge?.copyWith(
                      color: ColorManager.pureWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
