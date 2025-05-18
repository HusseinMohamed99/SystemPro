import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/bloc_observer.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/logic/localization/localization_cubit.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';
import 'package:system_pro/core/routing/app_router.dart';
import 'package:system_pro/system_pro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
  final savedLocale = CachingHelper.getString(SharedPrefKeys.selectedLanguage);
  final isDarkMode = CachingHelper.getBool(SharedPrefKeys.isDarkMode);

  AppConfig.userToken = await CachingHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );

  runApp(
    ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (_, __) =>
              AppBootstrap(initialLocale: savedLocale, isDarkMode: isDarkMode),
    ),
  );
}

class AppBootstrap extends StatelessWidget {
  const AppBootstrap({
    super.key,
    required this.initialLocale,
    required this.isDarkMode,
  });

  final String initialLocale;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    setupGetIt(
      initialLocale: initialLocale,
      isDarkMode: isDarkMode,
      context: context,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ChangeLocalizationCubit>()),
        BlocProvider(create: (_) => getIt<ChangeThemingCubit>()),
      ],
      child: SystemProApp(appRouter: AppRouters()),
    );
  }
}
