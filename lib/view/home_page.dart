import 'package:flutter/material.dart';
import 'package:guitar_notebook/extensions/navigation_extension.dart';
import 'package:guitar_notebook/model/repository/musica_repository.dart';
import 'package:guitar_notebook/routes/app_routes.dart';
import 'package:guitar_notebook/view/widgets/lista_musicas_widget.dart';
import 'package:guitar_notebook/view/widgets/musica_last_widget.dart';
import 'package:guitar_notebook/viewmodel/home_viewmodel.dart';
import 'package:guitar_notebook/widgets/default_card_container.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../model/musica/models.dart' show Musica;
import '../model/settings_repository.dart';
import '../widgets/default_header_page.dart';
import '../widgets/default_raw_page_with_margin.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _addMusic(BuildContext context) {
    context.goTo(AppRoutes.editSong);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(
        repository: context.read<IMusicaRepository>(),
        settingsRepository: context.read<SettingsRepository>(),
      ),
      child: DefaultRawPageWithMargin(
        child: Scaffold(
          body: Column(
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultCardContainer(
                    child: Column(
                      children: [
                        DefaultHeaderPage(
                          title: localizations.progresso,
                          subtitle: localizations.progressoDesc,
                          margin: const EdgeInsets.only(top: 6.0, left: 8.0),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Consumer<HomeViewModel>(
                              builder: (context, viewModel, child) =>
                                  StreamBuilder<Musica?>(
                                    stream: viewModel.ultimaMusicaStream,
                                    builder: (context, snapshot) =>
                                        MusicaLastWidget(musica: snapshot.data),
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
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
      ),
    );
  }
}
