import 'package:flutter/material.dart';
import 'package:guitar_learner/routes/app_routes.dart';
import 'package:guitar_learner/view/about_page.dart';
import 'package:provider/provider.dart';

import '../../model/musica/musica.dart';
import '../../model/repository/acorde_repository.dart';
import '../../model/repository/musica_repository.dart';
import '../../model/settings_repository.dart';
import '../../viewmodel/cadastro_musica_viewmodel.dart';
import '../cadastro_musica_page.dart';
import '../play_song_page.dart';

class TabNavigatorWidget extends StatelessWidget {
  const TabNavigatorWidget({
    required this.navigatorKey,
    required this.rootPage,
    super.key,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final Widget rootPage;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: AppRoutes.home,
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.home) {
          return MaterialPageRoute(builder: (context) => rootPage);
        }

        Widget? page;
        switch (settings.name) {
          case AppRoutes.editSong:
            page = ChangeNotifierProvider(
              create: (_) => CadastroMusicaViewModel(
                musica: settings.arguments as Musica?,
                repository: context.read<IMusicaRepository>(),
                acordeRepository: context.read<IAcordeRepository>(),
              ),
              child: const CadastroMusicaPage(),
            );
            break;

          case AppRoutes.about:
            page = const AboutPage();
            break;

          case AppRoutes.playSong:
            page = PlaySongPage(musica: settings.arguments as Musica);
            break;
        }

        if (page != null) {
          return MaterialPageRoute(builder: (_) => page!, settings: settings);
        }

        return null;
      },
    );
  }
}
