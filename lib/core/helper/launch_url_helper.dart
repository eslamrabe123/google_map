import 'package:url_launcher/url_launcher.dart';

class LaunchUrlHelper {
  const LaunchUrlHelper._();
  static Future<void> launchURLOutside(String url) async {
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }
}
