import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/networking/backend/api_error_handler.dart';
import 'package:system_pro/core/networking/backend/api_error_model.dart';

extension DataSourceExtension on DataSource {
  static final Map<DataSource, ApiErrorModel> _errorMap = {
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

  /// Retrieves the corresponding [ApiErrorModel] 
  /// based on the [DataSource] enum.
  ApiErrorModel getFailure() =>
      _errorMap[this] ??
      ApiErrorModel(
        code: ResponseCode.defaultError,
        message: ResponseMessage.defaultError,
      );
}
