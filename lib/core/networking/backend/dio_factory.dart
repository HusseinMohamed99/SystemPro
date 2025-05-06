import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    const Duration timeOut = Duration(minutes: 1);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      // احصل على التوكن قبل تعيين الـ headers
      final token = await CachingHelper.getSecuredString(
        SharedPrefKeys.userToken,
      );
      dio!.options.headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      addDioInterceptor();
    }

    return dio!;
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
