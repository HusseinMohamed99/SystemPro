import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';

String timeAdgo(String dateTimeString) {
  final DateTime storyTime = DateTime.parse(dateTimeString);
  final DateTime currentTime = DateTime.now();
  final Duration difference = currentTime.difference(storyTime);
  if (difference.inDays > 1) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays == 1) {
    return '1 day ago';
  } else if (difference.inHours > 1) {
    return '${difference.inHours} hours ago';
  } else if (difference.inHours == 1) {
    return '1 hour ago';
  } else if (difference.inMinutes > 1) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inMinutes == 1) {
    return '1 minute ago';
  } else {
    return 'Just now';
  }
}



String timeAgo(BuildContext context, String dateTimeString) {
  final DateTime storyTime = DateTime.parse(dateTimeString);
  final DateTime currentTime = DateTime.now();
  final Duration difference = currentTime.difference(storyTime);

  if (difference.inDays > 1) {
    return context.localization.daysAgo(difference.inDays);
  } else if (difference.inDays == 1) {
    return context.localization.oneDayAgo;
  } else if (difference.inHours > 1) {
    return context.localization.hoursAgo(difference.inHours);
  } else if (difference.inHours == 1) {
    return context.localization.oneHourAgo;
  } else if (difference.inMinutes > 1) {
    return context.localization.minutesAgo(difference.inMinutes);
  } else if (difference.inMinutes == 1) {
    return context.localization.oneMinuteAgo;
  } else {
    return context.localization.justNow;
  }
}
