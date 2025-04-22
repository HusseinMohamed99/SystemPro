import 'package:flutter/material.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/text_style.dart';

extension SnackBarExtension on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        backgroundColor: ColorManager.darkGrey,
        content: Text(message, style: TextStyleManager.bold13(context: this)),
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
      backgroundColor: ColorManager.darkGrey,
      content: Text('Tapped', style: TextStyleManager.bold13(context: context)),
    ),
  );
}
