import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> makePhoneCall(BuildContext context, String phoneNumber) async {
  final l10n = context.localization;
  final showSnackbar = context.showSnackBar;

  final PermissionStatus status = await Permission.phone.request();

  if (status.isGranted) {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      showSnackbar(l10n.unable_to_call);
    }
  } else if (status.isPermanentlyDenied) {
    showSnackbar(l10n.call_permission_denied);
    await openAppSettings();
  } else {
    showSnackbar(l10n.call_permission_denied);
  }
}

