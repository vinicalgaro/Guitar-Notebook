import 'package:flutter/material.dart';

class DefaultCardContainer extends StatelessWidget {
  final Widget child;
  final bool shadow;
  final EdgeInsetsGeometry? margin;
  final Color? specialColor;
  final bool showBorder;

  const DefaultCardContainer(
      {super.key,
      required this.child,
      this.shadow = true,
      this.margin,
      this.specialColor,
      this.showBorder = true});

  @override
  Widget build(BuildContext context) => Container(
        margin: margin ?? const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: specialColor ?? Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12.0),
          border: showBorder
              ? Border.all(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                  width: 0.3)
              : null,
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
