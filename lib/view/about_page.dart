import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import 'package:guitar_learner/helpers/get_from_assets.dart';
import 'package:guitar_learner/widgets/default_card_container.dart';
import 'package:guitar_learner/widgets/default_page_scaffold.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_colors_extension.dart';
import '../widgets/default_divider.dart';

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
      title: Text(AppLocalizations.of(context)!.about),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: DefaultCardContainer(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Theme.of(context)
                                  .extension<AppColorsExtension>()!
                                  .textSecondary,
                              width: 2),
                        ),
                        child: ClipOval(
                          child: Image(
                            image:
                                AssetImage(getImageFromAssets('icon_guitar.jpg')),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        AppLocalizations.of(context)!.appTitle,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
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
                  ],
                ),
              ),
            ),
          ),
          const DefaultDivider(height: 28),
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
