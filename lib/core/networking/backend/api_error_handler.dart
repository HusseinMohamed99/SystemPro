import 'package:dio/dio.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/extensions/data_source_extension.dart';
import 'package:system_pro/core/networking/backend/api_error.dart';
import 'package:system_pro/core/networking/backend/api_error_model.dart';

/// Class containing standard response codes.
class ResponseCode {
  // HTTP Status Codes
  static const int success = 200;
  static const int noContent = 204;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int internalServerError = 500;
  static const int apiLogicError = 422;

  // Local Status Codes
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -7;
}

/// Class containing response messages associated with various error codes.
class ResponseMessage {
  // HTTP Response Messages
  static const String noContent = ApiErrors.noContent;
  static const String badRequest = ApiErrors.badRequestError;
  static const String unauthorized = ApiErrors.unauthorizedError;
  static const String forbidden = ApiErrors.forbiddenError;
  static const String internalServerError = ApiErrors.internalServerError;
  static const String notFound = ApiErrors.notFoundError;

  // Local Status Messages
  static const String connectTimeout = ApiErrors.timeoutError;
  static const String cancel = ApiErrors.defaultError;
  static const String receiveTimeout = ApiErrors.timeoutError;
  static const String sendTimeout = ApiErrors.timeoutError;
  static const String cacheError = ApiErrors.cacheError;
  static const String noInternetConnection = ApiErrors.noInternetError;
  static const String defaultError = ApiErrors.defaultError;
}

/// Handles exceptions and returns an [ApiErrorModel]
/// to standardize error handling.
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
      if (error.response?.data != null) {
        try {
          return ApiErrorModel.fromJson(error.response!.data);
        } catch (_) {
          return DataSource.defaultError.getFailure();
        }
      } else {
        return DataSource.defaultError.getFailure();
      }
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

/// Internal API status codes.
class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
