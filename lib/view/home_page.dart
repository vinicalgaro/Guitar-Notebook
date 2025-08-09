import 'package:flutter/material.dart';
import 'package:guitar_notebook/extensions/navigation_extension.dart';
import 'package:guitar_notebook/model/repository/musica_repository.dart';
import 'package:guitar_notebook/routes/app_routes.dart';
import 'package:guitar_notebook/view/widgets/lista_musicas_widget.dart';
import 'package:guitar_notebook/view/widgets/musica_last_widget.dart';
import 'package:guitar_notebook/viewmodel/home_viewmodel.dart';
import 'package:guitar_notebook/widgets/default_card_container.dart';
import 'package:guitar_notebook/widgets/default_image_builder.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../model/musica/models.dart' show Musica;
import '../model/settings_repository.dart';
import '../widgets/default_header_page.dart';
import '../widgets/default_raw_page_with_margin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _addMusic(BuildContext context) => context.goTo(AppRoutes.editSong);

  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel(
      repository: context.read<IMusicaRepository>(),
      settingsRepository: context.read<SettingsRepository>(),
    )..init();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return viewModel.shouldShowWizard
              ? buildIntroductionScreen(context, viewModel)
              : buildMainContent(context, localizations);
        },
      ),
    );
  }

  Widget buildIntroductionScreen(
    BuildContext context,
    HomeViewModel viewModel,
  ) {
    final localizations = AppLocalizations.of(context)!;
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: localizations.appTitle,
          body: localizations.welcomeMessage,
          image: const DefaultImageBuilder(
            assetImageFileName: "img_violao_notas.png",
            height: 250,
          ),
        ),
      ],
      showSkipButton: false,
      showNextButton: false,
      done: Text(
        localizations.letsgo,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      onDone: () => viewModel.wizardCompleted(),
      dotsDecorator: DotsDecorator(
        activeColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget buildMainContent(
    BuildContext context,
    AppLocalizations localizations,
  ) => DefaultRawPageWithMargin(
    child: Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultCardContainer(
                padding: EdgeInsets.zero,
                child: Row(
                  children: [
                    Flexible(
                      flex: 6,
                      child: Column(
                        children: [
                          DefaultHeaderPage(
                            title: localizations.progresso,
                            subtitle: localizations.progressoDesc,
                            margin: const EdgeInsets.only(top: 6.0, left: 16.0),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Consumer<HomeViewModel>(
                                builder: (context, viewModel, child) =>
                                    StreamBuilder<Musica?>(
                                      stream: viewModel.ultimaMusicaStream,
                                      builder: (context, snapshot) =>
                                          MusicaLastWidget(
                                            musica: snapshot.data,
                                          ),
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Consumer<HomeViewModel>(
                          builder: (context, viewModel, child) {
                            return StreamBuilder<Musica?>(
                              stream: viewModel.ultimaMusicaStream,
                              builder: (context, snapshot) {
                                return IconButton(
                                  onPressed: snapshot.data == null
                                      ? null
                                      : () => viewModel.playSong(
                                          context,
                                          snapshot.data!,
                                        ),
                                  icon: const DefaultImageBuilder(
                                    assetImageFileName: 'img_play_home.png',
                                  ),
                                );
                              },
                            );
                          },
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
      floatingActionButton: Transform.scale(
        scale: 1.15,
        child: FloatingActionButton(
          onPressed: () => _addMusic(context),
          child: const Icon(Icons.add),
        ),
      ),
    ),
  );
}
