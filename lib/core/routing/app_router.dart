import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/features/Authentication/Login/logic/login_cubit.dart';
import 'package:system_pro/features/Authentication/Login/ui/login_view.dart';
import 'package:system_pro/testing_view.dart';

class AppRouters {
  Route? generateRoute(RouteSettings settings) {
    // This arguments to be passed
    // in any screen like this (arguments as ClassName)
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.testingView:
        return MaterialPageRoute(builder: (_) => const TestingView());
         case Routes.loginView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginView(),
              ),
        );
      // case Routes.loginView:
      //   return MaterialPageRoute(
      //     builder:
      //         (_) => BlocProvider(
      //           create: (context) => SigninCubit(getIt<AuthRepo>()),
      //           child: const SigninView(),
      //         ),
      //   );
      //    case Routes.productDetailsView:
      //   return MaterialPageRoute(
      //     builder:
      //         (_) => BlocProvider(
      //           create: (context) => CartCubit(getIt<CartRepo>()),
      //           child: ProductsDetailsView(
      //             productEntity: arguments as ProductEntity,
      //           ),
      //         ),
      //   );
    }

    return null;
  }
}
