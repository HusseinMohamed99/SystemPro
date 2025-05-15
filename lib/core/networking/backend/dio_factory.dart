import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  static Dio getDio() {
    const Duration timeOut = Duration(minutes: 1);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() {
    dio?.options.headers = {
      'Accept': 'application/json',
      if (AppConfig.userToken?.isNotEmpty == true)
        'Authorization': 'Bearer ${AppConfig.userToken}',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers.addAll({'Authorization': 'Bearer $token'});
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
