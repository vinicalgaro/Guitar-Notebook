import 'package:flutter/material.dart';

import '../helpers/helper_size.dart';
import 'default_card_container.dart';

class DefaultAnimatedCardContainer extends StatelessWidget {
  final ValueKey<int> widgetKey;
  final Widget widget;
  double? height;

  DefaultAnimatedCardContainer(
      {super.key, required this.widgetKey, required this.widget, this.height});

  @override
  Widget build(BuildContext context) {
    height ??= percentHeight(context, 0.15, min: 120, max: 200);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.95, end: 1.0).animate(animation),
              child: child,
            ),
          );
        },
        child: DefaultCardContainer(
          key: widgetKey,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SizedBox(
            height: height,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: widget,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
