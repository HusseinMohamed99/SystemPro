import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> makePhoneCall(BuildContext context, String phoneNumber) async {
  // اطلب صلاحية الاتصال
  final PermissionStatus status = await Permission.phone.request();

  if (status.isGranted) {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // يشغل تطبيق الاتصال مباشرة
      );
    } else {
      context.showSnackBar('لا يمكن تنفيذ المكالمة');
    }
  } else if (status.isPermanentlyDenied) {
    context.showSnackBar('من فضلك فعّل صلاحية الاتصال من الإعدادات');

    openAppSettings(); // يفتح إعدادات التطبيق
  } else {
    context.showSnackBar('تم رفض صلاحية الاتصال');
  }
}
