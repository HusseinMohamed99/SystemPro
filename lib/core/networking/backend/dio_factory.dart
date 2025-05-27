import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // for kDebugMode
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';

/// Factory class to create and configure Dio instance for network calls.
/// Uses Singleton pattern to reuse the same Dio instance across the app.
///
/// Supports:
/// - Dynamic token updates (set/clear Authorization header)
/// - Pretty logging in debug mode only
/// - Centralized error interceptor placeholder for future extension
/// - Configurable timeout durations
class DioFactory {
  DioFactory._();

  // Dio instance created once.
  static final Dio _dio = _createDio();

  /// Timeout duration configurable here (change as needed per environment).
  static const Duration _timeOut = Duration(seconds: 30);

  /// Returns the singleton Dio instance.
  static Dio getDio() => _dio;

  /// Creates and configures the Dio instance with timeouts,
  ///  headers, and interceptors.
  static Dio _createDio() {
    final dio =
        Dio()
          ..options.connectTimeout = _timeOut
          ..options.receiveTimeout = _timeOut;

    _addDioHeaders(dio);
    _addDioInterceptor(dio);

    return dio;
  }

  /// Adds default headers including Authorization if token exists.
  static void _addDioHeaders(Dio dio) {
    dio.options.headers = {
      'Accept': 'application/json',
      if (AppConfig.userToken?.isNotEmpty == true)
        'Authorization': 'Bearer ${AppConfig.userToken}',
    };
  }

  /// Sets or updates the Authorization header with the new token after login.
  static void setTokenIntoHeaderAfterLogin(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  /// Clears the Authorization header, useful on logout or token expiry.
  static void clearAuthorizationHeader() {
    _dio.options.headers.remove('Authorization');
  }

  /// Adds interceptors including:
  /// - PrettyDioLogger (only in debug mode)
  static void _addDioInterceptor(Dio dio) {
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      );
    }
  }
}
