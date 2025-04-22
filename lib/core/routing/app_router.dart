import 'package:flutter/material.dart';

class AppRouters {
  Route? generateRoute(RouteSettings settings) {
    // This arguments to be passed
    // in any screen like this (arguments as ClassName)
    final arguments = settings.arguments;

    switch (settings.name) {
      // case Routes.onBoardingView:
      //   return MaterialPageRoute(builder: (_) => const OnBoardingView());
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
