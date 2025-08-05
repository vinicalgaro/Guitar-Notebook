import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guitar_learner/model/musica/models.dart';

import 'parte.dart';

part 'musica.freezed.dart';

@freezed
class Musica with _$Musica {
  const factory Musica(
      {required String nome,
      required Instrumento instrumento,
      String? linkYoutube,
      required List<Parte> partes}) = _Musica;
}

enum Instrumento {
  violao(6),
  guitarra(6),
  ukelele(4);

  final int _numCordas;

  const Instrumento(this._numCordas);

  int get numCordas => _numCordas;

  String name(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    switch (this) {
      case Instrumento.violao:
        return localizations.violao;
      case Instrumento.guitarra:
        return localizations.guitarra;
      case Instrumento.ukelele:
        return localizations.ukelele;
      default:
        return "";
    }
  }
}
