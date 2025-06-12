import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/functions/app_logs.dart';

/// Utility class for secure and regular local caching.
class CachingHelper {
  CachingHelper._();

  static late SharedPreferences _preferences;
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  /// Initializes the SharedPreferences instance
  ///  (should be called at app start).
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// 🔓 SharedPreferences methods

  static Future<void> removeData(String key) async {
    _log('Removing key', key: key);
    await _preferences.remove(key);
  }

  static Future<void> clearAllData() async {
    _log('Clearing SharedPreferences');
    await _preferences.clear();
  }

  static Future<void> setData(String key, dynamic value) async {
    final shortValue = _shortenValue(value);
    _log('Saving data', key: key, value: shortValue);

    try {
      if (value is String) {
        await _preferences.setString(key, value);
      } else if (value is int) {
        await _preferences.setInt(key, value);
      } else if (value is bool) {
        await _preferences.setBool(key, value);
      } else if (value is double) {
        await _preferences.setDouble(key, value);
      } else if (value is List<String>) {
        await _preferences.setStringList(key, value);
      } else {
        AppLogs.log(
          'Unsupported type: ${value.runtimeType}',
          type: LogType.error,
          tag: 'Cache',
        );
      }
    } catch (e) {
      AppLogs.log('setData error: $e', type: LogType.error, tag: 'Cache');
    }
  }

  static T? getData<T>(String key) {
    try {
      final result = _preferences.get(key) as T?;
      _log('Reading key', key: key, value: result);
      return result;
    } catch (e) {
      AppLogs.log('getData error: $e', type: LogType.error, tag: 'Cache');
      return null;
    }
  }

  static bool getBool(String key) => getData<bool>(key) ?? false;
  static double getDouble(String key) => getData<double>(key) ?? 0.0;
  static int getInt(String key) => getData<int>(key) ?? 0;
  static String getString(String key) => getData<String>(key) ?? '';
  static List<String> getListString(String key) =>
      getData<List<String>>(key) ?? [];

  /// 🔐 FlutterSecureStorage methods

  static Future<void> clearSecuredData(String key) async {
    _log('Removing secure key', key: key, tag: 'Secure');
    await _secureStorage.delete(key: key);
  }

  static Future<void> clearAllSecuredData() async {
    _log('Clearing all secure data', tag: 'Secure');
    await _secureStorage.deleteAll();
  }

  static Future<void> setSecuredString(String key, String value) async {
    _log('Saving secure key', key: key, tag: 'Secure');
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      AppLogs.log(
        'setSecuredString error: $e',
        type: LogType.error,
        tag: 'Secure',
      );
    }
  }

  static Future<String> getSecuredString(String key) async {
    _log('Reading secure key', key: key, tag: 'Secure');
    try {
      return await _secureStorage.read(key: key) ?? '';
    } catch (e) {
      AppLogs.log(
        'getSecuredString error: $e',
        type: LogType.error,
        tag: 'Secure',
      );
      return '';
    }
  }

  /// ✏️ Shortens value for clean logging.
  static String _shortenValue(dynamic value) {
    if (value is List && value.length > 10) {
      return '[List length: ${value.length}] ${value.take(3).toList()}...';
    }
    final str = value.toString();
    return str.length > 100 ? '${str.substring(0, 100)}...' : str;
  }

  /// 🪵 Unified logger with tags.
  static void _log(
    String action, {
    String? key,
    String tag = 'Cache',
    dynamic value,
    LogType type = LogType.debug,
  }) {
    final message =
        value != null
            ? '$action → key: $key → value: $value'
            : '$action → key: $key';
    AppLogs.log(message, tag: tag, value: value, type: type);
  }
}
