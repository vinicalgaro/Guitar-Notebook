import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guitar_learner/extensions/navigation_extension.dart';
import 'package:guitar_learner/routes/app_routes.dart';
import 'package:provider/provider.dart';

import '../theme/app_colors_extension.dart';
import '../viewmodel/theme_viewmodel.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  Widget _buildHeader(BuildContext context) => DrawerHeader(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '🎸 ${AppLocalizations.of(context)!.appTitle}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.appLema,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
              ),
            ),
          ],
        ),
      );

  Widget _buildThemeSwitch(
          BuildContext context, ThemeViewModel themeViewModel) =>
      Consumer<ThemeViewModel>(
        builder: (context, value, child) => SwitchListTile(
          secondary: Icon(
            themeViewModel.themeMode == ThemeMode.dark
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
          ),
          value: themeViewModel.themeMode == ThemeMode.dark,
          onChanged: (isDark) {
            final viewModel = context.read<ThemeViewModel>();
            viewModel.setThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
          },
          title: Text(AppLocalizations.of(context)!.modoEscuro),
        ),
      );

  Widget _buildPageButton(
          BuildContext context, IconData icon, String text, Function() onTap) =>
      ListTile(
        leading: Icon(icon),
        title: Text(text),
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.read<ThemeViewModel>();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeader(context),
          _buildThemeSwitch(context, themeViewModel),
          const Divider(),
          _buildPageButton(
              context,
              Icons.info,
              AppLocalizations.of(context)!.about,
              () => context.goTo(AppRoutes.about)),
        ],
      ),
    );
  }
}
