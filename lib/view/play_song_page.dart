import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:guitar_notebook/helpers/helper_toast.dart';
import 'package:guitar_notebook/view/widgets/card_musica_widget.dart';
import 'package:guitar_notebook/view/widgets/slider_autoplayer_widget.dart';
import 'package:guitar_notebook/widgets/default_card_container.dart';
import 'package:guitar_notebook/widgets/default_header_page.dart';
import 'package:guitar_notebook/widgets/default_image_builder.dart';
import 'package:provider/provider.dart';

import '../helpers/helper_bottom_sheet.dart';
import '../helpers/helper_launcher.dart';
import '../l10n/app_localizations.dart';
import '../model/musica/models.dart';
import '../viewmodel/play_song_viewmodel.dart';
import '../widgets/default_bottom_sheet_header.dart';
import '../widgets/default_page_scaffold_scrolless.dart';

class PlaySongPage extends StatefulWidget {
  const PlaySongPage({super.key});

  @override
  State<PlaySongPage> createState() => _PlaySongPageState();
}

class _PlaySongPageState extends State<PlaySongPage> {
  late final CardSwiperController _cardController;
  Timer? _autoplayTimer;

  void _startAutoPlayWatchDog() {
    _cancelWatchDog();

    final viewModel = context.read<PlaySongViewModel>();
    final segundos = viewModel.autoPlaySeconds;

    if (segundos > 0) {
      _autoplayTimer = Timer.periodic(Duration(seconds: segundos.round()), (_) {
        _cardController.swipe(CardSwiperDirection.bottom);
      });
    }
  }

  void _cancelWatchDog() {
    _autoplayTimer?.cancel();
    _autoplayTimer = null;
  }

  @override
  void initState() {
    super.initState();
    _cardController = CardSwiperController();
  }

  @override
  void dispose() {
    _cardController.dispose();
    _cancelWatchDog();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PlaySongViewModel viewModel = context.watch<PlaySongViewModel>();
    Musica musica = viewModel.musica;
    final List<Parte> partes = musica.partes;
    final localizations = AppLocalizations.of(context)!;

    return DefaultPageScaffoldScrolless(
      title: Text(musica.nome),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: DefaultHeaderPage(
                    title: musica.nome,
                    subtitle: _buildSubtitle(
                      context,
                      musica,
                      viewModel.afinacao,
                      localizations,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: _buildConfigPlayerButton(
                    localizations,
                    musica,
                    viewModel,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 7,
            child: CardSwiper(
              controller: _cardController,
              cardsCount: partes.length,
              numberOfCardsDisplayed: 2,
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 25),
              cardBuilder:
                  (
                    context,
                    index,
                    horizontalThresholdPercentage,
                    verticalThresholdPercentage,
                  ) => CardMusicaWidget(parte: partes[index]),
            ),
          ),
        ],
      ),
    );
  }

  String _buildSubtitle(
    BuildContext context,
    Musica musica,
    Afinacao? afinacao,
    AppLocalizations localizations,
  ) =>
      "${musica.instrumento.nameFormatted(context)} / ${localizations.afinacao}: ${afinacao?.nameFormatted(context) ?? ""}";

  Widget _buildConfigPlayerButton(
    AppLocalizations localizations,
    Musica musica,
    PlaySongViewModel viewModel,
  ) => LayoutBuilder(
    builder: (context, constraints) {
      const double maxCardWidth = 210.0;
      final double cardWidth = min(constraints.maxWidth, maxCardWidth);
      return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: cardWidth,
          child: Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () =>
                  _openConfigPlayer(context, localizations, musica, viewModel),
              borderRadius: BorderRadius.circular(16.0),
              child: DefaultCardContainer(
                showBorder: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Flexible(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: DefaultImageBuilder(
                            assetImageFileName: 'img_info_song.png',
                          ),
                        ),
                      ),
                    ),
                    Text(
                      localizations.options,
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );

  _openConfigPlayer(
    BuildContext context,
    AppLocalizations localizations,
    Musica musica,
    PlaySongViewModel viewModel,
  ) {
    callBottomSheet(
      context,
      heightPercent: 0.33,
      DefaultBottomSheetHeader(
        label: localizations.options,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
            ),
            child: _buildPlayerOptions(
              context,
              localizations,
              musica,
              viewModel,
            ),
          ),
        ],
      ),
    );
  }

  _buildPlayerOptions(
    BuildContext context,
    AppLocalizations localizations,
    Musica musica,
    PlaySongViewModel viewModel,
  ) => Column(
    children: [
      ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () async => _launchLink(context, musica, localizations),
        title: Text(localizations.linkYoutube),
        trailing: Transform.scale(
          scale: 1.3,
          child: IconButton(
            onPressed: () async => _launchLink(context, musica, localizations),
            icon: const Icon(Icons.link),
          ),
        ),
      ),
      const SizedBox(height: 12.0),
      SliderAutoplayerWidget(
        viewModel: viewModel,
        onChanged: _startAutoPlayWatchDog,
      ),
    ],
  );

  void _launchLink(
    BuildContext context,
    Musica musica,
    AppLocalizations localizations,
  ) async {
    bool launched = await launchURL(musica.linkYoutube);

    if (!launched) {
      displayInfoToast(localizations.linkYoutube, localizations.nenhumLink);
    } else if (context.mounted) {
      Navigator.pop(context);
    }
  }
}
