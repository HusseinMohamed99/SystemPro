/// Contains clear error messages to display directly to the user.
class ApiErrors {
  static const String badRequestError =
      'Invalid request. Please check your inputs.';
  static const String noContent = 'No content available.';
  static const String forbiddenError =
      'Access forbidden. Please check your permissions.';
  static const String unauthorizedError =
      'Unauthorized access. Please login again.';
  static const String notFoundError = 'Requested resource not found.';
  static const String conflictError =
      'Conflict detected. Please try again later.';
  static const String internalServerError =
      'Server encountered an error. Please try again later.';
  static const String unknownError =
      'An unknown error occurred. Please try again.';
  static const String timeoutError =
      'Request timed out. Please check your internet connection.';
  static const String defaultError =
      'Something went wrong. Please try again later.';
  static const String cacheError = 'Unable to load cached data.';
  static const String noInternetError =
      'No internet connection. Check your network.';
  static const String loadingMessage = 'Loading, please wait...';
  static const String retryAgainMessage = 'Please try again.';
  static const String ok = 'OK';
}
