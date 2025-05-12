import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
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
        BlocProvider<TabCubit>(create: (_) => TabCubit()),
        BlocProvider<MarketplaceCubit>(
          create: (_) => getIt<MarketplaceCubit>()..getListings(),
        ),
        BlocProvider<ProfileCubit>(
          create: (_) => getIt<ProfileCubit>()..emitGetProfileStates(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<TabCubit, int>(
            listener: (context, index) {
              final marketplaceCubit = context.read<MarketplaceCubit>();
              final profileCubit = context.read<ProfileCubit>();

              switch (index) {
                case 0: // تبويب السوق
                  marketplaceCubit.refreshListings(); // تفريغ البيانات القديمة
                  marketplaceCubit.getListings(); // تحميل بيانات جديدة
                  break;

                case 1: // تبويب المفضلة
                  if (marketplaceCubit.state is! GetFavoriteSuccess &&
                      marketplaceCubit.state is! GetFavoriteLoading) {
                    marketplaceCubit.getFavoriteListings();
                  }
                  break;

                case 2: // تبويب الملف الشخصي
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
        ),
        bottomNavigationBar: BlocBuilder<TabCubit, int>(
          builder: (context, currentViewIndex) {
            return CustomBottomNavigationBar(
              onItemTapped: (index) {
                context.read<TabCubit>().setTab(index);
              },
              currentIndex: currentViewIndex,
            );
          },
        ),
      ),
    );
  }
}
