import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guitar_learner/extensions/navigation_extension.dart';
import 'package:guitar_learner/model/repository/musica_repository.dart';
import 'package:guitar_learner/routes/app_routes.dart';
import 'package:guitar_learner/view/widgets/lista_musicas_widget.dart';
import 'package:guitar_learner/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

import '../model/settings_repository.dart';
import '../widgets/default_header_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _addMusic(BuildContext context) {
    context.goTo(AppRoutes.addSong);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(
          repository: context.read<IMusicaRepository>(),
          settingsRepository: context.read<SettingsRepository>()),
      child: Scaffold(
        body: Column(
          children: [
            Flexible(
              flex: 5,
              child: Placeholder(),
            ),
            Flexible(
              flex: 8,
              child: Column(
                children: [
                  DefaultHeaderPage(
                    title: localizations.mySongs,
                    subtitle: localizations.mySongsDesc,
                  ),
                  Consumer<HomeViewModel>(
                    builder: (context, viewModel, child) =>
                        ListaMusicasWidget(viewModel: viewModel),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addMusic(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
