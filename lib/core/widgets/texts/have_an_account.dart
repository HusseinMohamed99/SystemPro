import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
    required this.title1,
    required this.title2,
    required this.onTap,
    this.animationDuration = const Duration(milliseconds: 600),
  });

  final String title1;
  final String title2;
  final VoidCallback onTap;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    final defaultStyle = context.titleMedium?.copyWith(
      color: AdaptiveColor.adaptiveColor(
        context: context,
        lightColor: ColorManager.softGray,
        darkColor: ColorManager.pureWhite,
      ),
    );

    final highlightStyle = context.titleMedium?.copyWith(
      color: AdaptiveColor.adaptiveColor(
        context: context,
        lightColor: ColorManager.primaryBlue,
        darkColor: ColorManager.secondaryBlue,
      ),
      fontWeight: FontWeightHelper.semiBold,
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(text: title1, style: defaultStyle),
                TextSpan(text: ' $title2', style: highlightStyle),
              ],
            ),
          )
          .animate()
          .fadeIn(duration: animationDuration)
          .slideY(begin: 0.3, end: 0.0, duration: animationDuration),
    );
  }
}
