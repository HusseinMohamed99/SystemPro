import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> urlLauncher(
  BuildContext context,
  String? url, {
  LaunchMode mode = LaunchMode.externalApplication,
}) async {
  if (url == null || url.isEmpty) {
    context.showSnackBar(context.localization.invalid_link);
    return;
  }
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: mode);
  } else {
    context.showSnackBar('${context.localization.unable_to_open_link} $url');
  }
}
