import 'package:url_launcher/url_launcher.dart';

abstract final class UrlLauncherUtils {
  static Future<bool> launchUrlIfPossible({required String url, LaunchMode? mode}) async {
    final uri = Uri.tryParse(url);
    if (uri == null) {
      return false;
    }

    if (!await canLaunchUrl(uri)) {
      return false;
    }

    try {
      return await launchUrl(uri, mode: mode ?? LaunchMode.externalApplication);
    } catch (_) {
      return false;
    }
  }
}
