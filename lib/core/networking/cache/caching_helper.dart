import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_pro/core/helpers/functions/app_logs.dart';

class CachingHelper {
  // Private constructor to prevent instantiation.
  CachingHelper._();

  static late SharedPreferences _preferences;
  // Singleton instance for SharedPreferences.
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Singleton instance for FlutterSecureStorage.
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  /// Removes a value from SharedPreferences with the given [key].
  static Future<void> removeData(String key) async {
    _logAction('Removing data', key);
    final prefs = _preferences;
    await prefs.remove(key);
  }

  /// Clears all keys and values in SharedPreferences.
  static Future<void> clearAllData() async {
    _logAction('Clearing all SharedPreferences data');
    final prefs = _preferences;
    await prefs.clear();
  }

  /// Saves a value in SharedPreferences with the given [key].
  static setData(String key, dynamic value) async {
    _logAction('Setting data', key, value);
    final prefs = _preferences;

    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      AppLogs.debugLog('Unsupported value type: ${value.runtimeType}');
    }
  }

  /// Retrieves a value from SharedPreferences based on its type.
  static getData<T>(String key) {
    _logAction('Getting data', key);
    final prefs = _preferences;
    return prefs.get(key) as T?;
  }

  /// Gets a bool value from SharedPreferences with the given [key].
  static Future<bool> getBool(String key) async {
    AppLogs.debugLog('SharedPrefHelper: Getting bool value with key: $key');
    final prefs = _preferences;
    return prefs.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with the given [key].
  static Future<double> getDouble(String key) async {
    AppLogs.debugLog('SharedPrefHelper: Getting double value with key: $key');
    final prefs = _preferences;
    return prefs.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with the given [key].
  static Future<int> getInt(String key) async {
    AppLogs.debugLog('SharedPrefHelper: Getting int value with key: $key');
    final prefs = _preferences;
    return prefs.getInt(key) ?? 0;
  }

  /// Gets a String value from SharedPreferences with the given [key].
  static getString(String key) {
    AppLogs.debugLog('SharedPrefHelper: Getting String value with key: $key');
    final prefs = _preferences;
    return prefs.getString(key) ?? '';
  }

  /// Gets a list of String values from SharedPreferences with the given [key].
  static Future<List<String>> getListString(String key) async {
    AppLogs.debugLog(
      'SharedPrefHelper: Getting List<String> value with key: $key',
    );
    final prefs = _preferences;
    return prefs.getStringList(key) ?? [];
  }

  /// Removes a specific key from FlutterSecureStorage.
  static Future<void> clearSecuredData(String key) async {
    _logAction('Removing secured data', key);
    await _secureStorage.delete(key: key);
  }

  /// Clears all keys and values in FlutterSecureStorage.
  static Future<void> clearAllSecuredData() async {
    _logAction('Clearing all secured data');
    await _secureStorage.deleteAll();
  }

  /// Saves a secured string value in FlutterSecureStorage.
  static Future<void> setSecuredString(String key, String value) async {
    _logAction('Setting secured string', key, value);
    await _secureStorage.write(key: key, value: value);
  }

  /// Retrieves a secured string value from FlutterSecureStorage.
  static Future<String> getSecuredString(String key) async {
    _logAction('Getting secured string', key);
    return await _secureStorage.read(key: key) ?? '';
  }

  /// Internal utility method to log actions.
  static void _logAction(String action, [String? key, dynamic value]) {
    final message =
        value != null
            ? 'CachingHelper: $action with key: $key and value: $value'
            : 'CachingHelper: $action with key: $key';
    AppLogs.debugLog(message);
  }
}
