import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'model/settings_repository.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';
import 'view/about_page.dart';
import 'view/home_page.dart';
import 'view/main_shell.dart';
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

  @override
  Widget build(BuildContext context) {
    ThemeViewModel themeViewModel = Provider.of<ThemeViewModel>(context);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeViewModel.themeMode,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,
      home: const MainShell(),
    );
  }
}
