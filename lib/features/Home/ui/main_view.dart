import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/features/Home/logic/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/profile_cubit.dart';
import 'package:system_pro/features/Home/ui/main_widgets/custom_bottom_navigation_bar.dart';
import 'package:system_pro/features/Home/ui/main_widgets/main_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  late final MarketplaceCubit marketplaceCubit;
  late final ProfileCubit profileCubit;

  @override
  void initState() {
    super.initState();
    marketplaceCubit = getIt<MarketplaceCubit>();
    profileCubit = getIt<ProfileCubit>();

    // أول شاشة (Home) مثلاً
    _handleTabChange(currentViewIndex);
  }

  void _handleTabChange(int index) {
    setState(() {
      currentViewIndex = index;
    });

    switch (index) {
      case 0: // Home
        marketplaceCubit.getListings();
        break;
      case 2: // Profile
        profileCubit.emitGetProfileStates();
        break;
      // case 2, 3... حسب الشاشات التانية
    }
  }

  @override
  void dispose() {
    marketplaceCubit.close();
    profileCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => marketplaceCubit),
        BlocProvider(create: (_) => profileCubit),
      ],
      child: Scaffold(
        body: SafeArea(child: MainViewBody(currentViewIndex: currentViewIndex)),
        bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: _handleTabChange,
        ),
      ),
    );
  }
}

