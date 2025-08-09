import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
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
      shadow: false,
      showBorder: false,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.queue_music_outlined),
          const SizedBox(width: 8.0),
          Expanded(
            child: RichText(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: musica!.nome,
                    style: const TextStyle(fontWeight: FontWeight.w600),
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
            ),
          ),
        ],
      ),
    );
  }

  _buildNoMusicTile(BuildContext context) => Container(
    margin: const EdgeInsets.only(left: 24.0, top: 8.0),
    child: Text(
      AppLocalizations.of(context)!.semMusicaPraticada,
      style: TextStyle(
        fontSize: 14,
        fontStyle: FontStyle.italic,
        color: Theme.of(context).extension<AppColorsExtension>()!.textSecondary,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
    ),
  );
}
