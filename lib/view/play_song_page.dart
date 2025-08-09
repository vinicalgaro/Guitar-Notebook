import 'package:flutter/material.dart';
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
      floatingActionButton:
          musica.linkYoutube != null && musica.linkYoutube!.isNotEmpty
          ? FloatingActionButton(
              onPressed: () => launchURL(musica.linkYoutube!),
              child: const Icon(Icons.link),
            )
          : null,
      actions: [
        IconButton(
          onPressed: () => _openConfigPlayer(context, localizations),
          icon: const Icon(Icons.more_horiz),
        ),
      ],
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            _infoSongLine(context, localizations.song, musica.nome),
            _infoSongLine(
              context,
              localizations.instrumento,
              "musica.instrumento.nameFormatted(context)",
            ),
            _infoSongLine(
              context,
              localizations.afinacao,
              viewModel.afinacao?.nameFormatted(context),
            ),
          ],
        ),
      ),
    );
  }

  _infoSongLine(BuildContext context, String title, String? value) {
    if (value == null) return Container();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Text(
              title,
              maxLines: 1,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(value, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }

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
