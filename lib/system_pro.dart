import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/helpers/adaptive/adaptive_layout.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/logic/localization/localization_cubit.dart';
import 'package:system_pro/core/logic/localization/localization_state.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
import 'package:system_pro/core/logic/theming/change_theming_state.dart';
import 'package:system_pro/core/routing/app_router.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/themingManager/dark_theming.dart';
import 'package:system_pro/core/theming/themingManager/light_theming.dart';
import 'package:system_pro/generated/l10n.dart';

class SystemProApp extends StatelessWidget {
  const SystemProApp({super.key, required this.appRouter});

  final AppRouters appRouter;

  @override
  Widget build(BuildContext context) {
    final changeLocalizationCubit = getIt<ChangeLocalizationCubit>();
    final changeThemingCubit = getIt<ChangeThemingCubit>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<ChangeLocalizationCubit>(
          create: (context) => changeLocalizationCubit,
        ),
        BlocProvider<ChangeThemingCubit>(
          create: (context) => changeThemingCubit,
        ),
      ],
      child: BlocBuilder<ChangeLocalizationCubit, ChangeLocalizationState>(
        builder: (context, localizationState) {
          final locale = localizationState.map(
            initial: (state) => const Locale('en'),
            loading: (state) => const Locale('en'),
            loaded: (state) => Locale(state.localization),
            error: (state) => const Locale('en'),
          );

          return BlocBuilder<ChangeThemingCubit, ChangeThemingState>(
            builder: (context, themingState) {
              final theme = themingState.theme;
              final isDark = themingState.isDarkMode;

              return AdaptiveLayout(
                mobileLayout:
                    (context) => ScreenUtilInit(
                      designSize: const Size(375, 812),
                      minTextAdapt: true,
                      splitScreenMode: true,
                      builder: (_, child) {
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.portraitUp,
                          DeviceOrientation.portraitDown,
                        ]);
                        return MediaQuery(
                          data: MediaQuery.of(
                            context,
                          ).copyWith(textScaler: const TextScaler.linear(1.0)),
                          child: MaterialApp(
                            theme: buildLightTheming(
                              textTheme: changeThemingCubit.lightTextTheme,
                            ),
                            darkTheme: buildDarkTheming(
                              textTheme: changeThemingCubit.darkTextTheme,
                            ),
                            themeMode:
                                isDark ? ThemeMode.dark : ThemeMode.light,
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
                            title: 'System Pro',
                            debugShowCheckedModeBanner: false,
                          ),
                        );
                      },
                    ),

                tabletLayout: (BuildContext context) {
                  return const Text('Tablet Layout');
                },
                desktopLayout: (BuildContext context) {
                  return const Text('Desktop Layout');
                },
              );
            },
          );
        },
      ),
    );
  }

  String getInitialRoute() {
    return isLoggedInUser ? Routes.testingView : Routes.loginView;
  }
}
