import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/logic/localization/localization_cubit.dart';
import 'package:system_pro/core/logic/localization/localization_state.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
import 'package:system_pro/core/logic/theming/change_theming_state.dart';
import 'package:system_pro/core/routing/app_router.dart';
import 'package:system_pro/system_pro.dart';

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
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _locale =
        widget.initialLocale.isNotEmpty
            ? Locale(widget.initialLocale)
            : const Locale('en');
    _themeMode = widget.isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      setupGetIt(
        initialLocale: _locale.languageCode,
        isDarkMode: _themeMode == ThemeMode.dark,
        context: context,
      );
      _initialized = true;
    }
  }

  void _updateLocale(String newLocale) {
    setState(() => _locale = Locale(newLocale));
  }

  void _updateTheme(bool isDark) {
    setState(() => _themeMode = isDark ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  Widget build(BuildContext context) {
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
