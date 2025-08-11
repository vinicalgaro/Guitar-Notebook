import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:guitar_notebook/extensions/navigation_extension.dart';
import 'package:guitar_notebook/helpers/helper_bottom_sheet.dart';
import 'package:guitar_notebook/helpers/helper_dialog.dart';
import 'package:guitar_notebook/helpers/helper_toast.dart';
import 'package:guitar_notebook/widgets/default_textbutton.dart';
import 'package:provider/provider.dart';

import '../../model/musica/models.dart';
import '../../routes/app_routes.dart';
import '../../viewmodel/home_viewmodel.dart';
import '../../widgets/default_bottom_sheet_header.dart';
import '../../widgets/default_card_container.dart';

class MusicaListItemWidget extends StatelessWidget {
  final Musica musica;
  final VoidCallback deletarMusica;

  const MusicaListItemWidget({
    super.key,
    required this.musica,
    required this.deletarMusica,
  });

  _displayActions(BuildContext context, AppLocalizations localizations) {
    callBottomSheet(
      context,
      heightPercent: 0.33,
      DefaultBottomSheetHeader(
        label: "'${musica.nome}'",
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.13,
              ),
              children: [
                _buildActionWidget(
                  context,
                  localizations.praticar,
                  () => _playSong(context),
                  isPrimary: true,
                ),
                _buildActionWidget(
                  context,
                  localizations.editar,
                  () => _editSong(context),
                ),
                _buildActionWidget(
                  context,
                  localizations.deletar,
                  () => _deletarDialog(context),
                  specialColor: Theme.of(context).colorScheme.error,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _playSong(BuildContext context) {
    context.read<HomeViewModel>().playSong(context, musica);
  }

  _editSong(BuildContext context) {
    context.goTo(AppRoutes.editSong, arguments: musica);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => _deletarDialog(context),
            backgroundColor: Theme.of(context).colorScheme.error,
            borderRadius: BorderRadius.circular(8.0),
            icon: Icons.delete_outline,
            label: localizations.deletar,
          ),
        ],
      ),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: _editSong,
            backgroundColor: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8.0),
            icon: Icons.edit,
            label: localizations.editar,
          ),
        ],
      ),
      child: DefaultCardContainer(
        margin: EdgeInsets.zero,
        shadow: false,
        child: ListTile(
          leading: const Icon(Icons.music_note_outlined),
          onTap: () => _displayActions(context, localizations),
          title: RichText(
            maxLines: 2,
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: musica.nome,
                  style: const TextStyle(fontWeight: FontWeight.w600),
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
          trailing: IconButton.outlined(
            onPressed: () => _playSong(context),
            icon: const Icon(Icons.play_arrow),
          ),
        ),
      ),
    );
  }

  _deletarDialog(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    displayActionDialog(
      context,
      localizations.atencao,
      localizations.deletarWarning,
      () {
        deletarMusica();
        displayWarningToast(localizations.atencao, localizations.songDeleted);
      },
    );
  }

  Widget _buildActionWidget(
    BuildContext context,
    String label,
    VoidCallback onPressed, {
    Color? specialColor,
    bool isPrimary = false,
  }) => Container(
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
        style: isPrimary ? const TextStyle(fontWeight: FontWeight.bold) : null,
      ),
    ),
  );
}
