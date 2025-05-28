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
  static const String noContent = ApiErrors.noContent;
  static const String badRequest = ApiErrors.badRequestError;
  static const String unauthorized = ApiErrors.unauthorizedError;
  static const String forbidden = ApiErrors.forbiddenError;
  static const String internalServerError = ApiErrors.internalServerError;
  static const String notFound = ApiErrors.notFoundError;

  static const String connectTimeout = ApiErrors.timeoutError;
  static const String cancel = ApiErrors.defaultError;
  static const String receiveTimeout = ApiErrors.timeoutError;
  static const String sendTimeout = ApiErrors.timeoutError;
  static const String cacheError = ApiErrors.cacheError;
  static const String noInternetConnection = ApiErrors.noInternetError;
  static const String defaultError = ApiErrors.defaultError;
}

/// Converts Dio errors into a unified error model.
class ErrorHandler implements Exception {
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      apiErrorModel = _handleDioError(error);
    } else {
      apiErrorModel = DataSource.defaultError.getFailure();
    }
  }

  late final ApiErrorModel apiErrorModel;
}

/// Main logic to extract error details from DioException.
ApiErrorModel _handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.getFailure();

    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();

    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();

    case DioExceptionType.badResponse:
    case DioExceptionType.unknown:
      final statusCode = error.response?.statusCode;
      final data = error.response?.data;

      // Fallbacks for common HTTP status codes
      if (statusCode != null) {
        switch (statusCode) {
          case ResponseCode.unauthorized:
            return ApiErrorModel(
              code: ResponseCode.unauthorized,
              message: ResponseMessage.unauthorized,
            );
          case ResponseCode.forbidden:
            return ApiErrorModel(
              code: ResponseCode.forbidden,
              message: ResponseMessage.forbidden,
            );
          case ResponseCode.notFound:
            return ApiErrorModel(
              code: ResponseCode.notFound,
              message: ResponseMessage.notFound,
            );
          case ResponseCode.apiLogicError:
            // For validation errors like 422
            return ApiErrorModel(
              code: ResponseCode.apiLogicError,
              message: 'Invalid input. Please check and try again.',
            );
          case ResponseCode.internalServerError:
            return ApiErrorModel(
              code: ResponseCode.internalServerError,
              message: ResponseMessage.internalServerError,
            );
        }
      }

      // Try to parse API error response if available
      if (data != null) {
        try {
          return ApiErrorModel.fromJson(data);
        } catch (_) {
          return DataSource.defaultError.getFailure();
        }
      }

      return DataSource.defaultError.getFailure();

    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();

    case DioExceptionType.connectionError:
    case DioExceptionType.badCertificate:
      return ApiErrorModel(
        code: ResponseCode.defaultError,
        message: 'Connection issue. Please check your network and try again.',
      );
  }
}

/// Optional internal status codes if API returns "success = 0"
class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
