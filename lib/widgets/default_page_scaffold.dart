import 'package:flutter/material.dart';
import 'package:guitar_learner/extensions/navigation_extension.dart';

import '../helpers/appbar_gradient.dart';

class DefaultPageScaffold extends StatelessWidget {
  final Text? title;
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
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: floatingActionButton,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: title,
              floating: true,
              snap: true,
              pinned: false,
              automaticallyImplyLeading: false,
              actions: actions,
              leading: Navigator.of(context).canPop()
                  ? TextButton.icon(
                      onPressed: context.goBack,
                      icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                      label: Text(
                          MaterialLocalizations.of(context).backButtonTooltip),
                      style: TextButton.styleFrom(
                        foregroundColor:
                            Theme.of(context).appBarTheme.foregroundColor,
                        padding: EdgeInsets.zero,
                      ),
                    )
                  : null,
              leadingWidth: 100,
              elevation: 4,
              backgroundColor: Colors.transparent,
              flexibleSpace: SizedBox(
                height: kToolbarHeight,
                child: Container(
                  decoration: buildAppBarGradient(context),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: body,
            ),
          ],
        ),
      );
}
