import 'package:flutter/material.dart';
import 'package:system_pro/features/Home/ui/favorites_view.dart';
import 'package:system_pro/features/Home/ui/home_view.dart';
import 'package:system_pro/features/Home/ui/profile_view.dart';

/// Renders the views for each main tab (Home, Favorites, Profile).
/// Uses IndexedStack to maintain the state of each screen.
/// Uses RepaintBoundary to reduce rendering overhead.
class MainTabsView extends StatelessWidget {
  const MainTabsView({super.key, required this.currentViewIndex});

  /// Currently selected tab index
  final int currentViewIndex;

  /// Static list of tab views wrapped in RepaintBoundary for performance
  static final List<Widget> _views = [
    const RepaintBoundary(child: HomeView()),
    const RepaintBoundary(child: FavoritesView()),
    const RepaintBoundary(child: ProfileView()),
  ];

  @override
  Widget build(BuildContext context) {
    return IndexedStack(index: currentViewIndex, children: _views);
  }
}
