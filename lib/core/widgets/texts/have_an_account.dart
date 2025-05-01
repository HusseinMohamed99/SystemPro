import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
    required this.title1,
    required this.title2,
    required this.onTap,
  });
  final String title1, title2;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title1,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(
           color:   AdaptiveColor.adaptiveColor(
                context: context,
                lightColor: ColorManager.softGray,
                darkColor: ColorManager.pureWhite,
              ),
            ),
          ),
          TextSpan(
            text: ' $title2',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AdaptiveColor.adaptiveColor(
                context: context,
                lightColor: ColorManager.primaryBlue,
                darkColor: ColorManager.secondaryBlue,
              ),
              fontWeight: FontWeightHelper.semiBold,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
