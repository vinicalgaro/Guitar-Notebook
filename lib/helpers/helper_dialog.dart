import 'package:flutter/material.dart';

import '../widgets/default_textbutton.dart';

///Exibe um diálogo de ação positiva e negativa no contexto atual (podendo também adicionar uma terceira ação).
Future<T?> displayActionDialog<T>(
  BuildContext context,
  String title,
  String description,
  Function? positiveOnPressed, {
  String? negativeLabel,
  Function? negativeOnPressed,
  String? positiveLabel,
  Function? thirdOnPressed,
  String? thirdLabel,
  bool highlightPositive = true,
  bool onlyOneButton = false,
  Widget? widgetContent,
}) async {
  return await showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return AlertDialog(
        title: Center(child: Text(title)),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(description),
                if (widgetContent != null) widgetContent,
              ],
            ),
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          if (!onlyOneButton)
            DefaultTextButton(
              onPressed: () {
                negativeOnPressed?.call();
                Navigator.of(dialogContext, rootNavigator: true).pop(false);
              },
              child: Text(negativeLabel ??
                  MaterialLocalizations.of(context).cancelButtonLabel),
            ),
          if (thirdOnPressed != null)
            DefaultTextButton(
              onPressed: () {
                thirdOnPressed.call();
                Navigator.of(dialogContext, rootNavigator: true).pop();
              },
              child: Text(thirdLabel ?? ""),
            ),
          DefaultTextButton(
            onPressed: () {
              positiveOnPressed?.call();
              Navigator.of(dialogContext, rootNavigator: true).pop(true);
            },
            child: Text(
              positiveLabel ?? MaterialLocalizations.of(context).okButtonLabel,
              style: TextStyle(
                  fontWeight:
                      highlightPositive ? FontWeight.bold : FontWeight.w500),
            ),
          ),
        ],
      );
    },
  );
}

Future<T?> getDefaultDialog<T>(
    {required BuildContext context,
    required String title,
    required Widget content,
    required List<Widget> actions,
    bool useScroll = false,
    BoxConstraints? boxConstraints,
    MainAxisAlignment actionsAlignment = MainAxisAlignment.spaceAround}) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Center(child: Text(title)),
      content: ConstrainedBox(
        constraints: boxConstraints ?? const BoxConstraints(),
        child: useScroll
            ? SingleChildScrollView(
                child: content,
              )
            : content,
      ),
      actions: actions,
      actionsAlignment: actionsAlignment,
    ),
  );
}
