import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:system_pro/core/logic/localization/localization_cubit.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
// Core Modules
import 'package:system_pro/core/networking/backend/api_service.dart';
import 'package:system_pro/core/networking/backend/dio_factory.dart';
import 'package:system_pro/core/theming/styleManager/text_style.dart';
import 'package:system_pro/core/theming/themingManager/dark_theming.dart';
import 'package:system_pro/core/theming/themingManager/light_theming.dart';
import 'package:system_pro/features/Authentication/ChangePassword/data/repo/change_password_repo.dart';
import 'package:system_pro/features/Authentication/ChangePassword/logic/change_password_cubit.dart';
import 'package:system_pro/features/Authentication/EmailVerify/data/repo/email_verify_repo.dart';
import 'package:system_pro/features/Authentication/EmailVerify/logic/email_verify_cubit.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/data/repo/forgot_password_repo.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/logic/forgot_password_cubit.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/repo/otp_repo.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/logic/otp_cubit.dart';
// Auth Modules
import 'package:system_pro/features/Authentication/Login/data/repo/login_repo.dart';
import 'package:system_pro/features/Authentication/Login/logic/login_cubit.dart';
import 'package:system_pro/features/Authentication/SignUp/data/repo/sign_up_repo.dart';
import 'package:system_pro/features/Authentication/SignUp/logic/sign_up_cubit.dart';
// Company Profile
import 'package:system_pro/features/CompanyProfile/logic/real_estate_cubit.dart';
// Edit Profile
import 'package:system_pro/features/EditProfile/data/repo/edit_profile_repo.dart';
import 'package:system_pro/features/EditProfile/logic/edit_profile_cubit.dart';
import 'package:system_pro/features/Home/data/repos/favorite_repo.dart';
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';
// Profile & Marketplace
import 'package:system_pro/features/Home/data/repos/profile_repo.dart';
import 'package:system_pro/features/Home/logic/Favorite/favorite_cubit.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/Profile/profile_cubit.dart';
// Categories / Search
import 'package:system_pro/features/Search/data/repo/categories_repo.dart';
import 'package:system_pro/features/Search/logic/categories_cubit.dart';

final getIt = GetIt.instance;

/// Helpers to register a lazy singleton
void _registerLazySingleton<T extends Object>(T Function() factory) {
  if (!getIt.isRegistered<T>()) {
    getIt.registerLazySingleton<T>(factory);
  }
}

// Helper to register a factory
void _registerFactory<T extends Object>(T Function() factory) {
  if (!getIt.isRegistered<T>()) {
    getIt.registerFactory<T>(factory);
  }
}

/// Entry point to initialize all dependencies in the app
void setupGetIt({
  required BuildContext context,
  required String initialLocale,
  required bool isDarkMode,
}) {
  _registerCoreModule();
  _registerThemingModule(context, isDarkMode);
  _registerLocalizationModule();
  _registerAuthModule();
  _registerProfileModule();
  _registerEditProfileModule();
  _registerMarketplaceModule();
  _registerCompanyProfileModule();
  _registerCategoriesModule();
}

/// Registers core services like API service and networking layer
void _registerCoreModule() {
  if (!getIt.isRegistered<ApiService>()) {
    final dio = DioFactory.getDio();
    _registerLazySingleton(() => ApiService(dio));
  }
}

/// Registers theming logic and configuration
void _registerThemingModule(BuildContext context, bool isDarkMode) {
  final lightTextTheme = AppTextStyleManager.lightTextTheme(context);
  final darkTextTheme = AppTextStyleManager.darkTextTheme(context);

  final theme =
      isDarkMode
          ? buildDarkTheming(textTheme: darkTextTheme)
          : buildLightTheming(textTheme: lightTextTheme);

  if (!getIt.isRegistered<ChangeThemingCubit>()) {
    getIt.registerSingleton<ChangeThemingCubit>(
      ChangeThemingCubit(
        initialTheme: theme,
        lightTextTheme: lightTextTheme,
        darkTextTheme: darkTextTheme,
        isDarkMode: isDarkMode,
      ),
    );
  }
}

/// Registers localization cubit to manage app language
void _registerLocalizationModule() {
  if (!getIt.isRegistered<ChangeLocalizationCubit>()) {
    getIt.registerSingleton<ChangeLocalizationCubit>(ChangeLocalizationCubit());
  }
}

/// Registers authentication-related dependencies
void _registerAuthModule() {
  _registerLazySingleton(() => LoginRepo(getIt()));
  _registerFactory(() => LoginCubit(getIt()));

  _registerLazySingleton(() => SignupRepo(getIt()));
  _registerFactory(() => SignupCubit(getIt()));

  _registerLazySingleton(() => EmailVerifyRepo(getIt()));
  _registerFactory(() => EmailVerifyCubit(getIt()));

  _registerLazySingleton(() => ForgotPasswordRepo(getIt()));
  _registerFactory(() => ForgotPasswordCubit(getIt()));

  _registerLazySingleton(() => OtpRepo(getIt()));
  _registerFactory(() => OtpCubit(getIt()));

  _registerLazySingleton(() => ChangePasswordRepo(getIt()));
  _registerFactory(() => ChangePasswordCubit(getIt()));
}

/// Registers profile-related cubit and repository
void _registerProfileModule() {
  _registerLazySingleton(() => ProfileRepo(getIt(), getIt()));
  _registerFactory(() => ProfileCubit(getIt()));
  _registerLazySingleton(() => const FlutterSecureStorage());
  _registerLazySingleton(() => AuthLocalService(getIt()));
}

/// Registers edit profile dependencies
void _registerEditProfileModule() {
  _registerLazySingleton(() => EditProfileRepo(getIt()));
  _registerFactory(() => EditProfileCubit(getIt()));
}

/// Registers marketplace and favorites dependencies
void _registerMarketplaceModule() {
  _registerLazySingleton(() => MarketplaceRepo(getIt()));
  _registerFactory(() => MarketplaceCubit(getIt()));

  _registerLazySingleton(() => FavoriteRepo(getIt()));
  _registerFactory(() => FavoriteCubit(getIt()));
}

/// Registers real estate company profile cubit
void _registerCompanyProfileModule() {
  _registerFactory(() => RealEstateCubit(getIt()));
}

/// Registers categories search dependencies
void _registerCategoriesModule() {
  _registerLazySingleton(() => CategoriesRepo(getIt()));
  _registerFactory(() => CategoriesCubit(getIt()));
}
