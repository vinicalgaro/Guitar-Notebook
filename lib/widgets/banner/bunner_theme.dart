import 'package:flutter/material.dart';

class BannerTheme {
  final Color mainColor;
  final Color backgroundColor;
  final Color tituloColor;
  final Color? descricaoColor;
  final IconData icon;
  final Color? iconColor;

  BannerTheme({
    required this.mainColor,
    required this.backgroundColor,
    required this.tituloColor,
    this.descricaoColor,
    required this.icon,
    this.iconColor,
  });

  BannerTheme lerp(covariant BannerTheme? other, double t) {
    if (other is! BannerTheme) {
      return this;
    }

    return BannerTheme(
      mainColor: Color.lerp(mainColor, other.mainColor, t) ?? other.mainColor,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t) ??
          other.backgroundColor,
      tituloColor:
          Color.lerp(tituloColor, other.tituloColor, t) ?? other.tituloColor,
      descricaoColor: Color.lerp(descricaoColor, other.descricaoColor, t),
      icon: t < .5 ? icon : other.icon,
      iconColor: Color.lerp(iconColor, other.iconColor, t) ?? other.iconColor,
    );
  }
}
