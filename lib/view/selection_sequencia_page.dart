import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guitar_learner/extensions/navigation_extension.dart';
import 'package:guitar_learner/widgets/default_card_container.dart';
import 'package:provider/provider.dart';

import '../model/musica/models.dart';
import '../viewmodel/selection_sequencia_viewmodel.dart';
import '../widgets/default_divider.dart';
import '../widgets/default_textbutton.dart';

class SelectionSequenciaPage extends StatefulWidget {
  final Function(Sequencia sequencia) onSelectionCallback;

  const SelectionSequenciaPage({
    super.key,
    required this.onSelectionCallback,
  });

  @override
  State<SelectionSequenciaPage> createState() => _SelectionSequenciaPageState();
}

class _SelectionSequenciaPageState extends State<SelectionSequenciaPage> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final viewModel = context.watch<SelectionSequenciaViewModel>();
    List<TipoAcorde> tiposTabs = viewModel.getTiposDisponiveis();

    return DefaultTabController(
      length: tiposTabs.length,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(localizations.sequencia,
                    style: Theme.of(context).textTheme.headlineSmall),
                Row(
                  children: [
                    IconButton(
                        onPressed: context.goBack,
                        icon: const Icon(Icons.close)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 8),
            DefaultCardContainer(
              child: viewModel.sequenciaAtual.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(6.0),
                      child: Text(localizations.nenhumaSequenciaAdicionada,
                          style: const TextStyle(fontStyle: FontStyle.italic)))
                  : Wrap(
                      spacing: 4.0,
                      runSpacing: 4.0,
                      alignment: WrapAlignment.center,
                      children: [
                        for (int i = 0;
                            i < viewModel.sequenciaAtual.length;
                            i++)
                          _buildAcorde(
                              viewModel, viewModel.sequenciaAtual[i], i)
                      ],
                    ),
            ),
            const DefaultDivider(height: 15),
            TabBar(
              tabs: tiposTabs
                  .map((e) => Tab(
                        text: e.nome,
                        height: 30,
                      ))
                  .toList(),
            ),
            Expanded(
              child: TabBarView(
                children: tiposTabs
                    .map((e) => _buildAcordeList(viewModel.getAcordesByTipo(e)))
                    .toList(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final sequenciaFinal = Sequencia(viewModel.sequenciaAtual);
                widget.onSelectionCallback(sequenciaFinal);
                context.goBack();
              },
              child: Text(localizations.salvar),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAcorde(
      SelectionSequenciaViewModel viewModel, Compasso c, int index) {
    return GestureDetector(
      onLongPress: () => viewModel.limparSequencia(),
      child: Container(
        margin: const EdgeInsets.only(right: 4.0),
        child: DefaultTextButton(
          hasBackgroundColor: true,
          padding: 2.0,
          onPressed: () => viewModel.removerCompasso(index),
          child: Text(c.toString()),
        ),
      ),
    );
  }

  Widget _buildAcordeList(List<Acorde> acordes) {
    final viewModel = context.read<SelectionSequenciaViewModel>();

    if (acordes.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      height: 100,
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 6.0,
          runSpacing: 6.0,
          children: [
            for (int i = 0; i < acordes.length; i++)
              DefaultTextButton(
                shrink: true,
                hasBackgroundColor: true,
                showBorder: true,
                onPressed: () {
                  viewModel.adicionarAcordeNaSequencia(acordes[i]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(acordes[i].nome,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        acordes[i].fullName,
                        style: const TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
