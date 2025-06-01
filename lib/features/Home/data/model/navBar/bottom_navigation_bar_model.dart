import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/gen/assets.gen.dart';
class BottomNavigationBarEntity {
  BottomNavigationBarEntity({
    required this.inActiveIcon,
    required this.activeIcon,
    required this.title,
  });

  final String inActiveIcon, activeIcon, title;
}

List<BottomNavigationBarEntity> bottomNavBarItems(BuildContext context) => [
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
