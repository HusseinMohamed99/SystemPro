import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

/// A stateless widget that represents an active bottom navigation item.
/// Displays a colored icon and label depending on the theme.
class BottomNavItemActive extends StatelessWidget {
  const BottomNavItemActive({
    super.key,
    required this.icon,
    required this.title,
  });

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final Color activeColor = AdaptiveColor.adaptiveColor(
      context: context,
      lightColor: ColorManager.primaryBlue,
      darkColor: ColorManager.secondaryBlue,
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(activeColor, BlendMode.srcIn),
            // Optional: semanticsLabel: title,
          ),
          Text(title, style: context.titleSmall?.copyWith(color: activeColor)),
        ],
      ),
    );
  }
}
