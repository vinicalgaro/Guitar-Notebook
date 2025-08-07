import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
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
                  onPressed: () => _adicionarBatida(
                      viewModel, Batida.baixo, field, localizations),
                ),
                IconButton.outlined(
                  icon: const Icon(Icons.arrow_upward),
                  onPressed: () => _adicionarBatida(
                      viewModel, Batida.cima, field, localizations),
                ),
              ],
            ),
            const DefaultDivider(),
            SizedBox(
              width: double.infinity,
              child: batidasAtuais.isNotEmpty
                  ? Wrap(
                      alignment: WrapAlignment.center,
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
      FormFieldState<List<Batida>> field, AppLocalizations localizations) {
    if (viewModel.podeAdicionarRitmo(partIndex)) {
      viewModel.adicionarBatida(partIndex, batida);
      _notifyChangeToForm(viewModel, field);
    } else {
      displayInfoToast(
          localizations.atencao, localizations.limiteDeBatidasAtingido);
    }
  }

  void _removerBatida(CadastroMusicaViewModel viewModel, int index,
      FormFieldState<List<Batida>> field) {
    viewModel.removerBatida(partIndex, index);
    _notifyChangeToForm(viewModel, field);
  }

  void _clearBatidas(
      CadastroMusicaViewModel viewModel, FormFieldState<List<Batida>> field) {
    viewModel.clearBatidas(partIndex);
    _notifyChangeToForm(viewModel, field);
  }

  void _reorganizarBatida(CadastroMusicaViewModel viewModel, int oldIndex,
      int newIndex, FormFieldState<List<Batida>> field) {
    viewModel.reorganizarBatidas(partIndex, oldIndex, newIndex);
    _notifyChangeToForm(viewModel, field);
  }

  void _notifyChangeToForm(CadastroMusicaViewModel viewModel,
          FormFieldState<List<Batida>> field) =>
      field.didChange(viewModel.musicaRascunho.partes[partIndex].ritmo.batidas);

  Widget _buildDraggableIcon(CadastroMusicaViewModel viewModel, int index,
          Batida batida, FormFieldState<List<Batida>> field) =>
      DefaultDraggableWidget(
          index: index,
          itemBuilder: () => GestureDetector(
                onLongPress: () => _clearBatidas(viewModel, field),
                child: IconButton(
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
              ),
          onAcceptWithDetails: (DragTargetDetails<int> oldIndex) =>
              _reorganizarBatida(viewModel, oldIndex.data, index, field));
}
