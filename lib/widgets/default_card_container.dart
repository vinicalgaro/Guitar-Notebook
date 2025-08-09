import 'package:flutter/material.dart';
import 'package:guitar_notebook/extensions/color_extension.dart';

class DefaultCardContainer extends StatelessWidget {
  final Widget child;
  final bool shadow;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? specialColor;
  final bool showBorder;

  const DefaultCardContainer({
    super.key,
    required this.child,
    this.shadow = true,
    this.margin,
    this.specialColor,
    this.showBorder = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) => Container(
    margin: margin ?? const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: specialColor ?? Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(12.0),
      border: showBorder
          ? Border.all(
              color: Theme.of(context).colorScheme.outline.withSafeOpacity(0.2),
              width: 0.3,
            )
          : null,
      boxShadow: shadow
          ? [
              BoxShadow(
                color: Colors.black.withSafeOpacity(0.175),
                blurRadius: 1,
                offset: const Offset(0, 2),
              ),
            ]
          : null,
    ),
    child: Padding(padding: padding ?? const EdgeInsets.all(8.0), child: child),
  );
}
