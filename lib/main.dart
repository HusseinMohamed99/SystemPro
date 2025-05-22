import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:system_pro/app_bootstrap.dart';
import 'package:system_pro/bloc_observer.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';
import 'package:system_pro/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await dotenv.load();
  Bloc.observer = MyBlocObserver();

  await CachingHelper.init();

  isLoggedInUser =
      !(await CachingHelper.getSecuredString(
        SharedPrefKeys.userToken,
      )).isNullOrEmpty();

  final savedLocale = CachingHelper.getString(SharedPrefKeys.selectedLanguage);
  final isDarkMode = CachingHelper.getBool(SharedPrefKeys.isDarkMode);

  AppConfig.userToken = await CachingHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  if (kReleaseMode) {
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
  } else {
    return runApp(
      ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder:
            (_, __) =>  AppBootstrap(
                initialLocale: savedLocale,
                isDarkMode: isDarkMode,
              ),
            
      ),
    );
  }
}
