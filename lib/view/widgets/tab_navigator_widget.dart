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

  MaterialPageRoute _getPage(Widget page) =>
      MaterialPageRoute(builder: (_) => page);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: initialRoute,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.about:
            return _getPage(const AboutPage());
          case AppRoutes.editSong:
            return _getPage(ChangeNotifierProvider(
              create: (_) => CadastroMusicaViewModel(
                  musica: settings.arguments as Musica?),
              child: const CadastroMusicaPage(),
            ));
          case AppRoutes.addSong:
            return _getPage(
              ChangeNotifierProvider(
                create: (_) => CadastroMusicaViewModel(),
                child: const CadastroMusicaPage(),
              ),
            );
          default:
            return _getPage(const HomePage());
        }
      },
    );
  }
}
