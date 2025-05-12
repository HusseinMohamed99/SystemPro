import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

class BottomNavItemActive extends StatelessWidget {
  const BottomNavItemActive({
    super.key,
    required this.icon,
    required this.title,
  });
  final String icon, title;
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
                lightColor: ColorManager.primaryBlue,
                darkColor: ColorManager.secondaryBlue,
              ),
              BlendMode.srcIn,
            ),
          ),
          Text(
            title,
            style: context.titleSmall?.copyWith(
              color: AdaptiveColor.adaptiveColor(
                context: context,
                lightColor: ColorManager.primaryBlue,
                darkColor: ColorManager.secondaryBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
