import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:url_launcher/url_launcher.dart';

/// Launches a URL after checking an optional permission.
/// Shows localized feedback if permission is denied or URL fails to launch.
Future<void> launchUrlWithPermission({
  required BuildContext context,
  required String? url,
  LaunchMode mode = LaunchMode.externalApplication,
  Permission? requiredPermission, // Optional: pass a permission if needed
}) async {
  final l10n = context.localization;
  final showSnackbar = context.showSnackBar;

  if (url == null || url.isEmpty) {
    showSnackbar(l10n.invalid_link);
    return;
  }

  // If a permission is required, check and request it first
  if (requiredPermission != null) {
    final status = await requiredPermission.request();

    if (status.isDenied || status.isPermanentlyDenied) {
      showSnackbar(
        '${l10n.permission_required}\\n${l10n.permission_required_hint}',
      );
      if (status.isPermanentlyDenied) {
        await openAppSettings(); // Optionally open settings
      }
      return;
    }
  }

  Uri? uri;
  try {
    uri = Uri.parse(url);
  } catch (_) {
    showSnackbar(l10n.invalid_link);
    return;
  }

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: mode);
  } else {
    showSnackbar('${l10n.unable_to_open_link} $url');
  }
}
