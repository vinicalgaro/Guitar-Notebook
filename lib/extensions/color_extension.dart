import 'package:flutter/material.dart';

extension ColorUtils on Color {
  /// Retorna uma versão mais clara da cor.
  /// O fator [amount] vai de 0.0 (cor original) a 1.0 (branco total).
  Color lighten([double amount = 0.7]) {
    assert(amount >= 0 && amount <= 1);

    final lighterColor = Color.lerp(this, Colors.white, amount)!;
    return lighterColor;
  }

  Color withSafeOpacity(double percent) => withAlpha((percent * 255).round());
}
