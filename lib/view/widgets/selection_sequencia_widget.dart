import 'package:flutter/material.dart';

import '../../model/musica/models.dart';

class SelectionSequenciaWidget extends StatefulWidget {
  final List<Compasso> initialListaCompassos;
  final Function(List<Compasso> compassos) onSelectionCallback;

  const SelectionSequenciaWidget({
    super.key,
    required this.initialListaCompassos,
    required this.onSelectionCallback,
  });

  @override
  State<SelectionSequenciaWidget> createState() =>
      _SelectionSequenciaWidgetState();
}

class _SelectionSequenciaWidgetState extends State<SelectionSequenciaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
