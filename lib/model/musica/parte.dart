import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guitar_notebook/model/musica/models.dart';

part 'parte.freezed.dart';

@freezed
class Parte with _$Parte {
  const factory Parte({
    required String nome,
    required Ritmo ritmo,
    required Sequencia sequencia,
  }) = _Parte;
}