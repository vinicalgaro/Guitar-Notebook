import 'package:freezed_annotation/freezed_annotation.dart';

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