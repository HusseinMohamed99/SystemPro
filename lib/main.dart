import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:system_pro/app_bootstrap.dart';
import 'package:system_pro/bloc_observer.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
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

    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory:
          kIsWeb
              ? HydratedStorageDirectory.web
              : HydratedStorageDirectory(
                await getTemporaryDirectory().then((d) => d.path),
              ),
    );
    AppConfig.isLoggedInUser =
        !(await CachingHelper.getSecuredString(
          SharedPrefKeys.userToken,
        )).isNullOrEmpty();
    AppConfig.userToken = await CachingHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    await CachingHelper.init();
    Bloc.observer = MyBlocObserver();

    app = ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return const AppBootstrap();
      },
    );
  } catch (e, stack) {
    AppLogs.log('Init error: $e', type: LogType.error);
    await Sentry.captureException(e, stackTrace: stack);
    app = MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitErrorScreen(error: e.toString()),
    );
  }

  runApp(app);
}
