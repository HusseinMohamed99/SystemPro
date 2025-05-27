import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:system_pro/core/helpers/functions/app_logs.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> makePhoneCall(BuildContext context, String phoneNumber) async {
  final l10n = context.localization;
  final showSnackbar = context.showSnackBar;

  final status = await Permission.phone.request();

  if (status.isGranted) {
    final uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      AppLogs.log('Could not launch $uri', type: LogType.error);
      showSnackbar(l10n.unable_to_call);
    }
  } else {
    final deniedMessage = l10n.call_permission_denied;
    showSnackbar(deniedMessage);

    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
  }
}
