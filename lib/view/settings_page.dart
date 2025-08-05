import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guitar_learner/extensions/locale_extension.dart';
import 'package:guitar_learner/helpers/helper_toast.dart';
import 'package:guitar_learner/widgets/default_header_page.dart';
import 'package:guitar_learner/widgets/default_next_button.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../routes/app_routes.dart';
import '../viewmodel/locale_viewmodel.dart';
import '../viewmodel/theme_viewmodel.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final themeViewModel = Provider.of<ThemeViewModel>(context);
    final localeViewModel = Provider.of<LocaleViewModel>(context);

    return DefaultHeaderPage(
      title: localizations.settings,
      subtitle: localizations.settingsDesc,
      content: [
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
            modalContent: [_buildThemeSwitch(context)]),
        DefaultNextButton(
            title: localizations.linguagem,
            leadingIcon: const Icon(Icons.language_outlined),
            trailing: localeViewModel.locale.toDisplayName(),
            modalContent: [_buildLanguageOptions(context)]),
      ],
    );
  }

  Widget _buildThemeSwitch(BuildContext context) => Consumer<ThemeViewModel>(
        builder: (context, viewModel, child) => SwitchListTile(
          secondary: Icon(
            viewModel.isDarkMode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
          ),
          value: viewModel.isDarkMode,
          onChanged: (isDark) =>
              viewModel.setThemeMode(isDark ? ThemeMode.dark : ThemeMode.light),
          title: Text(AppLocalizations.of(context)!.temaEscuro),
        ),
      );

  Widget _buildLanguageOptions(BuildContext context) {
    List<Locale> locales = [const Locale('pt'), const Locale('en')];

    return Consumer<LocaleViewModel>(
      builder: (context, localeViewModel, child) => Column(
        children: locales
            .map((l) => RadioListTile<Locale>(
                  title: Text(l.toDisplayName()),
                  value: l,
                  groupValue: localeViewModel.locale,
                  onChanged: (Locale? value) =>
                      _setNewLocale(localeViewModel, value),
                ))
            .toList(),
      ),
    );
  }

  _setNewLocale(LocaleViewModel localeViewModel, Locale? value) async {
    if (value != null) {
      localeViewModel.setLocale(value);

      final localizations = await S.delegate.load(value);

      displayInfoToast(
          localizations.sucessoToast, localizations.idiomaAlterado);
    }
  }
}
