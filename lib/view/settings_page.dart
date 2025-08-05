import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guitar_learner/widgets/default_header.dart';
import 'package:guitar_learner/widgets/default_next_button.dart';
import 'package:provider/provider.dart';

import '../routes/app_routes.dart';
import '../viewmodel/theme_viewmodel.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final themeViewModel = Provider.of<ThemeViewModel>(context);

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
                  leadingIcon: Icon(themeViewModel.isDarkMode
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  modalContent: [_buildThemeSwitch(context, themeViewModel)]),
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

  Widget _buildThemeSwitch(
          BuildContext context, ThemeViewModel themeViewModel) =>
      Consumer<ThemeViewModel>(
        builder: (context, viewModel, child) {
          return SwitchListTile(
            secondary: Icon(
              viewModel.isDarkMode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
            ),
            value: viewModel.isDarkMode,
            onChanged: (isDark) => viewModel
                .setThemeMode(isDark ? ThemeMode.dark : ThemeMode.light),
            title: Text(AppLocalizations.of(context)!.temaEscuro),
          );
        },
      );
}
