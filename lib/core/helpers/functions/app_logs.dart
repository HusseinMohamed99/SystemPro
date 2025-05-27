import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';

/// Enum to classify log types.

/// A utility class for structured debug logging in development mode.
///
/// Logs are only shown in `kDebugMode`, and include custom emojis, ANSI color codes,
/// and current timestamp for improved visibility.
class AppLogs {
  AppLogs._();

  /// Returns current time in `minute:second:millisecond` format for tagging.
  static String get _getCurrentTime {
    final DateTime now = DateTime.now();
    return '${now.minute}:${now.second}:${now.millisecond}';
  }

  /// Unified logging method that uses [LogType] to format output.
  static void log(
    String message, {
    LogType type = LogType.debug,
    String tag = '',
  }) {
    if (!kDebugMode) return;

    late final String prefix;
    late final String ansiColor;
    late final int level;
    String time = _getCurrentTime;

    switch (type) {
      case LogType.success:
        ansiColor = '\x1B[32m';
        prefix = '✅';
        level = 0;
        tag = tag.isEmpty ? 'Success' : tag;
        break;
      case LogType.debug:
        ansiColor = '\x1B[37m';
        prefix = '🐛';
        level = 0;
        tag = tag.isEmpty ? 'Debug' : tag;
        break;
      case LogType.info:
        ansiColor = '\x1B[33m';
        prefix = '📣';
        level = 200;
        tag = tag.isEmpty ? 'Info' : tag;
        break;
      case LogType.error:
        ansiColor = '\x1B[31m';
        prefix = '❌';
        level = 1000;
        tag = tag.isEmpty ? 'Error' : tag;
        break;
      case LogType.close:
        ansiColor = '\x1B[35m';
        prefix = '🔒';
        level = 900;
        tag = tag.isEmpty ? 'Close' : tag;
        break;
    }

    dev.log(
      '$ansiColor$tag $prefix: $message\x1B[0m',
      name: '$tag $time',
      level: level,
    );
  }
}
