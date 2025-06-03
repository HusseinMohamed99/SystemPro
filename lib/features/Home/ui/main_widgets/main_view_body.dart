import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/features/Home/ui/favorites_view.dart';
import 'package:system_pro/features/Home/ui/home_view.dart';
import 'package:system_pro/features/Home/ui/profile_view.dart';

/// Displays tab content for the main screen.
/// Keeps tab states alive and optimizes rendering.
class MainTabsView extends StatelessWidget {
  const MainTabsView({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    final List<Widget> views = [
      const RepaintBoundary(child: HomeView()),
      const RepaintBoundary(child: FavoritesView()),
      const RepaintBoundary(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: kPaddingDefaultHorizontal,
            vertical: kPaddingDefaultVertical,
          ),
          child: ProfileView(),
        ),
      ),
    ];

    return IndexedStack(index: currentViewIndex, children: views);
  }
}
