import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';

class SharedPrefKeys {
  static const String userToken = 'userToken';
  static const String userData = 'userData';
  static const String selectedLanguage = 'selectedLanguage';
  static const String isDarkMode = 'isDarkMode';
  static const String recentSearchesKey = 'recent_searches';

}

bool isLoggedInUser = false;



