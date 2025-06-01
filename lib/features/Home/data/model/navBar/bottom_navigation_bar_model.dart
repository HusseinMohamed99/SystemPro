import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/gen/assets.gen.dart';

/// Represents an item in the bottom navigation bar.
/// Contains the icons and title for both active and inactive states.
class BottomNavigationBarEntity {
  BottomNavigationBarEntity({
    required this.inActiveIcon,
    required this.activeIcon,
    required this.title,
  });

  final String inActiveIcon;
  final String activeIcon;
  final String title;
}

// Memoized list of bottom navigation bar items to avoid rebuilding
final _bottomNavBarItems = <BottomNavigationBarEntity>[];

/// Returns the list of items for the bottom navigation bar.
///
/// Uses [BuildContext] to get localized strings and [Assets] for icons.
/// The list is memoized for better performance.
List<BottomNavigationBarEntity> bottomNavBarItems(BuildContext context) {
  if (_bottomNavBarItems.isEmpty) {
    _bottomNavBarItems.addAll([
      BottomNavigationBarEntity(
        inActiveIcon: Assets.images.homeInActive,
        activeIcon: Assets.images.homeActive,
        title: context.localization.home,
      ),
      BottomNavigationBarEntity(
        inActiveIcon: Assets.images.heartInActive,
        activeIcon: Assets.images.heartActive,
        title: context.localization.favorites,
      ),
      BottomNavigationBarEntity(
        inActiveIcon: Assets.images.iconInActive,
        activeIcon: Assets.images.iconActive,
        title: context.localization.profile,
      ),
    ]);
  }
  return _bottomNavBarItems;
}
