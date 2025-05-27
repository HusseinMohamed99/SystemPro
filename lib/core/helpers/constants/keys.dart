/// A collection of constant keys used for SharedPreferences storage.
class SharedPrefKeys {
  /// Key used to store the user's authentication token.
  static const String userToken = 'userToken';

  /// Key used to store the user's name.
  static const String name = 'name';

  /// Key used to store the user's email address.
  static const String email = 'email';

  /// Key used to store the full user object in JSON format.
  static const String userData = 'userData';

  /// Key used to store the selected language (e.g., 'ar', 'en').
  static const String selectedLanguage = 'selectedLanguage';

  /// Key used to store the current theme mode (dark/light).
  static const String isDarkMode = 'isDarkMode';

  /// Key used to store recently searched terms.
  static const String recentSearchesKey = 'recent_searches';
}

/// A global config class for holding in-memory app session data.
class AppConfig {
  /// Currently authenticated user token (null if not logged in).
  static String? userToken;

  /// Whether the current user is logged in.
  static bool isLoggedInUser = false;
}
