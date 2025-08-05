import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guitar_learner/widgets/default_header.dart';
import 'package:guitar_learner/widgets/default_next_button.dart';

import '../routes/app_routes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultHeader(
            title: localizations.settings,
            subtitle: localizations.settingsDesc),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(localizations.content),
              const SizedBox(height: 8.0),
              DefaultNextButton(
                  title: localizations.about,
                  leadingIcon: const Icon(Icons.info_outline),
                  route: AppRoutes.about),
              const SizedBox(height: 8.0),
              Text(localizations.preferences),
              const SizedBox(height: 8.0),
              DefaultNextButton(
                  title: localizations.tema,
                  leadingIcon: const Icon(Icons.dark_mode_outlined),
                  modalContent: []),
              DefaultNextButton(
                  title: localizations.linguagem,
                  leadingIcon: const Icon(Icons.language_outlined),
                  modalContent: []),
            ],
          ),
        ),
      ],
    );
  }
}
