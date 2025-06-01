import 'package:flutter/material.dart';
import 'package:system_pro/features/Home/data/model/navBar/bottom_navigation_bar_model.dart';
import 'package:system_pro/features/Home/ui/main_widgets/active_bottom_nav_item.dart';
import 'package:system_pro/features/Home/ui/main_widgets/in_active_bottom_nav_item.dart';

/// A navigation bar item that animates between active and inactive styles.
class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelectedItem,
    required this.bottomNavigationBarEntity,
  });

  final bool isSelectedItem;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    final Widget navWidget =
        isSelectedItem
            ? BottomNavItemActive(
              icon: bottomNavigationBarEntity.activeIcon,
              title: bottomNavigationBarEntity.title,
            )
            : InactiveNavigationItem(
              icon: bottomNavigationBarEntity.inActiveIcon,
              title: bottomNavigationBarEntity.title,
            );

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOutSine,
      child: navWidget,
    );
  }
}
