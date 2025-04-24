import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/bloc_observer.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/routing/app_router.dart';
import 'package:system_pro/system_pro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  Bloc.observer = MyBlocObserver();

  runApp(
    ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => const AppBootstrap(),
    ),
  );
}

class AppBootstrap extends StatelessWidget {
  const AppBootstrap({super.key});

  @override
  Widget build(BuildContext context) {
    setupGetIt(context: context); // هنا يكون عندنا context بعد build

    return SystemProApp(appRouter: AppRouters());
  }
}


// checkIfLoggedInUser() async {
//   final String userToken = await CachingHelper.getSecuredString(
//     SharedPrefKeys.userToken,
//   );
//   final isLoggedIn = FirebaseAuthServices().isLoggedIn();
//   if (!userToken.isNullOrEmpty() && isLoggedIn) {
//     isLoggedInUser = true;
//   } else {
//     isLoggedInUser = false;
//   }
// }
