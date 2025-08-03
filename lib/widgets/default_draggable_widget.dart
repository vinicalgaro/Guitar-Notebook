import 'package:flutter/material.dart';

class DefaultDraggableWidget extends StatelessWidget {
  final int index;
  final void Function(DragTargetDetails<int> dragTargetDetails)?
      onAcceptWithDetails;
  final Widget Function() itemBuilder;

  const DefaultDraggableWidget({
    super.key,
    required this.index,
    this.onAcceptWithDetails,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<int>(
      builder: (context, candidateData, rejectedData) {
        return Draggable<int>(
          data: index,
          feedback: _buildItem(isDragging: true),
          childWhenDragging: _buildItem(isGhost: true),
          child: _buildItem(),
        );
      },
      onAcceptWithDetails: onAcceptWithDetails,
    );
  }

  Widget _buildItem({bool isDragging = false, bool isGhost = false}) {
    final chip = Opacity(
      opacity: isGhost ? 0.4 : 1.0,
      child: itemBuilder(),
    );

    if (isDragging) {
      return Material(
        color: Colors.transparent,
        child: chip,
      );
    }

    return chip;
  }
}
