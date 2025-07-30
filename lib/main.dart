import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guitar_learner/view/about_page.dart';
import 'package:guitar_learner/view/cadastro_musica.dart';
import 'package:guitar_learner/view/home_page.dart';
import 'package:provider/provider.dart';

import 'model/settings_repository.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';
import 'viewmodel/theme_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settingsRepository = await SettingsRepository.init();

  runApp(
    MultiProvider(
      providers: [
        Provider<SettingsRepository>.value(
          value: settingsRepository,
        ),
        ChangeNotifierProvider<ThemeViewModel>(
          create: (context) => ThemeViewModel(
            context.read<SettingsRepository>(),
          ),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  MaterialPageRoute _getRoute(Widget page) =>
      MaterialPageRoute(builder: (_) => page);

  @override
  Widget build(BuildContext context) {
    ThemeViewModel themeViewModel = Provider.of<ThemeViewModel>(context);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeViewModel.themeMode,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.about:
            return _getRoute(const AboutPage());
          case AppRoutes.editSong:
            return _getRoute(const CadastroMusica(musica: null));
          case AppRoutes.addSong:
            return _getRoute(const CadastroMusica());
          default:
            return _getRoute(const HomePage());
        }
      },
      home: const HomePage(),
    );
  }
}
