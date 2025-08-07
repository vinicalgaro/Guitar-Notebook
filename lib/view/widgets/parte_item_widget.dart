import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import 'package:guitar_learner/view/widgets/parte_ritmo_widget.dart';
import 'package:guitar_learner/view/widgets/parte_sequencia_widget.dart';
import 'package:guitar_learner/widgets/default_card_container.dart';

import '../../model/musica/parte.dart';
import '../../widgets/default_textformfield.dart';

class ParteItemWidget extends StatelessWidget {
  final TextEditingController partNameController;
  final int index;
  final VoidCallback onDelete;
  final Parte parte;

  ParteItemWidget(
      {super.key,
      required this.partNameController,
      required this.index,
      required this.onDelete,
      required this.parte}) {
    interfaceIndex = index + 1;
  }

  late final int interfaceIndex;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return DefaultCardContainer(
      shadow: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${localizations.part} $interfaceIndex"),
                if (index > 0)
                  IconButton(
                      onPressed: onDelete, icon: const Icon(Icons.delete))
              ],
            ),
            DefaultTextFormField(
                label: localizations.partName,
                hintText: localizations.hintSongPart,
                maxLength: 30,
                required: true,
                controller: partNameController),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ParteRitmoWidget(partIndex: index, parte: parte),
                ),
                const SizedBox(width: 4.0),
                Expanded(
                  child: ParteSequenciaWidget(partIndex: index, parte: parte),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
