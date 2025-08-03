import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/cadastro_musica_viewmodel.dart';

class ParteRitmoWidget extends StatelessWidget {
  const ParteRitmoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CadastroMusicaViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.ritmo,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
      ],
    );
  }
}
