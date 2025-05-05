class ApiConstants {
  static const String apiBaseUrl =
      'https://sienna-woodpecker-844567.hostingersite.com/';
  static const String login = 'api/mobile/login';
  static const String signup = 'api/mobile/register';
  static const String forgotPassword = 'api/mobile/forgot-password';
  static const String emailVerify = 'api/mobile/verify-registration';
  static const String checkOtp = 'api/mobile/verify-reset-password';
  static const String resendOtp = 'api/mobile/resend-otp';
  static const String changePassword = 'api/mobile/reset-password';
  static const String getUserData = '';
  static const String editProfile = '';
  static const String getMarketplaceListings = 'api/marketplace/listings';
}

class ApiErrors {
  static const String badRequestError = 'badRequestError';
  static const String noContent = 'noContent';
  static const String forbiddenError = 'forbiddenError';
  static const String unauthorizedError = 'unauthorizedError';
  static const String notFoundError = 'notFoundError';
  static const String conflictError = 'conflictError';
  static const String internalServerError = 'internalServerError';
  static const String unknownError = 'unknownError';
  static const String timeoutError = 'timeoutError';
  static const String defaultError = 'defaultError';
  static const String cacheError = 'cacheError';
  static const String noInternetError = 'noInternetError';
  static const String loadingMessage = 'loading_message';
  static const String retryAgainMessage = 'retry_again_message';
  static const String ok = 'Ok';
}
