import 'package:flutter/material.dart';

class DefaultCardContainer extends StatelessWidget {
  final Widget child;
  final bool shadow;
  final EdgeInsetsGeometry? margin;

  const DefaultCardContainer(
      {super.key, required this.child, this.shadow = true, this.margin});

  @override
  Widget build(BuildContext context) => Container(
        margin: margin ?? const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: shadow
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.175),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      );
}
