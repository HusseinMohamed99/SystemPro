import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/features/Home/logic/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/marketplace_state.dart';
import 'package:system_pro/features/Home/logic/profile_cubit.dart';
import 'package:system_pro/features/Home/logic/profile_state.dart';
import 'package:system_pro/features/Home/ui/main_widgets/custom_bottom_navigation_bar.dart';
import 'package:system_pro/features/Home/ui/main_widgets/main_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  void _handleTabChange(
    int index,
    MarketplaceCubit marketplaceCubit,
    ProfileCubit profileCubit,
  ) {
    if (index == currentViewIndex) return;

    setState(() {
      currentViewIndex = index;
    });

    switch (index) {
      case 0: // Home
        if (marketplaceCubit.state is! MarketPlaceSuccess &&
            marketplaceCubit.state is! MarketPlaceLoading) {
          marketplaceCubit.getListings();
        }
        break;
      case 1: // Favorites
        if (marketplaceCubit.state is! GetFavoriteSuccess &&
            marketplaceCubit.state is! GetFavoriteLoading) {
          marketplaceCubit.getFavoriteListings();
        }
        break;
      case 2: // Profile
        if (profileCubit.state is! UserDataSuccess &&
            profileCubit.state is! UserDataLoading) {
          profileCubit.emitGetProfileStates();
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) =>
                  getIt<MarketplaceCubit>()
                    ..getListings()
                    ..getFavoriteListings(),
        ),
        BlocProvider(
          create: (_) => getIt<ProfileCubit>()..emitGetProfileStates(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final marketplaceCubit = context.read<MarketplaceCubit>();
          final profileCubit = context.read<ProfileCubit>();

          return Scaffold(
            body: SafeArea(
              child: MainViewBody(currentViewIndex: currentViewIndex),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              onItemTapped:
                  (index) =>
                      _handleTabChange(index, marketplaceCubit, profileCubit),
            ),
          );
        },
      ),
    );
  }
}
