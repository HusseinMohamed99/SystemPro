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
    return  MultiBlocProvider(
  providers: [
    BlocProvider<TabCubit>(create: (_) => TabCubit()),
    BlocProvider<MarketplaceCubit>(
      create: (_) {
        final cubit = getIt<MarketplaceCubit>();
        return cubit..getListings();
      },
    ),
    BlocProvider<FavoriteCubit>(
      create: (_) {
        final cubit = getIt<FavoriteCubit>();
        // لا تقم بتحميل البيانات مباشرة هنا، فقط عند الضغط على التاب
        return cubit;
      },
    ),
    BlocProvider<ProfileCubit>(
      create: (_) => getIt<ProfileCubit>()..emitGetProfileStates(),
    ),
    BlocProvider<ChangeThemingCubit>(
      create: (_) => getIt<ChangeThemingCubit>(),
    ),
  ],
  child: Scaffold(
    appBar: basicAppBar(),
    body: BlocConsumer<TabCubit, int>(
      listener: (context, index) {
        switch (index) {
          case 0:
            final marketplaceCubit = context.read<MarketplaceCubit>();
            final state = marketplaceCubit.state;
            if (state is! MarketPlaceLoading && state is! MarketPlaceSuccess) {
              marketplaceCubit.getListings();
            }
            break;
          case 1:
            final favoritesCubit = context.read<FavoriteCubit>();
            final state = favoritesCubit.state;
            if (state is! GetFavoriteLoading && state is! GetFavoriteSuccess) {
              favoritesCubit.getFavoriteListings();
            }
            break;
          case 2:
            final profileCubit = context.read<ProfileCubit>();
            if (profileCubit.state is! UserDataSuccess &&
                profileCubit.state is! UserDataLoading) {
              profileCubit.emitGetProfileStates();
            }
            break;
        }
      },
      builder: (context, currentViewIndex) {
        return MainViewBody(currentViewIndex: currentViewIndex);
      },
    ),
    bottomNavigationBar: BlocBuilder<ChangeThemingCubit, ChangeThemingState>(
      builder: (context, themeState) {
        final currentIndex = context.watch<TabCubit>().state;

        return CustomBottomNavigationBar(
          onItemTapped: (index) {
            context.read<TabCubit>().setTab(index);
          },
          currentIndex: currentIndex,
        );
      },
    ),
  ),
);
 }
}