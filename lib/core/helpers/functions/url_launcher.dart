import 'package:url_launcher/url_launcher.dart';

Future<void> urlLauncher(context, String? url) async {
  if (url != null) {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
     context.customSnackBar(context, 'Could not launch $url');
    }
  }
}
