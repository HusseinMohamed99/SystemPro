import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

/// Extension on [BuildContext] to simplify showing a styled [SnackBar].
///
/// Instead of writing:
/// ```dart
/// ScaffoldMessenger.of(context).showSnackBar(...)
/// ```
/// you can call:
/// ```dart
/// context.showSnackBar('Message');
/// ```
extension SnackBarExtension on BuildContext {
  /// Displays a [SnackBar] with consistent styling.
  ///
  /// - Duration: 2 seconds
  /// - Floating behavior
  /// - Uses [ColorManager.shadowBlue] as background
  /// - Text styled using [titleMedium] with [primaryBlue]
  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 2),
    Color? backgroundColor,
    TextStyle? textStyle,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: duration,
        backgroundColor: backgroundColor ?? ColorManager.shadowBlue,
        content: Text(
          message,
          style:
              textStyle ??
              titleMedium?.copyWith(color: ColorManager.primaryBlue),
        ),
      ),
    );
  }
}
