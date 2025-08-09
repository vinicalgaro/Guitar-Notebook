import 'package:flutter/material.dart';
import 'package:guitar_notebook/extensions/navigation_extension.dart';
import 'package:guitar_notebook/helpers/appbar_gradient.dart';

class DefaultPageScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final Widget? fixedWidget;

  const DefaultPageScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.floatingActionButton,
    this.fixedWidget,
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
            title: Text(title),
            automaticallyImplyLeading: false,
            actions: actions,
            leading: canPop
                ? TextButton.icon(
                    onPressed: context.goBack,
                    icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                    label: Text(
                      MaterialLocalizations.of(context).backButtonTooltip,
                    ),
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(
                        context,
                      ).appBarTheme.foregroundColor,
                      padding: EdgeInsets.zero,
                    ),
                  )
                : null,
            leadingWidth: 100,
          ),
        ),
      ),
      body: fixedWidget == null
          ? body
          : Column(
              children: [
                fixedWidget!,
                Expanded(child: SingleChildScrollView(child: body)),
              ],
            ),
    );
  }
}
