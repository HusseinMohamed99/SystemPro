import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:system_pro/bloc_observer.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/logic/localization/localization_cubit.dart';
import 'package:system_pro/core/logic/localization/localization_state.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
import 'package:system_pro/core/logic/theming/change_theming_state.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';
import 'package:system_pro/core/routing/app_router.dart';
import 'package:system_pro/firebase_options.dart';
import 'package:system_pro/system_pro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // ✅ قفل الشاشة على الوضع الرأسي فقط
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await dotenv.load();
  Bloc.observer = MyBlocObserver();

  await CachingHelper.init();

  // 🔄 تحقق من حالة المستخدم
  isLoggedInUser =
      !(await CachingHelper.getSecuredString(
        SharedPrefKeys.userToken,
      )).isNullOrEmpty();

  // 🔧 تحميل الإعدادات من التخزين
  final savedLocale =
      CachingHelper.getString(SharedPrefKeys.selectedLanguage) ?? 'en';
  final isDarkMode = CachingHelper.getBool(SharedPrefKeys.isDarkMode);

  AppConfig.userToken = await CachingHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  await SentryFlutter.init(
    (options) {
      options.dsn = dotenv.get('clientKeys');
      options.sendDefaultPii = true;
    },
    appRunner: () {
      return runApp(
        ScreenUtilInit(
          designSize: const Size(393, 852),
          minTextAdapt: true,
          splitScreenMode: true,
          builder:
              (_, __) => SentryWidget(
                child: AppBootstrap(
                  initialLocale: savedLocale,
                  isDarkMode: isDarkMode,
                ),
              ),
        ),
      );
    },
  );
}

class AppBootstrap extends StatefulWidget {
  const AppBootstrap({
    super.key,
    required this.initialLocale,
    required this.isDarkMode,
  });

  final String initialLocale;
  final bool isDarkMode;

  @override
  State<AppBootstrap> createState() => _AppBootstrapState();
}

class _AppBootstrapState extends State<AppBootstrap> {
  late Locale _locale;
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _locale =
        widget.initialLocale.isNotEmpty
            ? Locale(widget.initialLocale)
            : const Locale('en');
    _themeMode = widget.isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  void _updateLocale(String newLocale) {
    setState(() => _locale = Locale(newLocale));
  }

  void _updateTheme(bool isDark) {
    setState(() => _themeMode = isDark ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  Widget build(BuildContext context) {
    setupGetIt(
      initialLocale: _locale.languageCode,
      isDarkMode: _themeMode == ThemeMode.dark,
      context: context,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ChangeLocalizationCubit>()),
        BlocProvider(create: (_) => getIt<ChangeThemingCubit>()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ChangeLocalizationCubit, ChangeLocalizationState>(
            listener: (context, state) {
              if (state is ChangeLocalizationLoaded) {
                _updateLocale(state.localization);
              }
            },
          ),
          BlocListener<ChangeThemingCubit, ChangeThemingState>(
            listener: (context, state) {
              _updateTheme(state.isDarkMode);
            },
          ),
        ],
        child: SystemProApp(
          appRouter: AppRouters(),
          locale: _locale,
          themeMode: _themeMode,
        ),
      ),
    );
  }
}
