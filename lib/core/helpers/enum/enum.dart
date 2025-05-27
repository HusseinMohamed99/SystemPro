/// Defines the types of log entries in the system logger.
enum LogType { success, debug, info, error, close }

/// Main property categories used for filtering real estate listings.
enum FilterType { residential, commercial, land }

/// User intent toggle for listings (e.g., buy, rent, or booking a property).
enum FilterToggle { buy, rent, booking }

/// Represents a unit of time used in the time difference calculation.
enum TimeUnit { days, hours, minutes, now }
