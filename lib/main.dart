import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../l10n/app_localizations.dart';
import 'package:guitar_notebook/data/repository/acorde_repository_impl.dart';
import 'package:provider/provider.dart';

import 'data/database.dart';
import 'data/repository/musica_repository_impl.dart';
import 'model/repository/acorde_repository.dart';
import 'model/repository/musica_repository.dart';
import 'model/settings_repository.dart';
import 'theme/app_theme.dart';
import 'view/main_shell.dart';
import 'viewmodel/locale_viewmodel.dart';
import 'viewmodel/theme_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final settingsRepository = await SettingsRepository.init();
  final appDatabase = AppDatabase();

  runApp(
    MultiProvider(
      providers: [
        Provider<AppDatabase>.value(value: appDatabase),
        ProxyProvider<AppDatabase, AcordesDao>(
          update: (_, db, __) => AcordesDao(db),
        ),
        ProxyProvider<AppDatabase, MusicasDao>(
          update: (_, db, __) => MusicasDao(db),
        ),
        ProxyProvider<AppDatabase, AcordesDao>(
          update: (_, db, __) => AcordesDao(db),
        ),
        ProxyProvider<MusicasDao, IMusicaRepository>(
          update: (_, dao, __) => MusicaRepositoryImpl(dao),
        ),
        ProxyProvider<AcordesDao, IAcordeRepository>(
          update: (_, dao, __) => AcordeRepositoryImpl(dao),
        ),
        Provider<SettingsRepository>.value(
          value: settingsRepository,
        ),
        ChangeNotifierProvider<ThemeViewModel>(
          create: (context) => ThemeViewModel(
            context.read<SettingsRepository>(),
          ),
        ),
        ChangeNotifierProvider<LocaleViewModel>(
          create: (context) => LocaleViewModel(
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
    LocaleViewModel localeViewModel = Provider.of<LocaleViewModel>(context);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeViewModel.themeMode,
      locale: localeViewModel.locale,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,
      home: const MainShell(),
    );
  }
}
