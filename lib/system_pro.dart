import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:system_pro/core/helpers/adaptive/adaptive_layout.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/logic/localization/localization_cubit.dart';
import 'package:system_pro/core/logic/localization/localization_state.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
import 'package:system_pro/core/logic/theming/change_theming_state.dart';
import 'package:system_pro/core/routing/app_router.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/generated/l10n.dart';

class SystemProApp extends StatelessWidget {
  const SystemProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLocalizationCubit, ChangeLocalizationState>(
      builder: (context, localeState) {
        final locale = localeState.localization;

        return BlocBuilder<ChangeThemingCubit, ChangeThemingState>(
          builder: (context, themeState) {
            return AdaptiveLayout(
              mobileLayout:
                  (_) => MaterialApp(
                    title: 'System Pro',
                    debugShowCheckedModeBanner: false,
                    theme: themeState.theme,
                    darkTheme: themeState.theme,
                    themeMode:
                        themeState.isDarkMode
                            ? ThemeMode.dark
                            : ThemeMode.light,
                    locale: Locale(locale),
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    onGenerateRoute: AppRouters().generateRoute,
                    initialRoute:
                        AppConfig.isLoggedInUser
                            ? Routes.mainView
                            : Routes.loginView,
                  ),
              tabletLayout:
                  (_) => MaterialApp(
                    title: 'System Pro',
                    debugShowCheckedModeBanner: false,
                    theme: themeState.theme,
                    darkTheme: themeState.theme,
                    themeMode:
                        themeState.isDarkMode
                            ? ThemeMode.dark
                            : ThemeMode.light,
                    locale: Locale(locale),
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    onGenerateRoute: AppRouters().generateRoute,
                    initialRoute:
                        AppConfig.isLoggedInUser
                            ? Routes.mainView
                            : Routes.loginView,
                  ),
              desktopLayout: (_) => const Text('Desktop Layout'),
            );
          },
        );
      },
    );
  }
}
