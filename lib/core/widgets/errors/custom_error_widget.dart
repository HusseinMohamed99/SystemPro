import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: context.titleMedium?.copyWith(
          color: AdaptiveColor.adaptiveColor(
            context: context,
            lightColor: ColorManager.softGray,
            darkColor: ColorManager.errorRed,
          ),
        ),
      ),
    );
  }
}
