import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final bool expandText;
  final bool showBorder;
  final bool hasBackgroundColor;
  final bool shrink;
  final double padding;

  const DefaultTextButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.expandText = false,
    this.showBorder = false,
    this.hasBackgroundColor = false,
    this.shrink = false,
    this.padding = 8.0,
  });

  Color? _getBackgroundColor(BuildContext context) =>
      Theme.of(context).inputDecorationTheme.fillColor;

  ButtonStyle _buildStyle(BuildContext context) {
    return TextButton.styleFrom(
      padding: shrink ? EdgeInsets.all(padding) : null,
      minimumSize: shrink ? Size.zero : null,
      tapTargetSize: shrink ? MaterialTapTargetSize.shrinkWrap : null,
      backgroundColor: hasBackgroundColor ? _getBackgroundColor(context) : null,
      side: showBorder
          ? BorderSide(color: Theme.of(context).colorScheme.primary)
          : null,
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
