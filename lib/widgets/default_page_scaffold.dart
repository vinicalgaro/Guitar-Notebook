import 'package:flutter/material.dart';
import 'package:guitar_learner/extensions/navigation_extension.dart';

class DefaultPageScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? floatingActionButton;

  const DefaultPageScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(title),
        actions: actions,
        leading: TextButton.icon(
          onPressed: context.goBack,
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          label: Text(MaterialLocalizations.of(context).backButtonTooltip),
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
            padding: EdgeInsets.zero,
          ),
        ),
        leadingWidth: 100,
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.175),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: body,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
