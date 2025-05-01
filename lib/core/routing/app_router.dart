import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/features/Authentication/ChangePassword/logic/change_password_cubit.dart';
import 'package:system_pro/features/Authentication/ChangePassword/ui/change_password_view.dart';
import 'package:system_pro/features/Authentication/ChangePassword/ui/widgets/change_password_successfully.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/data/model/forgot_password_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/logic/forgot_password_cubit.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/ui/forgot_password_view.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/logic/otp_cubit.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/ui/forgot_password_otp_view.dart';
import 'package:system_pro/features/Authentication/Login/logic/login_cubit.dart';
import 'package:system_pro/features/Authentication/Login/ui/login_view.dart';
import 'package:system_pro/features/Authentication/SignUp/logic/sign_up_cubit.dart';
import 'package:system_pro/features/Authentication/SignUp/ui/signup_view.dart';
import 'package:system_pro/features/CompanyProfile/ui/company_profile_view.dart';
import 'package:system_pro/features/EditProfile/ui/edit_profile_view.dart';
import 'package:system_pro/features/Home/ui/main_view.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_details_view.dart';
import 'package:system_pro/features/Search/data/model/location_argument.dart';
import 'package:system_pro/features/Search/ui/filter_view.dart';
import 'package:system_pro/features/Search/ui/search_view.dart';

class AppRouters {
  Route? generateRoute(RouteSettings settings) {
    // This arguments to be passed
    // in any screen like this (arguments as ClassName)
    final arguments = settings.arguments;

    switch (settings.name) {
      // case Routes.testingView:
      //   return MaterialPageRoute(builder: (_) => const TestingView());
      case Routes.loginView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginView(),
              ),
        );
      case Routes.signupView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<SignupCubit>(),
                child: const SignupView(),
              ),
        );
      case Routes.forgotPasswordView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<ForgotPasswordCubit>(),
                child: const ForgotPasswordView(),
              ),
        );
      case Routes.forgotPasswordOtpView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<OtpCubit>(),
                child: ForgotPasswordOtpView(
                  arguments: arguments as ForgotPasswordRequestBody,
                ),
              ),
        );
      case Routes.resetPasswordView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<ChangePasswordCubit>(),
                child: const ChangePasswordView(),
              ),
        );
      case Routes.passwordChangedView:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordSuccessfully(),
        );

      case Routes.mainView:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.editProfileView:
        return MaterialPageRoute(builder: (_) => const EditProfileView());
      case Routes.searchView:
        return MaterialPageRoute(builder: (_) => const SearchView());
      case Routes.filterView:
        return MaterialPageRoute(
          builder:
              (_) =>
                  FilterView(locationArgument: arguments as LocationArgument),
        );
      case Routes.companyProfileView:
        return MaterialPageRoute(builder: (_) => const CompanyProfileView());
      case Routes.realEstateDetailsView:
        return MaterialPageRoute(builder: (_) => const RealEstateDetailsView());

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
