import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';

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
    final Color activeColor = customPrimaryAndSecondaryBlueColor(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(activeColor, BlendMode.srcIn),
          ),
          Text(title, style: context.titleSmall?.copyWith(color: activeColor)),
        ],
      ),
    );
  }
}
