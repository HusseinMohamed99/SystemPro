import 'package:flutter/material.dart';
import 'package:system_pro/features/Home/data/model/bottom_navigation_bar_model.dart';
import 'package:system_pro/features/Home/ui/widgets/active_bottom_nav_item.dart';
import 'package:system_pro/features/Home/ui/widgets/in_active_bottom_nav_item.dart';

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
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOutSine,
      child:
          isSelectedItem
              ? BottomNavItemActive(
                icon: bottomNavigationBarEntity.activeIcon,
                title: bottomNavigationBarEntity.title,
              )
              : InactiveNavigationItem(
                icon: bottomNavigationBarEntity.inActiveIcon,
              ),
    );
  }
}
