import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

extension SnackBarExtension on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        backgroundColor: ColorManager.shadowBlue,
        content: Text(
          message,
          style: titleMedium?.copyWith(color: ColorManager.primaryBlue),
        ),
      ),
    );
  }
}

onTap(BuildContext context) {
  // You Can Use
  context.showSnackBar('Tapped');

  // Instead Of
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: ColorManager.shadowBlue,
      content: Text(
        'Tapped',
        style: context.titleMedium?.copyWith(color: ColorManager.errorRed),
      ),
    ),
  );
}
