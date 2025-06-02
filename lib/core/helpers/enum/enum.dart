/// Defines the types of log entries in the system logger.
enum LogType { success, debug, info, error, close }

/// Main property categories used for filtering real estate listings.
enum FilterType { residential, commercial, land }

/// User intent toggle for listings (e.g., buy, rent, or booking a property).
enum FilterToggle { buy, rent, booking }

/// Represents a unit of time used in the time difference calculation.
enum TimeUnit { days, hours, minutes, now }

/// Enum representing the different types of user roles.
enum SortType { newest, oldest, priceLow, priceHigh }

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
