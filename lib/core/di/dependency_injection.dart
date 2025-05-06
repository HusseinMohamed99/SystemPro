import 'package:dio/dio.dart';
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
import 'package:system_pro/features/Authentication/Login/data/repo/login_repo.dart';
import 'package:system_pro/features/Authentication/Login/logic/login_cubit.dart';
import 'package:system_pro/features/Authentication/SignUp/data/repo/sign_up_repo.dart';
import 'package:system_pro/features/Authentication/SignUp/logic/sign_up_cubit.dart';
import 'package:system_pro/features/EditProfile/data/repo/edit_profile_repo.dart';
import 'package:system_pro/features/EditProfile/logic/edit_profile_cubit.dart';
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';
import 'package:system_pro/features/Home/data/repos/profile_repo.dart';
import 'package:system_pro/features/Home/logic/marketplace_cubit.dart';
import 'package:system_pro/features/Home/logic/profile_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt({
  required BuildContext context,
  required String initialLocale,
  required bool isDarkMode,
}) async {
  // Dio & ApiService
  // Dio & ApiService
  if (!getIt.isRegistered<Dio>()) {
    final Dio dio = await DioFactory.getDio(); // <-- استخدم await هنا

    if (!getIt.isRegistered<ApiService>()) {
      getIt.registerSingleton<ApiService>(ApiService(dio));
    }
  }

  // THEME
  // تأجيل التسجيل إلى وقت يكون فيه context متاحًا
  final lightText = AppTextStyleManager.lightTextTheme(context);
  final darkText = AppTextStyleManager.darkTextTheme(context);

  if (!getIt.isRegistered<ChangeThemingCubit>()) {
    getIt.registerSingleton<ChangeThemingCubit>(
      ChangeThemingCubit(
        initialTheme:
            isDarkMode
                ? buildDarkTheming(textTheme: darkText)
                : buildLightTheming(textTheme: lightText),
        lightTextTheme: lightText,
        darkTextTheme: darkText,
        isDark: isDarkMode,
      ),
    );
  }

  // LOCALIZATION
  if (!getIt.isRegistered<ChangeLocalizationCubit>()) {
    final localizationCubit = ChangeLocalizationCubit();
    localizationCubit.changeLocalization(initialLocale);
    getIt.registerSingleton<ChangeLocalizationCubit>(localizationCubit);
  }
  // LOGIN
  if (!getIt.isRegistered<LoginCubit>()) {
    getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
    getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  }
  // SIGNUP
  if (!getIt.isRegistered<SignupCubit>()) {
    getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
    getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
  }
  if (!getIt.isRegistered<EmailVerifyCubit>()) {
    getIt.registerLazySingleton<EmailVerifyRepo>(
      () => EmailVerifyRepo(getIt()),
    );
    getIt.registerFactory<EmailVerifyCubit>(() => EmailVerifyCubit(getIt()));
  }

  // FORGOT PASSWORD
  if (!getIt.isRegistered<ForgotPasswordCubit>()) {
    getIt.registerLazySingleton<ForgotPasswordRepo>(
      () => ForgotPasswordRepo(getIt()),
    );
    getIt.registerFactory<ForgotPasswordCubit>(
      () => ForgotPasswordCubit(getIt()),
    );
  }
  // Send OTP
  if (!getIt.isRegistered<OtpCubit>()) {
    getIt.registerLazySingleton<OtpRepo>(() => OtpRepo(getIt()));
    getIt.registerFactory<OtpCubit>(() => OtpCubit(getIt()));
  }

  // Change Password
  if (!getIt.isRegistered<ChangePasswordCubit>()) {
    getIt.registerLazySingleton<ChangePasswordRepo>(
      () => ChangePasswordRepo(getIt()),
    );
    getIt.registerFactory<ChangePasswordCubit>(
      () => ChangePasswordCubit(getIt()),
    );
  }
  if (!getIt.isRegistered<MarketplaceCubit>()) {
    getIt.registerFactory<MarketplaceCubit>(() => MarketplaceCubit(getIt()));
    getIt.registerLazySingleton<MarketplaceRepo>(
      () => MarketplaceRepo(getIt()),
    );
  }
  if (!getIt.isRegistered<ProfileCubit>()) {
    getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));
    getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  }
  if (!getIt.isRegistered<EditProfileCubit>()) {
    getIt.registerFactory<EditProfileCubit>(() => EditProfileCubit(getIt()));
    getIt.registerLazySingleton<EditProfileRepo>(
      () => EditProfileRepo(getIt()),
    );
  }
}
