import 'package:url_launcher/url_launcher.dart';

Future<String?> launchURL(String? url) async {
  if (url != null && url.isNotEmpty) {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      return null;
    }
  }

  return "Nenhum link encontrado.";
}
