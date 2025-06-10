/// Contains all API endpoint URLs used throughout the app.
class ApiConstants {
  // Base URL for all API requests.
  static const String apiBaseUrl =
      'https://sienna-woodpecker-844567.hostingersite.com/';

  // Authentication
  static const String login = 'api/v1/mobile/login';
  static const String signup = 'api/v1/mobile/register';
  static const String forgotPassword = 'api/v1/mobile/forgot-password';
  static const String emailVerify = 'api/v1/mobile/verify-registration';
  static const String checkOtp = 'api/v1/mobile/verify-reset-password';
  static const String resendOtp = 'api/v1/mobile/resend-otp';
  static const String changePassword = 'api/v1/mobile/reset-password';
  static const String logout = 'api/v1/mobile/logout';
  static const String deleteAccount = 'api/v1/mobile/delete-account';

  // User Profile
  static const String getUserData = 'api/v1/mobile/profile';
  static const String editProfile = 'api/v1/mobile/profile/update';

  // Marketplace & Listings
  static const String getMarketplaceListings =
      'api/v1/marketplace/listings/cursor';
  static const String getFavoriteRealEstate = 'api/v1/mobile/favorites';
  static const String addFavoriteRealEstate = 'api/v1/mobile/favorites';
  static const String getCategories = 'api/v1/mobile';
}
