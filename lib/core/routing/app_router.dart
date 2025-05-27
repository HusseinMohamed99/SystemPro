import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/widgets/errors/init_error_screen.dart';
import 'package:system_pro/features/Authentication/ChangePassword/logic/change_password_cubit.dart';
import 'package:system_pro/features/Authentication/ChangePassword/ui/change_password_view.dart';
import 'package:system_pro/features/Authentication/ChangePassword/ui/widgets/change_password_successfully.dart';
import 'package:system_pro/features/Authentication/EmailVerify/logic/email_verify_cubit.dart';
import 'package:system_pro/features/Authentication/EmailVerify/ui/email_verify_view.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/data/model/forgot_password_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/logic/forgot_password_cubit.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/ui/forgot_password_view.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/logic/otp_cubit.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/ui/forgot_password_otp_view.dart';
import 'package:system_pro/features/Authentication/Login/logic/login_cubit.dart';
import 'package:system_pro/features/Authentication/Login/ui/login_view.dart';
import 'package:system_pro/features/Authentication/SignUp/logic/sign_up_cubit.dart';
import 'package:system_pro/features/Authentication/SignUp/ui/signup_view.dart';
import 'package:system_pro/features/CompanyProfile/logic/real_estate_cubit.dart';
import 'package:system_pro/features/CompanyProfile/ui/company_profile_view.dart';
import 'package:system_pro/features/EditProfile/ui/edit_profile_view.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';
import 'package:system_pro/features/Home/logic/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/profile_cubit.dart';
import 'package:system_pro/features/Home/ui/main_view.dart';
import 'package:system_pro/features/Home/ui/real_estate_details/real_estate_details_view.dart';
import 'package:system_pro/features/Search/data/model/filter_result_arg.dart';
import 'package:system_pro/features/Search/data/model/location_argument.dart';
import 'package:system_pro/features/Search/logic/categories_cubit.dart';
import 'package:system_pro/features/Search/ui/filter_view.dart';
import 'package:system_pro/features/Search/ui/search_view.dart';
import 'package:system_pro/features/Search/ui/widgets/filter_result_widget.dart';

// This class handles route generation and navigation within the app.
// It uses BlocProvider with GetIt for dependency injection and ensures
// type-safe argument passing to each screen.
class AppRouters {
  /// Generates the appropriate route based on
  /// the route name and optional arguments.
  /// Performs type checking on arguments to avoid runtime errors.
  /// Returns a default error page if the route or arguments are invalid.
  Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      // Login screen with injected LoginCubit.
      case Routes.loginView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginView(),
              ),
        );

      // Signup screen with injected SignupCubit.
      case Routes.signupView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<SignupCubit>(),
                child: const SignupView(),
              ),
        );

      // Forgot Password screen with injected ForgotPasswordCubit.
      case Routes.forgotPasswordView:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<ForgotPasswordCubit>(),
                child: const ForgotPasswordView(),
              ),
        );

      // Forgot Password OTP screen with type-checked arguments and OtpCubit.
      case Routes.forgotPasswordOtpView:
        if (arguments is ForgotPasswordRequestBody) {
          return MaterialPageRoute(
            builder:
                (_) => BlocProvider(
                  create: (context) => getIt<OtpCubit>(),
                  child: ForgotPasswordOtpView(arguments: arguments),
                ),
          );
        }
        return _errorRoute();

      // Reset Password screen with type-checked
      // email argument and ChangePasswordCubit.
      case Routes.resetPasswordView:
        if (arguments is String) {
          return MaterialPageRoute(
            builder:
                (_) => BlocProvider(
                  create: (context) => getIt<ChangePasswordCubit>(),
                  child: ChangePasswordView(email: arguments),
                ),
          );
        }
        return _errorRoute();

      // Password Changed confirmation screen.
      case Routes.passwordChangedView:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordSuccessfully(),
        );

      // Main screen without additional cubit injection.
      case Routes.mainView:
        return MaterialPageRoute(builder: (_) => const MainView());

      // Edit Profile screen with type-checked
      // username argument and ProfileCubit.
      case Routes.editProfileView:
        if (arguments is String) {
          return MaterialPageRoute(
            builder:
                (_) => BlocProvider(
                  create: (context) => getIt<ProfileCubit>(),
                  child: EditProfileView(userName: arguments),
                ),
          );
        }
        return _errorRoute();

      // Search screen without additional cubit injection.
      case Routes.searchView:
        return MaterialPageRoute(builder: (_) => const SearchView());

      // Filter screen with type-checked LocationArgument and CategoriesCubit.
      case Routes.filterView:
        if (arguments is LocationArgument) {
          return MaterialPageRoute(
            builder:
                (_) => BlocProvider(
                  create:
                      (context) => getIt<CategoriesCubit>()..getCategories(),
                  child: FilterView(locationArgument: arguments),
                ),
          );
        }
        return _errorRoute();

      // Company Profile screen with companyId argument and RealEstateCubit.
      case Routes.companyProfileView:
        if (arguments is int) {
          return MaterialPageRoute(
            settings: const RouteSettings(name: Routes.companyProfileView),
            builder:
                (_) => BlocProvider(
                  create:
                      (context) =>
                          getIt<RealEstateCubit>()
                            ..getListingsByCompany(companyId: arguments),
                  child: CompanyProfileView(companyID: arguments),
                ),
          );
        }
        return _errorRoute();

      // Real Estate Details screen with Listing argument.
      case Routes.realEstateDetailsView:
        if (arguments is Listing) {
          return MaterialPageRoute(
            builder: (_) => RealEstateDetailsView(listing: arguments),
          );
        }
        return _errorRoute();

      // Email Verification screen with
      // email string argument and EmailVerifyCubit.
      case Routes.emailVerifyView:
        if (arguments is String) {
          return MaterialPageRoute(
            builder:
                (_) => BlocProvider(
                  create: (context) => getIt<EmailVerifyCubit>(),
                  child: EmailVerifyView(email: arguments),
                ),
          );
        }
        return _errorRoute();

      // Filter Result screen with FilterResultArguments and MarketplaceCubit.
      case Routes.filterResultWidget:
        if (arguments is FilterResultArguments) {
          return MaterialPageRoute(
            builder:
                (_) => BlocProvider(
                  create: (context) => getIt<MarketplaceCubit>(),
                  child: FilterResultWidget(arguments: arguments),
                ),
          );
        }
        return _errorRoute();

      // Default fallback route in case of invalid route name or arguments.
      default:
        return _errorRoute();
    }
  }

  /// Returns a default error route to display when navigation
  ///  fails or arguments are invalid.
  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder:
          (_) => const InitErrorScreen(
            error: 'Page not found or invalid arguments',
          ),
    );
  }
}
