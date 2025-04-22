import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/adaptive/adaptive_layout.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/routing/app_router.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/themingManager/light_theming.dart';
import 'package:system_pro/generated/l10n.dart';

class SystemProApp extends StatelessWidget {
  const SystemProApp({super.key, required this.appRouter});

  final AppRouters appRouter;

  @override
  Widget build(BuildContext context) {
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
                  theme: buildLightTheming(),
                  darkTheme: buildLightTheming(),
                  themeMode: ThemeMode.light,
                  locale: const Locale('ar'),
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  onGenerateRoute: appRouter.generateRoute,
                  title: 'Fakahani',
                  initialRoute: getInitialRoute(),
                ),
              );
            },
          ),
      tabletLayout: (context) => const Center(child: Text('Tablet Layout')),
      desktopLayout: (context) => const Center(child: Text('Desktop Layout')),
    );
  }

  String getInitialRoute() {
    return isLoggedInUser ? Routes.mainView : Routes.loginView;
  }
}
