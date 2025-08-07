import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import 'package:guitar_learner/model/repository/acorde_repository.dart';
import 'package:guitar_learner/view/selection_sequencia_page.dart';
import 'package:guitar_learner/widgets/default_divider.dart';
import 'package:guitar_learner/widgets/default_textbutton.dart';
import 'package:provider/provider.dart';

import '../../helpers/helper_bottom_sheet.dart';
import '../../model/musica/models.dart';
import '../../viewmodel/cadastro_musica_viewmodel.dart';
import '../../viewmodel/selection_sequencia_viewmodel.dart';
import '../../widgets/default_draggable_widget.dart';

class ParteSequenciaWidget extends StatelessWidget {
  final int partIndex;
  final Parte parte;

  const ParteSequenciaWidget(
      {super.key, required this.partIndex, required this.parte});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CadastroMusicaViewModel>();
    final localizations = AppLocalizations.of(context)!;

    return FormField<List<Compasso>>(
      initialValue: parte.sequencia.compassos,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return localizations.nenhumaSequenciaAdicionada;
        }
        return null;
      },
      builder: (FormFieldState<List<Compasso>> field) {
        final sequenciasAtuais = field.value ?? [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(localizations.sequencia,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10.0),
            DefaultTextButton(
              onPressed: () => _callSelectionBottomSheet(context, field),
              expandText: true,
              showBorder: true,
              child: Text(localizations.selecionar),
            ),
            const SizedBox(height: 8.0),
            const DefaultDivider(),
            SizedBox(
              width: double.infinity,
              child: sequenciasAtuais.isNotEmpty
                  ? Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 4.0,
                      runSpacing: 4.0,
                      children: [
                        for (int i = 0; i < sequenciasAtuais.length; i++)
                          _buildDraggableIcon(
                              viewModel, i, sequenciasAtuais[i], field)
                      ],
                    )
                  : Center(
                      child: Text(localizations.nenhumaSequenciaAdicionada,
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

  _buildDraggableIcon(CadastroMusicaViewModel viewModel, int index,
      Compasso compasso, FormFieldState<List<Compasso>> field) {
    return DefaultDraggableWidget(
        index: index,
        itemBuilder: () => GestureDetector(
              onLongPress: () => _clearSequencia(viewModel, field),
              child: DefaultTextButton(
                hasBackgroundColor: true,
                shrink: true,
                child: Text(compasso.toString()),
                onPressed: () => _removerCompasso(viewModel, index, field),
              ),
            ),
        onAcceptWithDetails: (DragTargetDetails<int> oldIndex) =>
            _reorganizarCompassos(viewModel, oldIndex.data, index, field));
  }

  _callSelectionBottomSheet(
      BuildContext context, FormFieldState<List<Compasso>> field) {
    final viewModel = context.read<CadastroMusicaViewModel>();

    if (viewModel.afinacaoSelecionada == null) {
      return;
    }

    callBottomSheet(
        context,
        ChangeNotifierProvider(
          create: (_) => SelectionSequenciaViewModel(
              afinacaoId: viewModel.afinacaoSelecionada!.id,
              repository: context.read<IAcordeRepository>()),
          child: SelectionSequenciaPage(
            onSelectionCallback: (sequencia) =>
                _adicionarSequencia(viewModel, sequencia, field),
          ),
        ));
  }

  _adicionarSequencia(CadastroMusicaViewModel viewModel, Sequencia sequencia,
      FormFieldState<List<Compasso>> field) {
    viewModel.adicionarSequencia(partIndex, sequencia);
    _notifyChangeToForm(viewModel, field);
  }

  _clearSequencia(
      CadastroMusicaViewModel viewModel, FormFieldState<List<Compasso>> field) {
    viewModel.clearSequencia(partIndex);
    _notifyChangeToForm(viewModel, field);
  }

  _removerCompasso(CadastroMusicaViewModel viewModel, int index,
      FormFieldState<List<Compasso>> field) {
    viewModel.removerCompasso(partIndex, index);
    _notifyChangeToForm(viewModel, field);
  }

  _reorganizarCompassos(CadastroMusicaViewModel viewModel, int data, int index,
      FormFieldState<List<Compasso>> field) {
    viewModel.reorganizarCompassos(partIndex, data, index);
    _notifyChangeToForm(viewModel, field);
  }

  void _notifyChangeToForm(CadastroMusicaViewModel viewModel,
          FormFieldState<List<Compasso>> field) =>
      field.didChange(
          viewModel.musicaRascunho.partes[partIndex].sequencia.compassos);
}
