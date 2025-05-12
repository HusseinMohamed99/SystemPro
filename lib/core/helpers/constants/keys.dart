class SharedPrefKeys {
  static const String userToken = 'userToken';
  static const String name = 'name';
  static const String email = 'email';
  static const String userData = 'userData';
  static const String selectedLanguage = 'selectedLanguage';
  static const String isDarkMode = 'isDarkMode';
  static const String recentSearchesKey = 'recent_searches';
}

bool isLoggedInUser = false;

class AppConfig {
  static String? userToken;
}
