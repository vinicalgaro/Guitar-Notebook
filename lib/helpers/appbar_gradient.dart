import 'package:flutter/material.dart';

Decoration buildAppBarGradient(BuildContext context) {
  final primary = Theme.of(context).colorScheme.primary;
  final lightPrimary = Color.lerp(
    primary,
    Colors.white,
    0.12,
  )!;

  return BoxDecoration(
    gradient: LinearGradient(
      colors: [primary, lightPrimary],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );
}
