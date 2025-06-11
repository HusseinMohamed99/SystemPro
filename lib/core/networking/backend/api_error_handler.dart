import 'package:dio/dio.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/extensions/data_source_extension.dart';
import 'package:system_pro/core/networking/backend/api_error.dart';
import 'package:system_pro/core/networking/backend/api_error_model.dart';

/// Static response code mapping for HTTP and local errors.
class ResponseCode {
  static const int success = 200;
  static const int noContent = 204;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int internalServerError = 500;
  static const int apiLogicError = 422;

  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -7;
}

/// Default messages for known errors.
class ResponseMessage {
  static String noContent(String lang) => ApiErrors.noContent(lang);
  static String badRequest(String lang) => ApiErrors.badRequestError(lang);
  static String unauthorized(String lang) => ApiErrors.unauthorizedError(lang);
  static String forbidden(String lang) => ApiErrors.forbiddenError(lang);
  static String internalServerError(String lang) =>
      ApiErrors.internalServerError(lang);
  static String notFound(String lang) => ApiErrors.notFoundError(lang);
  static String connectTimeout(String lang) => ApiErrors.timeoutError(lang);
  static String cancel(String lang) => ApiErrors.defaultError(lang);
  static String receiveTimeout(String lang) => ApiErrors.timeoutError(lang);
  static String sendTimeout(String lang) => ApiErrors.timeoutError(lang);
  static String cacheError(String lang) => ApiErrors.cacheError(lang);
  static String noInternetConnection(String lang) =>
      ApiErrors.noInternetError(lang);
  static String defaultError(String lang) => ApiErrors.defaultError(lang);
}

/// Converts Dio errors into a unified error model.
class ErrorHandler implements Exception {
  ErrorHandler.handle(dynamic error, String lang) {
    if (error is DioException) {
      apiErrorModel = _handleDioError(error, lang);
    } else {
      apiErrorModel = DataSource.defaultError.getFailure(lang);
    }
  }

  late final ApiErrorModel apiErrorModel;
}

/// Main logic to extract error details from DioException.
ApiErrorModel _handleDioError(DioException error, String lang) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.getFailure(lang);
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure(lang);
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure(lang);
    case DioExceptionType.badResponse:
    case DioExceptionType.unknown:
      final statusCode = error.response?.statusCode;
      final data = error.response?.data;

      if (statusCode != null) {
        switch (statusCode) {
          case ResponseCode.unauthorized:
            return ApiErrorModel(
              code: ResponseCode.unauthorized,
              message: ResponseMessage.unauthorized(lang),
            );
          case ResponseCode.forbidden:
            return ApiErrorModel(
              code: ResponseCode.forbidden,
              message: ResponseMessage.forbidden(lang),
            );
          case ResponseCode.notFound:
            return ApiErrorModel(
              code: ResponseCode.notFound,
              message: ResponseMessage.notFound(lang),
            );
          case ResponseCode.apiLogicError:
            return ApiErrorModel(
              code: ResponseCode.apiLogicError,
              message: ResponseMessage.badRequest(lang),
            );
          case ResponseCode.internalServerError:
            return ApiErrorModel(
              code: ResponseCode.internalServerError,
              message: ResponseMessage.internalServerError(lang),
            );
        }
      }

      if (data != null) {
        try {
          return ApiErrorModel.fromJson(data);
        } catch (_) {
          return DataSource.defaultError.getFailure(lang);
        }
      }
      return DataSource.defaultError.getFailure(lang);

    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure(lang);

    case DioExceptionType.connectionError:
    case DioExceptionType.badCertificate:
      return ApiErrorModel(
        code: ResponseCode.defaultError,
        message: ResponseMessage.defaultError(lang),
      );
  }
}

/// Optional internal status codes if API returns "success = 0"
class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
