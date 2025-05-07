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

  late final MarketplaceCubit marketplaceCubit;
  late final ProfileCubit profileCubit;

  @override
  void initState() {
    super.initState();
    marketplaceCubit = getIt<MarketplaceCubit>();
    profileCubit = getIt<ProfileCubit>();

    // التأكد من أن البيانات لا يتم تحميلها إذا كانت قد تم تحميلها بالفعل
    if (marketplaceCubit.state is! MarketPlaceSuccess &&
        marketplaceCubit.state is! MarketPlaceLoading) {
      marketplaceCubit
          .getListings(); // تحميل البيانات فقط إذا كانت غير موجودة أو إذا كانت في حالة Loading
    }

    if (profileCubit.state is! UserDataSuccess &&
        profileCubit.state is! UserDataLoading) {
      profileCubit
          .emitGetProfileStates(); // تحميل البيانات فقط إذا كانت غير موجودة أو إذا كانت في حالة Loading
    }
  }

  void _handleTabChange(int index) {
    if (index == currentViewIndex) return;

    setState(() {
      currentViewIndex = index;
    });

    switch (index) {
      case 0: // Home
        // التحقق أولًا من حالة الـ Cubit لتجنب التحميل غير الضروري
        if (marketplaceCubit.state is! MarketPlaceSuccess &&
            marketplaceCubit.state is! MarketPlaceLoading) {
          marketplaceCubit
              .getListings(); // تحميل البيانات فقط إذا كانت غير موجودة أو إذا كانت في حالة Loading
        }
        break;
      case 2: // Profile
        // التحقق أولًا من حالة الـ Cubit لتجنب التحميل غير الضروري
        if (profileCubit.state is! UserDataSuccess &&
            profileCubit.state is! UserDataLoading) {
          profileCubit
              .emitGetProfileStates(); // تحميل البيانات فقط إذا كانت غير موجودة أو إذا كانت في حالة Loading
        }
        break;
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
        BlocProvider.value(value: marketplaceCubit),
        BlocProvider.value(value: profileCubit),
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
