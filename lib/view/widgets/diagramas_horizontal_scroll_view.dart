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
  Widget build(BuildContext context) => Listener(
    onPointerSignal: (pointerSignal) {
      if (pointerSignal is PointerScrollEvent) {
        final newOffset =
            _scrollController.offset + pointerSignal.scrollDelta.dy;
        _scrollController.jumpTo(newOffset);
      }
    },
    child: Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      interactive: true,
      thickness: 3,
      radius: const Radius.circular(10),
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 16.0, right: 8.0, left: 8.0),
        child: Row(
          children: widget.acordes
              .map(
                (acorde) => Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: AcordeDiagramWidget(acorde: acorde),
                ),
              )
              .toList(),
        ),
      ),
    ),
  );
}
