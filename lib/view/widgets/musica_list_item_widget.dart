import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:guitar_learner/extensions/navigation_extension.dart';
import 'package:guitar_learner/helpers/helper_bottom_sheet.dart';
import 'package:guitar_learner/helpers/helper_dialog.dart';
import 'package:guitar_learner/helpers/helper_toast.dart';
import 'package:guitar_learner/widgets/default_textbutton.dart';

import '../../model/musica/models.dart';
import '../../routes/app_routes.dart';
import '../../widgets/default_bottom_sheet_header.dart';
import '../../widgets/default_card_container.dart';

class MusicaListItemWidget extends StatelessWidget {
  final Musica musica;
  final VoidCallback deletarMusica;

  const MusicaListItemWidget(
      {super.key, required this.musica, required this.deletarMusica});

  _displayActions(BuildContext context) {
    callBottomSheet(
      context,
      heightPercent: 0.33,
      DefaultBottomSheetHeader(
        label: "'${musica.nome}'",
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                _buildActionWidget(
                    context, "Praticar", () => _playSong(context),
                    isPrimary: true),
                _buildActionWidget(context, "Editar", () => _editSong(context)),
                _buildActionWidget(
                    context, "Deletar", () => _deletarDialog(context),
                    specialColor: Theme.of(context).colorScheme.error),
              ],
            ),
          )
        ],
      ),
    );
  }

  _playSong(BuildContext context) {
    context.goTo(AppRoutes.playSong, arguments: musica);
  }

  _editSong(BuildContext context) {
    context.goTo(AppRoutes.editSong, arguments: musica);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Slidable(
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: (context) => _deletarDialog(context),
            backgroundColor: Theme.of(context).colorScheme.error,
            borderRadius: BorderRadius.circular(8.0),
            icon: Icons.delete_outline,
            label: localizations.deletar,
          )
        ]),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: _editSong,
              backgroundColor: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(8.0),
              icon: Icons.edit,
              label: localizations.editar,
            )
          ],
        ),
        child: DefaultCardContainer(
            margin: EdgeInsets.zero,
            shadow: false,
            child: ListTile(
              leading: const Icon(Icons.music_note_outlined),
              onTap: () => _displayActions(context),
              title: RichText(
                maxLines: 2,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: musica.nome,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: ' /${musica.instrumento.nameFormatted(context)}',
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
                  scale: 1.5,
                  child: IconButton(
                    onPressed: () => _playSong(context),
                    icon: const Icon(Icons.play_arrow),
                  )),
            )));
  }

  _deletarDialog(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    displayActionDialog(
        context, localizations.atencao, localizations.deletarWarning, () {
      deletarMusica();
      displayWarningToast(localizations.atencao, localizations.songDeleted);
    });
  }

  _buildActionWidget(BuildContext context, String label, VoidCallback onPressed,
          {Color? specialColor, bool isPrimary = false}) =>
      Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        child: DefaultTextButton(
            showBorder: true,
            expandText: true,
            onPressed: () {
              context.goBack();
              onPressed();
            },
            specialColor: specialColor,
            child: Text(
              label,
              style: isPrimary
                  ? const TextStyle(fontWeight: FontWeight.bold)
                  : null,
            )),
      );
}
