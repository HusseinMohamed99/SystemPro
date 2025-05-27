import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';


/// Holds the result of time difference with its unit and value.
class TimeAgoResult {

  const TimeAgoResult(this.unit, this.value);
  final TimeUnit unit;
  final int value;
}

/// Provides utility methods for formatting "time ago" strings.
class TimeAgoHelper {
  /// Calculates the time difference between now and the provided date string.
  /// Returns a [TimeAgoResult] with the appropriate unit and value.
  static TimeAgoResult getTimeDifference(String dateTimeString) {
    final parsedDate = DateTime.tryParse(dateTimeString);
    final difference = DateTime.now().difference(parsedDate ?? DateTime.now());

    if (difference.inDays > 1) {
      return TimeAgoResult(TimeUnit.days, difference.inDays);
    }
    if (difference.inDays == 1) return const TimeAgoResult(TimeUnit.days, 1);
    if (difference.inHours > 1) {
      return TimeAgoResult(TimeUnit.hours, difference.inHours);
    }
    if (difference.inHours == 1) return const TimeAgoResult(TimeUnit.hours, 1);
    if (difference.inMinutes > 1) {
      return TimeAgoResult(TimeUnit.minutes, difference.inMinutes);
    }
    if (difference.inMinutes == 1) {
      return const TimeAgoResult(TimeUnit.minutes, 1);
    }
    return const TimeAgoResult(TimeUnit.now, 0);
  }

  /// Returns a localized "time ago" string using the app's current language.
  /// Requires a [BuildContext] for localization.
  static String timeAgo(BuildContext context, String dateTimeString) {
    final diff = getTimeDifference(dateTimeString);
    switch (diff.unit) {
      case TimeUnit.days:
        return diff.value == 1
            ? context.localization.oneDayAgo
            : context.localization.daysAgo(diff.value);
      case TimeUnit.hours:
        return diff.value == 1
            ? context.localization.oneHourAgo
            : context.localization.hoursAgo(diff.value);
      case TimeUnit.minutes:
        return diff.value == 1
            ? context.localization.oneMinuteAgo
            : context.localization.minutesAgo(diff.value);
      case TimeUnit.now:
        return context.localization.justNow;
    }
  }

  /// Returns a fallback English-only "time ago" string.
  /// Useful when localization is not needed or available.
  static String timeAgoSimple(String dateTimeString) {
    final diff = getTimeDifference(dateTimeString);
    switch (diff.unit) {
      case TimeUnit.days:
        return diff.value == 1 ? '1 day ago' : '${diff.value} days ago';
      case TimeUnit.hours:
        return diff.value == 1 ? '1 hour ago' : '${diff.value} hours ago';
      case TimeUnit.minutes:
        return diff.value == 1 ? '1 minute ago' : '${diff.value} minutes ago';
      case TimeUnit.now:
        return 'Just now';
    }
  }
}
