import 'package:flutter/material.dart';
import 'package:guitar_notebook/helpers/get_from_assets.dart';
import 'package:guitar_notebook/widgets/default_card_container.dart';
import 'package:guitar_notebook/widgets/default_image_builder.dart';
import 'package:guitar_notebook/widgets/default_page_scaffold.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../l10n/app_localizations.dart';
import '../helpers/helper_launcher.dart';
import '../theme/app_colors_extension.dart';
import '../widgets/default_divider.dart';

class AboutPage extends StatelessWidget {
  final String urlLinkedin = "https://www.linkedin.com/in/viniciuscalgaro/";
  final String urlGit = "https://github.com/vinicalgaro";

  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPageScaffold(
      title: Text(AppLocalizations.of(context)!.about),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: DefaultCardContainer(
              child: Column(
                children: [
                  const DefaultImageBuilder(
                    assetImageFileName: 'img_violao_sobre.png',
                    height: 180,
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.appTitle,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FutureBuilder<PackageInfo>(
                    future: PackageInfo.fromPlatform(),
                    builder: (context, snapshot) {
                      final versionString = snapshot.data?.version ?? '...';
                      final translatedText = AppLocalizations.of(
                        context,
                      )!.version(versionString);

                      return Center(
                        child: Text(
                          translatedText,
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).extension<AppColorsExtension>()!.textSecondary,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.aboutAppText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
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
            onTap: () => launchURL(urlGit),
          ),
          ListTile(
            leading: const Icon(Icons.business_center_outlined),
            title: Text(AppLocalizations.of(context)!.linkedin),
            onTap: () => launchURL(urlLinkedin),
          ),
        ],
      ),
    );
  }
}
