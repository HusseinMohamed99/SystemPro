import 'package:flutter/material.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

extension SnackBarExtension on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        backgroundColor: ColorManager.mediumGrey,
        content: Text(
          message,
          style: Theme.of(
            this,
          ).textTheme.titleMedium?.copyWith(color: ColorManager.offWhite),
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
      backgroundColor: ColorManager.mediumGrey,
      content: Text(
        'Tapped',
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(color: ColorManager.offWhite),
      ),
    ),
  );
}
