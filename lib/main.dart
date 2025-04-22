import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/bloc_observer.dart';
import 'package:system_pro/core/routing/app_router.dart';
import 'package:system_pro/system_pro.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(SystemProApp(appRouter: AppRouters()));
}

Future<void> initServices() async {
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
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
