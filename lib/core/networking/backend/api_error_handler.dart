import 'package:dio/dio.dart';
import 'package:system_pro/core/networking/backend/api_constants.dart';
import 'package:system_pro/core/networking/backend/api_error_model.dart';

/// Enum representing various data source error types.
enum DataSource {
  /// Success with no content (HTTP 204).
  noContent,

  /// Bad request (HTTP 400).
  badRequest,

  /// Forbidden access (HTTP 403).
  forbidden,

  /// Unauthorized access (HTTP 401).
  unauthorized,

  /// Resource not found (HTTP 404).
  notFound,

  /// Internal server error (HTTP 500).
  internalServerError,

  /// Connection timeout.
  connectTimeout,

  /// Request was cancelled.
  cancel,

  /// Receive timeout.
  receiveTimeout,

  /// Send timeout.
  sendTimeout,

  /// Cache error.
  cacheError,

  /// No internet connection.
  noInternetConnection,

  /// Default error type.
  defaultError,
}

/// Class containing standard response codes.
class ResponseCode {
  // HTTP Status Codes
  static const int success = 200; // Success with data
  static const int noContent = 204; // Success with no data (no content)
  static const int badRequest = 400; // Failure, API rejected request
  static const int unauthorized = 401; // Failure, user is not authorized
  static const int forbidden = 403; // Failure, API rejected request
  static const int notFound = 404; // Failure, not found
  static const int internalServerError = 500; // Failure, crash on server side
  static const int apiLogicError = 422; // API logic error
  // Local Status Codes
  static const int connectTimeout = -1; // Connection timeout
  static const int cancel = -2; // Request was canceled
  static const int receiveTimeout = -3; // Receive timeout
  static const int sendTimeout = -4; // Send timeout
  static const int cacheError = -5; // Cache error
  static const int noInternetConnection = -6; // No internet connection
  static const int defaultError = -7; // Default error
}

/// Class containing response messages associated with various error codes.
class ResponseMessage {
  // HTTP Response Messages
  static const String noContent =
      ApiErrors.noContent; // Success with no data (no content)
  static const String badRequest =
      ApiErrors.badRequestError; // Failure, API rejected request
  static const String unauthorized =
      ApiErrors.unauthorizedError; // Failure, user is not authorized
  static const String forbidden =
      ApiErrors.forbiddenError; // Failure, API rejected request
  static const String internalServerError =
      ApiErrors.internalServerError; // Failure, crash on server side
  static const String notFound = ApiErrors.notFoundError; // Failure, not found
  // Local Status Messages
  static const String connectTimeout =
      ApiErrors.timeoutError; // Connection timeout
  static const String cancel = ApiErrors.defaultError; // Request was canceled
  static const String receiveTimeout =
      ApiErrors.timeoutError; // Receive timeout
  static const String sendTimeout = ApiErrors.timeoutError; // Send timeout
  static const String cacheError = ApiErrors.cacheError; // Cache error
  static const String noInternetConnection =
      ApiErrors.noInternetError; // No internet connection
  static const String defaultError = ApiErrors.defaultError; // Default error
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    final Map<DataSource, ApiErrorModel> errorMap = {
      DataSource.noContent: ApiErrorModel(
        code: ResponseCode.noContent,
        message: ResponseMessage.noContent,
      ),
      DataSource.badRequest: ApiErrorModel(
        code: ResponseCode.badRequest,
        message: ResponseMessage.badRequest,
      ),
      DataSource.forbidden: ApiErrorModel(
        code: ResponseCode.forbidden,
        message: ResponseMessage.forbidden,
      ),
      DataSource.unauthorized: ApiErrorModel(
        code: ResponseCode.unauthorized,
        message: ResponseMessage.unauthorized,
      ),
      DataSource.notFound: ApiErrorModel(
        code: ResponseCode.notFound,
        message: ResponseMessage.notFound,
      ),
      DataSource.internalServerError: ApiErrorModel(
        code: ResponseCode.internalServerError,
        message: ResponseMessage.internalServerError,
      ),
      DataSource.connectTimeout: ApiErrorModel(
        code: ResponseCode.connectTimeout,
        message: ResponseMessage.connectTimeout,
      ),
      DataSource.cancel: ApiErrorModel(
        code: ResponseCode.cancel,
        message: ResponseMessage.cancel,
      ),
      DataSource.receiveTimeout: ApiErrorModel(
        code: ResponseCode.receiveTimeout,
        message: ResponseMessage.receiveTimeout,
      ),
      DataSource.sendTimeout: ApiErrorModel(
        code: ResponseCode.sendTimeout,
        message: ResponseMessage.sendTimeout,
      ),
      DataSource.cacheError: ApiErrorModel(
        code: ResponseCode.cacheError,
        message: ResponseMessage.cacheError,
      ),
      DataSource.noInternetConnection: ApiErrorModel(
        code: ResponseCode.noInternetConnection,
        message: ResponseMessage.noInternetConnection,
      ),
      DataSource.defaultError: ApiErrorModel(
        code: ResponseCode.defaultError,
        message: ResponseMessage.defaultError,
      ),
    };
    // Return the corresponding ApiErrorModel or a default one if not found
    return errorMap[this] ??
        ApiErrorModel(
          code: ResponseCode.defaultError,
          message: ResponseMessage.defaultError,
        );
  }
}

class ErrorHandler implements Exception {
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleError(error);
    } else {
      // default error
      apiErrorModel = DataSource.defaultError.getFailure();
    }
  }
  late ApiErrorModel apiErrorModel;
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.defaultError.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.defaultError.getFailure();
  }
}

/// Class containing internal API status codes.
class ApiInternalStatus {
  /// Status code representing success.
  static const int success = 0;

  /// Status code representing failure.
  static const int failure = 1;
}
