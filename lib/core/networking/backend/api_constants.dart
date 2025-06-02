/// Contains all API endpoint URLs used throughout the app.
class ApiConstants {
  // Base URL for all API requests.
  static const String apiBaseUrl =
      'https://sienna-woodpecker-844567.hostingersite.com/';

  // Authentication
  static const String login = 'api/mobile/login';
  static const String signup = 'api/mobile/register';
  static const String forgotPassword = 'api/mobile/forgot-password';
  static const String emailVerify = 'api/mobile/verify-registration';
  static const String checkOtp = 'api/mobile/verify-reset-password';
  static const String resendOtp = 'api/mobile/resend-otp';
  static const String changePassword = 'api/mobile/reset-password';
  static const String logout = 'api/mobile/logout';
  static const String deleteAccount = 'api/mobile/delete-account';

  // User Profile
  static const String getUserData = 'api/mobile/profile';
  static const String editProfile = 'api/mobile/profile/update';

  // Marketplace & Listings
  static const String getMarketplaceListings =
      'api/marketplace/listings/cursor';
  static const String getFavoriteRealEstate = 'api/mobile/favorites';
  static const String addFavoriteRealEstate = 'api/mobile/favorites';
  static const String getCategories = 'api/mobile';
}