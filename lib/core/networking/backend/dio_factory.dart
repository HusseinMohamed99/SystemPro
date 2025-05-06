import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
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
    // إضافة الـ token إلى الـ headers الحالية
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
