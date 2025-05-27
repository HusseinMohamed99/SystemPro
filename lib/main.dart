import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:system_pro/app_bootstrap.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/functions/app_logs.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';
import 'package:system_pro/core/widgets/errors/init_error_screen.dart';
import 'package:system_pro/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return InitErrorScreen(error: details.exceptionAsString());
  };

  late Widget app;

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await CachingHelper.init();
    AppConfig.isLoggedInUser =
        !(await CachingHelper.getSecuredString(
          SharedPrefKeys.userToken,
        )).isNullOrEmpty();
    final savedLocale = CachingHelper.getString(
      SharedPrefKeys.selectedLanguage,
    );
    final isDarkMode = CachingHelper.getBool(SharedPrefKeys.isDarkMode);

    AppConfig.userToken = await CachingHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    app = ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (_, __) =>
              AppBootstrap(initialLocale: savedLocale, isDarkMode: isDarkMode),
    );
  } catch (e, stack) {
    AppLogs.log('Init error: $e',type: LogType.error);
    await Sentry.captureException(e, stackTrace: stack);
    app = MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitErrorScreen(error: e.toString()),
    );
  }

  runApp(app);
}
