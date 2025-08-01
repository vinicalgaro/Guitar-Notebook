import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  final Text child;
  final VoidCallback? onPressed;
  final bool expandText;
  final bool showBorder;

  const DefaultTextButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.expandText = false,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: onPressed,
        style: showBorder
            ? ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(color: Theme.of(context).primaryColor),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              )
            : null,
        child: expandText
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [child],
              )
            : child,
      );
}
