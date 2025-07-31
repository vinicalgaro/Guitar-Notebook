import 'dart:ui';

import 'package:flutter/material.dart';

import 'bunner_theme.dart';
import 'tween_icon.dart';

///Widget de banner (usado nos toasts, por exemplo)
class DefaultBanner extends StatelessWidget {
  final String? titulo;
  final String descricao;
  final bool useMaxSize, useAnimatedIcon;
  final Color backgroundColor, mainColor;
  final Color? tituloColor, descricaoColor, iconColor;
  final double verticalRowPadding;
  final IconData icon;
  final Function? saberMaisOnClick;
  final TextStyle? tituloStyle, descricaoStyle;

  final double maxToastWidth = 600.0;

  const DefaultBanner(
      {this.titulo,
      required this.descricao,
      required this.icon,
      required this.backgroundColor,
      required this.mainColor,
      this.verticalRowPadding = 16,
      this.useMaxSize = false,
      this.useAnimatedIcon = false,
      this.saberMaisOnClick,
      this.tituloStyle,
      this.descricaoStyle,
      this.tituloColor,
      this.descricaoColor,
      this.iconColor,
      super.key});

  DefaultBanner.withTheme(BannerTheme theme,
      {this.titulo,
      required this.descricao,
      this.verticalRowPadding = 16,
      this.useMaxSize = false,
      this.useAnimatedIcon = false,
      this.saberMaisOnClick,
      this.tituloStyle,
      this.descricaoStyle,
      super.key})
      : backgroundColor = theme.backgroundColor,
        mainColor = theme.mainColor,
        tituloColor = theme.tituloColor,
        descricaoColor = theme.descricaoColor,
        icon = theme.icon,
        iconColor = theme.iconColor;

  TextStyle? get _tituloStyle {
    var textStyle = tituloStyle ??
        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    return tituloColor != null
        ? textStyle.copyWith(color: tituloColor)
        : textStyle;
  }

  TextStyle? get _descricaoStyle {
    var textStyle = descricaoStyle ??
        const TextStyle(
          fontSize: 14,
        );
    return descricaoColor != null
        ? textStyle.copyWith(color: descricaoColor)
        : textStyle;
  }

  @override
  Widget build(BuildContext context) {
    bool hasOnClick = saberMaisOnClick != null;
    return Container(
      constraints: useMaxSize
          ? null
          : BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.9,
              maxHeight: MediaQuery.of(context).size.width * 0.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Card(
          color: backgroundColor,
          shape: Border(left: BorderSide(color: mainColor, width: 6)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8, vertical: verticalRowPadding),
            child: Row(
              mainAxisSize: useMaxSize ? MainAxisSize.max : MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: useAnimatedIcon
                      ? TweenIcon(
                          icon: icon,
                          iconColor: iconColor ?? mainColor,
                        )
                      : Icon(icon, color: iconColor ?? mainColor),
                ),
                Flexible(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxToastWidth),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (titulo != null) Text(titulo!, style: _tituloStyle),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(descricao, style: _descricaoStyle),
                        ),
                      ],
                    ),
                  ),
                ),
                if (hasOnClick)
                  TextButton(
                      onPressed: () => saberMaisOnClick!.call(),
                      child: const Text("Saber Mais"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
