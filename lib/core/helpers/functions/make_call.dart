import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:system_pro/core/helpers/functions/app_logs.dart';
import 'package:url_launcher/url_launcher.dart';

/// Attempts to initiate a phone call after requesting phone permission.
/// Provides localized error messages and logs any failures.
Future<void> makePhoneCall(BuildContext context, String phoneNumber) async {
  final l10n = context.localization;
  final showSnackbar = context.showSnackBar;

  // Request phone permission
  final status = await Permission.phone.request();

  if (status.isGranted) {
    final uri = Uri(scheme: 'tel', path: phoneNumber);

    // Attempt to launch the phone dialer
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      AppLogs.log('Could not launch $uri', type: LogType.error);
      showSnackbar(l10n.unable_to_call);
    }
  } else {
    // Handle denied or permanently denied permissions
    showSnackbar(l10n.call_permission_denied);
    if (status.isPermanentlyDenied) {
      await openAppSettings(); // Direct user to manually grant permission
    }
  }
}
