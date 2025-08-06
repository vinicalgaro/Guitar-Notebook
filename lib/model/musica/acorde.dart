import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'posicoes.dart';

part 'acorde.freezed.dart';

part 'acorde.g.dart';

enum TipoAcorde {
  maior,
  menor,
  outro;

  const TipoAcorde();

  String nameFormatted(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    switch (this) {
      case TipoAcorde.maior:
        return localizations.maior;
      case TipoAcorde.menor:
        return localizations.menor;
      case TipoAcorde.outro:
        return localizations.outro;
      default:
        return "";
    }
  }
}

@freezed
class Acorde with _$Acorde {
  const factory Acorde({
    required int id,
    required String nome,
    required TipoAcorde tipo,
    required int cordas,
    @JsonKey(name: 'posicoes_json') required Posicoes posicoes,
  }) = _Acorde;

  const Acorde._();

  factory Acorde.fromJson(Map<String, dynamic> json) => _$AcordeFromJson(json);

  String formattedName(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    String notaBase = nome[0];
    String modificadores = nome.substring(1);

    String notaTraduzida;
    switch (notaBase) {
      case 'C':
        notaTraduzida = localizations.nota_C;
        break;
      case 'D':
        notaTraduzida = localizations.nota_D;
        break;
      case 'E':
        notaTraduzida = localizations.nota_E;
        break;
      case 'F':
        notaTraduzida = localizations.nota_F;
        break;
      case 'G':
        notaTraduzida = localizations.nota_G;
        break;
      case 'A':
        notaTraduzida = localizations.nota_A;
        break;
      case 'B':
        notaTraduzida = localizations.nota_B;
        break;
      default:
        notaTraduzida = notaBase;
    }

    String tipoTraduzido = tipo.nameFormatted(context);

    return '$notaTraduzida$modificadores $tipoTraduzido';
  }
}
