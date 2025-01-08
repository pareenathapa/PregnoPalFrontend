import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  Future<void> launchURL(String url, {LaunchMode? mode}) async {
    await launchUrl(
      Uri.parse(url),
      mode: mode ?? LaunchMode.inAppBrowserView,
      browserConfiguration: const BrowserConfiguration(showTitle: true),
    );
  }
}
