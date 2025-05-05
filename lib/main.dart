import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/bloc_observer.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';
import 'package:system_pro/core/routing/app_router.dart';
import 'package:system_pro/system_pro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  Bloc.observer = MyBlocObserver();

  await CachingHelper.init();
  await checkIfLoggedInUser();
  final savedLocale =
      CachingHelper.getString(SharedPrefKeys.selectedLanguage) ?? 'en';
  final isDarkMode = await CachingHelper.getBool(SharedPrefKeys.isDarkMode);

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
    ); // هنا يكون عندنا context بعد build


    return SystemProApp(appRouter: AppRouters());
  }
}

checkIfLoggedInUser() async {
  final String userToken = await CachingHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
