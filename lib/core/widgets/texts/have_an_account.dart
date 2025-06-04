import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

/// A reusable widget that shows "Have an account?"
///  with animated fade and slide effect.
/// Supports adaptive theming and gesture tap detection.
class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
    required this.title1,
    required this.title2,
    required this.onTap,
    this.animationDuration = const Duration(milliseconds: 600),
    this.textAlign = TextAlign.center,
  });

  final String title1;
  final String title2;
  final VoidCallback onTap;
  final Duration animationDuration;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    // Shared text style for consistency
    final baseTextStyle = context.titleMedium;

    // Default text style (gray or white depending on theme)
    final defaultStyle = baseTextStyle?.copyWith(
      color: AdaptiveColor.adaptiveColor(
        context: context,
        lightColor: ColorManager.softGrey,
        darkColor: ColorManager.pureWhite,
      ),
    );

    // Highlight style for the actionable part (blue and semi-bold)
    final highlightStyle = baseTextStyle?.copyWith(
      color: AdaptiveColor.adaptiveColor(
        context: context,
        lightColor: ColorManager.primaryBlue,
        darkColor: ColorManager.secondaryBlue,
      ),
      fontWeight: FontWeightHelper.semiBold,
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap, // Execute provided tap action
      child: RichText(
            textAlign: textAlign,
            text: TextSpan(
              children: [
                TextSpan(text: title1, style: defaultStyle),
                TextSpan(text: ' $title2', style: highlightStyle),
              ],
            ),
          )
          .animate()
          .fadeIn(duration: animationDuration) // Fade in animation
          .slideY(
            begin: 0.3,
            end: 0.0,
            duration: animationDuration,
          ), // Slide from bottom to neutral
    );
  }
}
