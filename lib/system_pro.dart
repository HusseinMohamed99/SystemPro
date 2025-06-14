import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:system_pro/core/helpers/adaptive/adaptive_layout.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
import 'package:system_pro/core/routing/app_router.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/themingManager/dark_theming.dart';
import 'package:system_pro/core/theming/themingManager/light_theming.dart';
import 'package:system_pro/generated/l10n.dart';

class SystemProApp extends StatelessWidget {
  const SystemProApp({
    super.key,
    required this.appRouter,
    required this.locale,
    required this.themeMode,
  });

  final AppRouters appRouter;
  final Locale locale;
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ChangeThemingCubit>();

    return AdaptiveLayout(
      mobileLayout:
          (_) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: MaterialApp(
              title: 'System Pro',
              debugShowCheckedModeBanner: false,
              theme: buildLightTheming(textTheme: themeCubit.lightTextTheme),
              darkTheme: buildDarkTheming(textTheme: themeCubit.darkTextTheme),
              themeMode: themeMode,
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
          ),
      tabletLayout:
          (_) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: MaterialApp(
              title: 'System Pro',
              debugShowCheckedModeBanner: false,
              theme: buildLightTheming(textTheme: themeCubit.lightTextTheme),
              darkTheme: buildDarkTheming(textTheme: themeCubit.darkTextTheme),
              themeMode: themeMode,
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
          ),
      desktopLayout: (_) => const Text('Desktop Layout'),
    );
  }

  String getInitialRoute() {
    return AppConfig.isLoggedInUser ? Routes.mainView : Routes.loginView;
  }
}
