import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import 'package:guitar_notebook/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../model/musica/models.dart';
import '../../theme/app_colors_extension.dart';
import '../../widgets/default_card_container.dart';

class MusicaLastWidget extends StatelessWidget {
  final Musica? musica;

  const MusicaLastWidget({super.key, this.musica});

  @override
  Widget build(BuildContext context) {
    return musica != null
        ? _buildMusicaTile(context)
        : _buildNoMusicTile(context);
  }

  _buildMusicaTile(BuildContext context) {
    return DefaultCardContainer(
        margin: EdgeInsets.zero,
        shadow: false,
        showBorder: false,
        child: ListTile(
          leading: const Icon(Icons.queue_music_outlined),
          title: RichText(
            maxLines: 2,
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: musica!.nome,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' /${musica!.instrumento.nameFormatted(context)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Transform.scale(
              scale: 1.25,
              child: IconButton.outlined(
                onPressed: () =>
                    context.read<HomeViewModel>().playSong(context, musica!),
                icon: const Icon(Icons.play_arrow),
              )),
        ));
  }

  _buildNoMusicTile(BuildContext context) {
    return ListTile(
      title: Text(
        AppLocalizations.of(context)!.semMusicaPraticada,
        style: TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
            color: Theme.of(context)
                .extension<AppColorsExtension>()!
                .textSecondary),
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
      ),
    );
  }
}
