import 'package:flutter/material.dart';
import 'package:guitar_learner/widgets/default_page_scaffold.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../theme/app_colors_extension.dart';
import '../theme/app_theme.dart';

class AboutPage extends StatelessWidget {
  final String urlLinkedin = "https://www.linkedin.com/in/viniciuscalgaro/";
  final String urlGit = "https://github.com/vinicalgaro";

  const AboutPage({super.key});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultPageScaffold(
      title: AppLocalizations.of(context)!.about,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Center(
            child: Icon(
              Icons.music_note,
              size: 80,
              color: AppTheme.brightRed,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              AppLocalizations.of(context)!.appTitle,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              final versionString = snapshot.data?.version ?? '...';
              final translatedText =
                  AppLocalizations.of(context)!.version(versionString);

              return Center(
                child: Text(
                  translatedText,
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context)
                          .extension<AppColorsExtension>()!
                          .textSecondary),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          Text(
            AppLocalizations.of(context)!.aboutAppText,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const Divider(height: 48),
          Text(
            AppLocalizations.of(context)!.dev,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: Text(AppLocalizations.of(context)!.vinciusCalgaro),
            subtitle: Text(AppLocalizations.of(context)!.mobileDeveloper),
          ),
          ListTile(
            leading: const Icon(Icons.code_outlined),
            title: Text(AppLocalizations.of(context)!.github),
            onTap: () => _launchURL(urlGit),
          ),
          ListTile(
            leading: const Icon(Icons.business_center_outlined),
            title: Text(AppLocalizations.of(context)!.linkedin),
            onTap: () => _launchURL(urlLinkedin),
          ),
        ],
      ),
    );
  }
}
