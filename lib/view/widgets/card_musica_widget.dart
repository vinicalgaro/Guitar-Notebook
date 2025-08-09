import 'package:flutter/material.dart';
import 'package:guitar_notebook/model/musica/models.dart';
import 'package:guitar_notebook/widgets/default_divider.dart';

import '../../l10n/app_localizations.dart';
import '../../widgets/default_card_container.dart';
import 'diagramas_horizontal_scroll_view.dart';

class CardMusicaWidget extends StatelessWidget {
  final Parte parte;

  const CardMusicaWidget({super.key, required this.parte});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return DefaultCardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.music_note),
                    const SizedBox(width: 8),
                    Text(
                      parte.nome,
                      style: Theme.of(context).textTheme.headlineSmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(localizations.ritmo),
                          const SizedBox(height: 8.0),
                          _buildRitmoList(),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(localizations.sequencia),
                          const SizedBox(height: 8.0),
                          _buildSequenciaList(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const DefaultDivider(),
          const SizedBox(height: 12.0),
          Flexible(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(localizations.diagramas),
                Expanded(child: Center(child: _buildDiagramas())),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRitmoList() {
    List<Batida> batidas = parte.ritmo.batidas;
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: [
        for (int i = 0; i < batidas.length; i++)
          Icon(
            batidas[i] == Batida.baixo
                ? Icons.arrow_downward
                : Icons.arrow_upward,
          ),
      ],
    );
  }

  Widget _buildSequenciaList(BuildContext context) {
    List<Compasso> sequencias = parte.sequencia.compassos;
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: [
        for (int i = 0; i < sequencias.length; i++)
          Text(
            sequencias[i].toString(),
            style: TextStyle(
              fontSize: 15,
              backgroundColor: Theme.of(context).inputDecorationTheme.fillColor,
            ),
          ),
      ],
    );
  }

  Widget _buildDiagramas() {
    Set<Acorde> acordes = parte.sequencia.compassos
        .map((compasso) => compasso.acorde)
        .toSet();
    return DiagramasHorizontalScrollView(acordes: acordes);
  }
}
