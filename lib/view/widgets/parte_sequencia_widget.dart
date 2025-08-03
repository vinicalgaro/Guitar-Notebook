import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../model/musica/models.dart';

class ParteSequenciaWidget extends StatelessWidget {
  final int partIndex;
  final Parte parte;

  const ParteSequenciaWidget(
      {super.key, required this.partIndex, required this.parte});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.sequencia,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
      ],
    );
  }
}
