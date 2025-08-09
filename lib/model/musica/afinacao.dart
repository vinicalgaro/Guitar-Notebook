import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../l10n/app_localizations.dart';
import 'musica.dart';

part 'afinacao.freezed.dart';

@freezed
class Afinacao with _$Afinacao {
  const factory Afinacao({
    required int id,
    required String nome,
    required Instrumento instrumento,
    required String notas,
  }) = _Afinacao;
}

extension AfinacaoExtension on Afinacao {
  String nameFormatted(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    switch (notas) {
      case 'EADGBe':
        return localizations.afinacaoPadrao;
      case 'DADGBe':
        return localizations.afinacaoDropD;
      case 'gCEA':
        return localizations.afinacaoPadraoC;
      case 'GCEA':
        return localizations.afinacaoLowG;
      default:
        return nome;
    }
  }
}
