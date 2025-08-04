import 'package:flutter/material.dart';
import 'package:guitar_learner/routes/app_routes.dart';
import 'package:provider/provider.dart';

import '../../model/musica/musica.dart';
import '../../viewmodel/cadastro_musica_viewmodel.dart';
import '../about_page.dart';
import '../cadastro_musica_page.dart';
import '../home_page.dart';

class TabNavigatorWidget extends StatelessWidget {
  const TabNavigatorWidget({
    required this.navigatorKey,
    required this.initialRoute,
    super.key,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: initialRoute,
      onGenerateRoute: (settings) {
        Widget page;

        switch (settings.name) {
          case AppRoutes.addSong:
          case AppRoutes.editSong:
            page = ChangeNotifierProvider(
              create: (_) => CadastroMusicaViewModel(
                  musica: settings.arguments as Musica?),
              child: const CadastroMusicaPage(),
            );
            break;
          default:
            page = const HomePage();
        }

        return MaterialPageRoute(builder: (_) => page, settings: settings);
      },
    );
  }
}
