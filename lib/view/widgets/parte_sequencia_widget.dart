import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guitar_learner/view/widgets/selection_sequencia_widget.dart';
import 'package:guitar_learner/widgets/default_divider.dart';
import 'package:guitar_learner/widgets/default_textbutton.dart';
import 'package:provider/provider.dart';

import '../../helpers/helper_toast.dart';
import '../../model/musica/models.dart';
import '../../viewmodel/cadastro_musica_viewmodel.dart';
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
              onLongPress: () => _clearCompassos(viewModel, field),
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

    showModalBottomSheet(
      context: context,
      builder: (context) => SelectionSequenciaWidget(
        initialListaCompassos:
            viewModel.musicaRascunho.partes[partIndex].sequencia.compassos,
        onSelectionCallback: (compassos) =>
            _adicionarListaCompassos(viewModel, compassos, field),
      ),
    );
  }

  _adicionarListaCompassos(CadastroMusicaViewModel viewModel,
      List<Compasso> compassos, FormFieldState<List<Compasso>> field) {
    viewModel.adicionarListaCompassos(partIndex, compassos);
    _notifyChangeToForm(viewModel, field);
  }

  _clearCompassos(
      CadastroMusicaViewModel viewModel, FormFieldState<List<Compasso>> field) {
    viewModel.clearCompassos(partIndex);
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
