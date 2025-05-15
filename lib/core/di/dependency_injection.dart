import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:system_pro/core/logic/localization/localization_cubit.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
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
// Auth Features
import 'package:system_pro/features/Authentication/Login/data/repo/login_repo.dart';
import 'package:system_pro/features/Authentication/Login/logic/login_cubit.dart';
import 'package:system_pro/features/Authentication/SignUp/data/repo/sign_up_repo.dart';
import 'package:system_pro/features/Authentication/SignUp/logic/sign_up_cubit.dart';
import 'package:system_pro/features/CompanyProfile/logic/real_estate_cubit.dart';
import 'package:system_pro/features/EditProfile/data/repo/edit_profile_repo.dart';
import 'package:system_pro/features/EditProfile/logic/edit_profile_cubit.dart';
// Other Features
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';
import 'package:system_pro/features/Home/data/repos/profile_repo.dart';
import 'package:system_pro/features/Home/logic/favorite_cubit.dart';
import 'package:system_pro/features/Home/logic/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/profile_cubit.dart';
import 'package:system_pro/features/Search/data/repo/categories_repo.dart';
import 'package:system_pro/features/Search/logic/categories_cubit.dart';

final getIt = GetIt.instance;

/// Helper for lazy singleton registration
void _registerLazySingleton<T extends Object>(T Function() factory) {
  if (!getIt.isRegistered<T>()) {
    getIt.registerLazySingleton<T>(factory);
  }
}

/// Helper for factory registration
void _registerFactory<T extends Object>(T Function() factory) {
  if (!getIt.isRegistered<T>()) {
    getIt.registerFactory<T>(factory);
  }
}

void setupGetIt({
  required BuildContext context,
  required String initialLocale,
  required bool isDarkMode,
}) {
  // ────────────────────── CORE SERVICES ──────────────────────
  if (!getIt.isRegistered<ApiService>()) {
    final dio = DioFactory.getDio();
    getIt.registerSingleton<ApiService>(ApiService(dio));
  }

  // ────────────────────── THEME SETUP ──────────────────────
  final lightTextTheme = AppTextStyleManager.lightTextTheme(context);
  final darkTextTheme = AppTextStyleManager.darkTextTheme(context);

  if (!getIt.isRegistered<ChangeThemingCubit>()) {
    getIt.registerSingleton<ChangeThemingCubit>(
      ChangeThemingCubit(
        initialTheme:
            isDarkMode
                ? buildDarkTheming(textTheme: darkTextTheme)
                : buildLightTheming(textTheme: lightTextTheme),
        lightTextTheme: lightTextTheme,
        darkTextTheme: darkTextTheme,
        isDark: isDarkMode,
      ),
    );
  }

  // ────────────────────── LOCALIZATION ──────────────────────
 if (!getIt.isRegistered<ChangeLocalizationCubit>()) {
    getIt.registerSingleton<ChangeLocalizationCubit>(ChangeLocalizationCubit());
  }


  // ────────────────────── AUTH ──────────────────────
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

  // ────────────────────── PROFILE & HOME ──────────────────────
  _registerLazySingleton(() => ProfileRepo(getIt()));
  _registerFactory(() => ProfileCubit(getIt()));

  _registerLazySingleton(() => MarketplaceRepo(getIt()));
  _registerFactory(() => MarketplaceCubit(getIt()));

  _registerLazySingleton(() => EditProfileRepo(getIt()));
  _registerFactory(() => EditProfileCubit(getIt()));

  _registerFactory(() => RealEstateCubit(getIt()));

  _registerLazySingleton(() => CategoriesRepo(getIt()));
  _registerFactory(() => CategoriesCubit(getIt()));
  _registerFactory(() =>FavoriteCubit(getIt()));

}
