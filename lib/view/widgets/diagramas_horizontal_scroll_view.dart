import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../model/musica/models.dart';
import 'acorde_diagram_widget.dart';

class DiagramasHorizontalScrollView extends StatefulWidget {
  final Set<Acorde> acordes;

  const DiagramasHorizontalScrollView({super.key, required this.acordes});

  @override
  State<DiagramasHorizontalScrollView> createState() =>
      _DiagramasHorizontalScrollViewState();
}

class _DiagramasHorizontalScrollViewState
    extends State<DiagramasHorizontalScrollView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scrollbar(
    interactive: false,
    controller: _scrollController,
    thumbVisibility: true,
    trackVisibility: false,
    thickness: 2,
    radius: const Radius.circular(10),
    child: RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        HorizontalDragGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<
              HorizontalDragGestureRecognizer
            >(() => HorizontalDragGestureRecognizer(), (
              HorizontalDragGestureRecognizer instance,
            ) {
              instance.onUpdate = (details) {
                _scrollController.position.moveTo(
                  _scrollController.offset - details.delta.dx,
                );
              };
            }),
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Row(
          children: [
            const SizedBox(width: 2.0),
            for (final a in widget.acordes)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: AcordeDiagramWidget(acorde: a),
              ),
          ],
        ),
      ),
    ),
  );
}
