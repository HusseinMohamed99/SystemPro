import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/adaptive/adaptive_layout.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/logic/localization/localization_cubit.dart';
import 'package:system_pro/core/logic/localization/localization_state.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
import 'package:system_pro/core/routing/app_router.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/themingManager/dark_theming.dart';
import 'package:system_pro/core/theming/themingManager/light_theming.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/generated/l10n.dart';

class SystemProApp extends StatelessWidget {
  const SystemProApp({super.key, required this.appRouter});
  final AppRouters appRouter;

  @override
  Widget build(BuildContext context) {
    // 📍 قراءة اللغة الحالية
    final locale = context.select<ChangeLocalizationCubit, Locale?>((cubit) {
      final state = cubit.state;
      if (state is ChangeLocalizationLoaded) {
        return Locale(state.localization);
      }
      return null;
    });

    // 📍 قراءة حالة الثيم الحالي
    final isDark = context.select<ChangeThemingCubit, bool>(
      (cubit) => cubit.state.isDarkMode,
    );

    final themeCubit = context.read<ChangeThemingCubit>();

    return AdaptiveLayout(
      mobileLayout:
          (_) => ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, __) {
              // ✅ عرض مؤشر تحميل فقط إذا اللغة غير جاهزة
             if (locale == null) {
                return const Directionality(
                  textDirection: TextDirection.ltr, // أو rtl لو اللغة عربي
                  child: Scaffold(
                    body: Center(child: AdaptiveIndicator()),
                  ),
                );
              }


              return MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: MaterialApp(
                  title: 'System Pro',
                  debugShowCheckedModeBanner: false,
                  theme: buildLightTheming(
                    textTheme: themeCubit.lightTextTheme,
                  ),
                  darkTheme: buildDarkTheming(
                    textTheme: themeCubit.darkTextTheme,
                  ),
                  themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
                  locale: locale,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  onGenerateRoute: appRouter.generateRoute,
                  initialRoute: getInitialRoute(),
                ),
              );
            },
          ),
      tabletLayout: (_) => const Text('Tablet Layout'),
      desktopLayout: (_) => const Text('Desktop Layout'),
    );
  }

  String getInitialRoute() {
    return isLoggedInUser ? Routes.mainView : Routes.loginView;
  }
}
