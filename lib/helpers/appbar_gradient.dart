import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

Decoration buildAppBarGradient(BuildContext context) {
  const primary = AppTheme.paletaDarkBlue;
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
