import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/logic/localization/localization_cubit.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
import 'package:system_pro/system_pro.dart';

class AppBootstrap extends StatefulWidget {
  const AppBootstrap({super.key});

  @override
  State<AppBootstrap> createState() => _AppBootstrapState();
}

class _AppBootstrapState extends State<AppBootstrap> {
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      setupGetIt(
        context: context,
        initialLocale:
            'en', // initialLocale is no longer needed due to Hydrated
      );
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ChangeLocalizationCubit>()),
        BlocProvider(create: (_) => getIt<ChangeThemingCubit>()),
      ],
      child: const SystemProApp(),
    );
  }
}
