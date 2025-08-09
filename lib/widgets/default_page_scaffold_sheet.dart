import 'package:flutter/material.dart';
import 'package:guitar_notebook/extensions/navigation_extension.dart';
import 'package:guitar_notebook/helpers/appbar_gradient.dart';

class DefaultPageScaffoldSheet extends StatelessWidget {
  final Widget title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? floatingActionButton;

  const DefaultPageScaffoldSheet({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    final bool canPop = ModalRoute.of(context)?.canPop ?? false;

    return Scaffold(
      floatingActionButton: floatingActionButton,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: buildAppBarGradient(context),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 4,
            title: FittedBox(fit: BoxFit.scaleDown, child: title),
            automaticallyImplyLeading: false,
            actions: actions,
            actionsPadding: const EdgeInsets.all(8.0),
            leading: canPop
                ? IconButton(
                    onPressed: context.goBack,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(
                        context,
                      ).appBarTheme.foregroundColor,
                      padding: EdgeInsets.zero,
                    ),
                  )
                : null,
          ),
        ),
      ),
      body: body,
    );
  }
}
