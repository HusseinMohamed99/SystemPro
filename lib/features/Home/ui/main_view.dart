import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/widgets/appBars/basic_app_bar.dart';
import 'package:system_pro/features/Home/logic/Favorite/favorite_cubit.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/Profile/profile_cubit.dart';
import 'package:system_pro/features/Home/logic/Profile/profile_state.dart';
import 'package:system_pro/features/Home/logic/Taps/tap_cubit.dart';
import 'package:system_pro/features/Home/ui/main_widgets/custom_bottom_navigation_bar.dart';
import 'package:system_pro/features/Home/ui/main_widgets/main_view_body.dart';

/// The root widget that sets up BLoC providers
///  and initializes the main tab view.
class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TabCubit()),
        BlocProvider(
          create:
              (_) => getIt<MarketplaceCubit>()..initIfNeeded(context: context),
        ),
        BlocProvider(create: (_) => getIt<FavoriteCubit>()),
        BlocProvider(create: (_) => getIt<ProfileCubit>()),
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
      0: () => marketplaceCubit.initIfNeeded(context: context),
      1: () => favoriteCubit.loadFavoritesOnce(context: context),
      2: () => profileCubit.loadProfileOnce(context: context),
    };

    // Trigger first-time data load for the initial tab (Marketplace)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tabLoaders[0]?.call();
      // Validate session after initial render
      profileCubit.checkSessionValidity(
        context: context,
      ); // Check session validity
    });
  }

  /// Trigger the loader callback for the selected tab if available
  void _handleTabChange(int index) {
    _tabLoaders[index]?.call();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileDataState>(
      listenWhen: (_, state) => state is SessionExpired,
      listener: (context, state) {
        context.pushNamedAndRemoveUntil(
          Routes.loginView,
          predicate: (route) => false,
        );
      },
      child: Scaffold(
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
      ),
    );
  }
}
