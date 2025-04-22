import 'package:flutter/material.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(color: ColorManager.lighterGrey);
  }
}
