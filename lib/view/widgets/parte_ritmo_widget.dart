import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guitar_learner/widgets/default_divider.dart';
import 'package:provider/provider.dart';

import '../../model/musica/ritmo.dart';
import '../../viewmodel/cadastro_musica_viewmodel.dart';

class ParteRitmoWidget extends StatelessWidget {
  final int partIndex;

  const ParteRitmoWidget({super.key, required this.partIndex});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CadastroMusicaViewModel>();
    final ritmo = viewModel.musicaRascunho.partes[partIndex].ritmo;
    final localizations = AppLocalizations.of(context)!;

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
              onPressed: () => context
                  .read<CadastroMusicaViewModel>()
                  .adicionarBatida(partIndex, Batida.baixo),
            ),
            IconButton.outlined(
              icon: const Icon(Icons.arrow_upward),
              onPressed: () => context
                  .read<CadastroMusicaViewModel>()
                  .adicionarBatida(partIndex, Batida.cima),
            ),
          ],
        ),
        const DefaultDivider(),
        SizedBox(
          width: double.infinity,
          child: ritmo.batidas.isNotEmpty
              ? Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: [
                    for (int i = 0; i < ritmo.batidas.length; i++)
                      _buildDraggableChip(context, viewModel, i),
                  ],
                )
              : Center(
                  child: Text(
                    localizations.nenhumaBatidaAdicionada,
                    style: const TextStyle(
                        fontStyle: FontStyle.italic, fontSize: 13.0),
                  ),
                ),
        )
      ],
    );
  }

  Widget _buildDraggableChip(
      BuildContext context, CadastroMusicaViewModel viewModel, int index) {
    final batida =
        viewModel.musicaRascunho.partes[partIndex].ritmo.batidas[index];

    return DragTarget<int>(
      builder: (context, candidateData, rejectedData) {
        return Draggable<int>(
          data: index,
          feedback: _buildChip(batida, isDragging: true),
          childWhenDragging: _buildChip(batida, isGhost: true),
          child: GestureDetector(
            onTap: () => viewModel.removerBatida(partIndex, index),
            child: _buildChip(batida),
          ),
        );
      },
      onAcceptWithDetails: (DragTargetDetails<int> oldIndex) {
        viewModel.reorganizarBatida(partIndex, oldIndex.data, index);
      },
    );
  }

  Widget _buildChip(Batida batida,
      {bool isDragging = false, bool isGhost = false}) {
    final chip = Opacity(
      opacity: isGhost ? 0.4 : 1.0,
      child: Icon(
        batida == Batida.baixo ? Icons.arrow_downward : Icons.arrow_upward,
        size: 18,
      ),
    );

    if (isDragging) {
      return Material(
        color: Colors.transparent, // Transparente para não ter fundo
        child: chip,
      );
    }

    return chip;
  }
}
