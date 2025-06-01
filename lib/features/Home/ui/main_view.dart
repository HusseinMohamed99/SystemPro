import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
import 'package:system_pro/core/logic/theming/change_theming_state.dart';
import 'package:system_pro/core/widgets/appBars/basic_app_bar.dart';
import 'package:system_pro/features/Home/logic/Favorite/favorite_cubit.dart';
import 'package:system_pro/features/Home/logic/Favorite/favorite_state.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_state.dart';
import 'package:system_pro/features/Home/logic/Profile/profile_cubit.dart';
import 'package:system_pro/features/Home/logic/Profile/profile_state.dart';
import 'package:system_pro/features/Home/logic/Taps/tap_cubit.dart';
import 'package:system_pro/features/Home/ui/main_widgets/custom_bottom_navigation_bar.dart';
import 'package:system_pro/features/Home/ui/main_widgets/main_view_body.dart';

/// Main screen managing tabs, theming, and content loading
class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TabCubit()),
        BlocProvider(create: (_) => getIt<MarketplaceCubit>()),
        BlocProvider(create: (_) => getIt<FavoriteCubit>()),
        BlocProvider(create: (_) => getIt<ProfileCubit>()),
        BlocProvider(create: (_) => getIt<ChangeThemingCubit>()),
      ],
      child: const _MainViewContent(),
    );
  }
}

class _MainViewContent extends StatefulWidget {
  const _MainViewContent();

  @override
  State<_MainViewContent> createState() => _MainViewContentState();
}

class _MainViewContentState extends State<_MainViewContent> {
  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  void _loadInitialData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MarketplaceCubit>().getListings();
    });
  }

  /// Check if we need to fetch data depending on the current state
  bool _shouldLoad(dynamic state, List<Type> loadedStates) {
    return !loadedStates.any((type) => state.runtimeType == type);
  }

  void _handleTabChange(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _handleMarketplaceTab();
        break;
      case 1:
        _handleFavoritesTab();
        break;
      case 2:
        _handleProfileTab();
        break;
    }
  }

  void _handleMarketplaceTab() {
    final cubit = context.read<MarketplaceCubit>();
    if (_shouldLoad(cubit.state, [MarketPlaceLoading, MarketPlaceSuccess])) {
      cubit.getListings();
    }
  }

  void _handleFavoritesTab() {
    final cubit = context.read<FavoriteCubit>();
    if (_shouldLoad(cubit.state, [GetFavoriteLoading, GetFavoriteSuccess])) {
      cubit.getFavoriteListings(forceRefresh: true);
    }
  }

  void _handleProfileTab() {
    final cubit = context.read<ProfileCubit>();
    if (_shouldLoad(cubit.state, [UserDataLoading, UserDataSuccess])) {
      cubit.emitGetProfileStates();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(),
      body: BlocConsumer<TabCubit, int>(
        listener: (context, tabIndex) => _handleTabChange(tabIndex),
        builder: (context, currentTab) {
          return MainViewBody(currentViewIndex: currentTab);
        },
      ),
      bottomNavigationBar: BlocBuilder<ChangeThemingCubit, ChangeThemingState>(
        builder: (context, _) {
          final currentTab = context.watch<TabCubit>().state;
          return CustomBottomNavigationBar(
            currentIndex: currentTab,
            onItemTapped: (index) => context.read<TabCubit>().setTab(index),
          );
        },
      ),
    );
  }
}
