import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  final Text child;
  final VoidCallback? onPressed;
  final bool expandText;
  final bool showBorder;
  final bool hasBackgroundColor;
  final bool shrink;

  const DefaultTextButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.expandText = false,
    this.showBorder = false,
    this.hasBackgroundColor = false,
    this.shrink = false,
  });

  Color? _getBackgroundColor(BuildContext context) =>
      Theme.of(context).inputDecorationTheme.fillColor;

  ButtonStyle _buildStyle(BuildContext context) {
    return TextButton.styleFrom(
      padding: shrink ? const EdgeInsets.all(8.0) : null,
      minimumSize: shrink ? Size.zero : null,
      tapTargetSize: shrink ? MaterialTapTargetSize.shrinkWrap : null,
      backgroundColor: hasBackgroundColor ? _getBackgroundColor(context) : null,
      side:
          showBorder ? BorderSide(color: Theme.of(context).primaryColor) : null,
      shape: showBorder
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: _buildStyle(context),
      child: expandText
          ? SizedBox(
              width: double.infinity,
              child: Align(
                alignment: Alignment.center,
                child: child,
              ),
            )
          : child,
    );
  }
}
