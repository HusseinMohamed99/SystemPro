import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

/// A stateless widget representing an inactive navigation bar item.
/// Uses adaptive theming for light/dark mode support.
class InactiveNavigationItem extends StatelessWidget {
  const InactiveNavigationItem({
    super.key,
    required this.icon,
    required this.title,
  });

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
              AdaptiveColor.adaptiveColor(
                context: context,
                lightColor: ColorManager.softGrey,
                darkColor: ColorManager.iconGrey,
              ),
              BlendMode.srcIn,
            ),
            // Optional: semanticsLabel: title,
          ),
          Text(
            title,
            style: context.titleSmall?.copyWith(
              color: AdaptiveColor.adaptiveColor(
                context: context,
                lightColor: ColorManager.softGrey,
                darkColor: ColorManager.hintGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
