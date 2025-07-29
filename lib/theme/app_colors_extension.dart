import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color textSecondary;

  const AppColorsExtension({
    required this.textSecondary,
  });

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? textPrimary,
    Color? textSecondary,
    Color? textDisabled,
  }) {
    return AppColorsExtension(
      textSecondary: textSecondary ?? this.textSecondary,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }
    return AppColorsExtension(
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
    );
  }
}
