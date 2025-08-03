import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ParteSequenciaWidget extends StatelessWidget {
  const ParteSequenciaWidget({Key? key}) : super(key: key);

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
