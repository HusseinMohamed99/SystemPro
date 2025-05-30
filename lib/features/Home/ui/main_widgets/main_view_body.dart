import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/features/Home/ui/favorites_view.dart';
import 'package:system_pro/features/Home/ui/home_view.dart';
import 'package:system_pro/features/Home/ui/profile_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [
        RepaintBoundary(child: HomeView()),
        RepaintBoundary(child: FavoritesView()),
        RepaintBoundary(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kPaddingDefaultHorizontal,
              vertical: kPaddingDefaultVertical,
            ),
            child: ProfileView(),
          ),
        ),
      ],
    );
  }
}
