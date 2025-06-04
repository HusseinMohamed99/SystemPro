import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
import 'package:system_pro/core/logic/theming/change_theming_state.dart';
import 'package:system_pro/core/widgets/appBars/basic_app_bar.dart';
import 'package:system_pro/features/Home/logic/Favorite/favorite_cubit.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/Profile/profile_cubit.dart';
import 'package:system_pro/features/Home/logic/Taps/tap_cubit.dart';
import 'package:system_pro/features/Home/ui/main_widgets/custom_bottom_navigation_bar.dart';
import 'package:system_pro/features/Home/ui/main_widgets/main_view_body.dart';

/// The root widget that sets up BLoC providers and initializes the main tab view.
class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TabCubit()),
        BlocProvider(create: (_) => getIt<MarketplaceCubit>()..initIfNeeded()),
        BlocProvider(create: (_) => getIt<FavoriteCubit>()),
        BlocProvider(create: (_) => getIt<ProfileCubit>()),
        BlocProvider(create: (_) => getIt<ChangeThemingCubit>()),
      ],
      child: const _MainViewContent(),
    );
  }
}

/// Handles tab switching and UI based on the current selected tab.
/// Loads data only once per tab using internal flags.
class _MainViewContent extends StatefulWidget {
  const _MainViewContent();

  @override
  State<_MainViewContent> createState() => _MainViewContentState();
}

class _MainViewContentState extends State<_MainViewContent> {
  late final Map<int, VoidCallback> _tabLoaders;

  @override
  void initState() {
    super.initState();

    final marketplaceCubit = context.read<MarketplaceCubit>();
    final favoriteCubit = context.read<FavoriteCubit>();
    final profileCubit = context.read<ProfileCubit>();

    // Map linking tab indices to their corresponding data loaders
    _tabLoaders = {
      0: marketplaceCubit.loadListingsOnce,
      1: favoriteCubit.loadFavoritesOnce,
      2: profileCubit.loadProfileOnce,
    };

    // Trigger first-time data load for the initial tab (Marketplace)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tabLoaders[0]?.call();
    });
  }

  /// Trigger the loader callback for the selected tab if available
  void _handleTabChange(int index) {
    _tabLoaders[index]?.call();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemingCubit, ChangeThemingState>(
      builder: (context, themeState) {
        return Scaffold(
          appBar: basicAppBar(),
          body: BlocConsumer<TabCubit, int>(
            listener: (context, tabIndex) => _handleTabChange(tabIndex),
            builder: (context, currentTab) {
              return MainTabsView(currentViewIndex: currentTab);
            },
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: context.watch<TabCubit>().state,
            onItemTapped: (index) => context.read<TabCubit>().setTab(index),
          ),
        );
      },
    );
  }
}
