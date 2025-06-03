import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/gen/assets.gen.dart';

/// Entity representing a bottom navigation bar item.
@immutable
class BottomNavigationBarEntity {
  const BottomNavigationBarEntity({
    required this.inActiveIcon,
    required this.activeIcon,
    required this.title,
  });

  final String inActiveIcon;
  final String activeIcon;
  final String title;
}

/// Returns a fresh list of bottom nav items every time to ensure proper localization.
/// Avoids caching issues when language changes.
List<BottomNavigationBarEntity> bottomNavBarItems(BuildContext context) {
  return [
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
  ];
}
