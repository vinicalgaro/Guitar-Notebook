import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_guitar_chord/flutter_guitar_chord.dart';
import 'package:guitar_notebook/helpers/helper_size.dart';
import 'package:guitar_notebook/helpers/helper_toast.dart';
import 'package:guitar_notebook/view/widgets/acorde_diagram_widget.dart';
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

class PlaySongPage extends StatelessWidget {
  const PlaySongPage({super.key});

  @override
  Widget build(BuildContext context) {
    PlaySongViewModel viewModel = context.watch<PlaySongViewModel>();
    Musica musica = viewModel.musica;
    final localizations = AppLocalizations.of(context)!;

    return DefaultPageScaffoldScrolless(
      title: Text(musica.nome),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? feedback = await launchURL(musica.linkYoutube!);

          if (feedback != null) {
            displayInfoToast(localizations.linkYoutube, feedback);
          }
        },
        child: const Icon(Icons.link),
      ),
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
                  child: _buildConfigPlayerButton(localizations),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: AcordeDiagramWidget(
                acorde: musica.partes.first.sequencia.compassos.first.acorde,
              ),
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

  Widget _buildConfigPlayerButton(AppLocalizations localizations) =>
      LayoutBuilder(
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
                  onTap: () => _openConfigPlayer(context, localizations),
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
                          localizations.ajustesPlayer,
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

  _openConfigPlayer(BuildContext context, AppLocalizations localizations) {
    callBottomSheet(
      context,
      heightPercent: 0.33,
      DefaultBottomSheetHeader(
        label: localizations.ajustesPlayer,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.13,
            ),
            child: const Column(children: []),
          ),
        ],
      ),
    );
  }
}
