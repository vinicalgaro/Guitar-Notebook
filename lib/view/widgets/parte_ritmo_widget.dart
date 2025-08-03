import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guitar_learner/helpers/helper_toast.dart';
import 'package:guitar_learner/widgets/default_divider.dart';
import 'package:guitar_learner/widgets/default_draggable_widget.dart';
import 'package:provider/provider.dart';

import '../../model/musica/models.dart';
import '../../viewmodel/cadastro_musica_viewmodel.dart';

class ParteRitmoWidget extends StatelessWidget {
  final int partIndex;
  final Parte parte;

  const ParteRitmoWidget(
      {super.key, required this.partIndex, required this.parte});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CadastroMusicaViewModel>();
    final localizations = AppLocalizations.of(context)!;

    return FormField<List<Batida>>(
      initialValue: parte.ritmo.batidas,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return localizations.nenhumaBatidaAdicionada;
        }
        return null;
      },
      builder: (FormFieldState<List<Batida>> field) {
        final batidasAtuais = field.value ?? [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(localizations.ritmo,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton.outlined(
                  icon: const Icon(Icons.arrow_downward),
                  onPressed: () =>
                      _adicionarBatida(viewModel, Batida.baixo, field),
                ),
                IconButton.outlined(
                  icon: const Icon(Icons.arrow_upward),
                  onPressed: () =>
                      _adicionarBatida(viewModel, Batida.cima, field),
                ),
              ],
            ),
            const DefaultDivider(),
            SizedBox(
              width: double.infinity,
              child: batidasAtuais.isNotEmpty
                  ? Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: [
                        for (int i = 0; i < batidasAtuais.length; i++)
                          _buildDraggableIcon(
                              viewModel, i, batidasAtuais[i], field)
                      ],
                    )
                  : Center(
                      child: Text(localizations.nenhumaBatidaAdicionada,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 12.0,
                              color: field.hasError
                                  ? Theme.of(context).colorScheme.error
                                  : null)),
                    ),
            )
          ],
        );
      },
    );
  }

  void _adicionarBatida(CadastroMusicaViewModel viewModel, Batida batida,
      FormFieldState<List<Batida>> field) {
    if (viewModel.podeAdicionarRitmo(partIndex)) {
      viewModel.adicionarBatida(partIndex, batida);
      _notifyChange(viewModel, field);
    } else {
      displayInfoToast("Atenção!", "Limite de batidas atingido.");
    }
  }

  void _removerBatida(CadastroMusicaViewModel viewModel, int index,
      FormFieldState<List<Batida>> field) {
    viewModel.removerBatida(partIndex, index);
    _notifyChange(viewModel, field);
  }

  void _reorganizarBatida(CadastroMusicaViewModel viewModel, int oldIndex,
      int newIndex, FormFieldState<List<Batida>> field) {
    viewModel.reorganizarBatida(partIndex, oldIndex, newIndex);
    _notifyChange(viewModel, field);
  }

  void _notifyChange(
      CadastroMusicaViewModel viewModel, FormFieldState<List<Batida>> field) {
    field.didChange(viewModel.musicaRascunho.partes[partIndex].ritmo.batidas);
  }

  Widget _buildDraggableIcon(CadastroMusicaViewModel viewModel, int index,
      Batida batida, FormFieldState<List<Batida>> field) {
    return DefaultDraggableWidget(
        index: index,
        itemBuilder: () => IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                  minWidth: kMinInteractiveDimension / 2,
                  maxHeight: kMinInteractiveDimension / 2),
              icon: Icon(
                batida == Batida.baixo
                    ? Icons.arrow_downward
                    : Icons.arrow_upward,
              ),
              onPressed: () => _removerBatida(viewModel, index, field),
            ),
        onAcceptWithDetails: (DragTargetDetails<int> oldIndex) =>
            _reorganizarBatida(viewModel, oldIndex.data, index, field));
  }
}
