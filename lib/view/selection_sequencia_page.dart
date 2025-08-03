import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/musica/models.dart';
import '../viewmodel/selection_sequencia_viewmodel.dart';

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
    final viewModel = context.read<SelectionSequenciaViewModel>();

    return const SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text("data"),
        ));
  }
}
