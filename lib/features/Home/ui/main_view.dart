import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
import 'package:system_pro/core/logic/theming/change_theming_state.dart';
import 'package:system_pro/core/widgets/appBars/basic_app_bar.dart';
import 'package:system_pro/features/Home/logic/favorite_cubit.dart';
import 'package:system_pro/features/Home/logic/favorite_state.dart';
import 'package:system_pro/features/Home/logic/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/marketplace_state.dart';
import 'package:system_pro/features/Home/logic/profile_cubit.dart';
import 'package:system_pro/features/Home/logic/profile_state.dart';
import 'package:system_pro/features/Home/logic/tap_cubit.dart';
import 'package:system_pro/features/Home/ui/main_widgets/custom_bottom_navigation_bar.dart';
import 'package:system_pro/features/Home/ui/main_widgets/main_view_body.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MarketplaceCubit>().getListings();
    });
  }

  bool _needsLoading(dynamic state, List<Type> expectedStates) {
    return !expectedStates.any((type) => state.runtimeType == type);
  }

  void _handleTabChange(int tabIndex) {
    switch (tabIndex) {
      case 0:
        final marketCubit = context.read<MarketplaceCubit>();
        if (_needsLoading(marketCubit.state, [
          MarketPlaceLoading,
          MarketPlaceSuccess,
        ])) {
          marketCubit.getListings();
        }
        break;
      case 1:
        final favCubit = context.read<FavoriteCubit>();
        if (_needsLoading(favCubit.state, [
          GetFavoriteLoading,
          GetFavoriteSuccess,
        ])) {
          favCubit.getFavoriteListings();
        }
        break;
      case 2:
        final profileCubit = context.read<ProfileCubit>();
        if (_needsLoading(profileCubit.state, [
          UserDataLoading,
          UserDataSuccess,
        ])) {
          profileCubit.emitGetProfileStates();
        }
        break;
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
        builder: (context, themeState) {
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
