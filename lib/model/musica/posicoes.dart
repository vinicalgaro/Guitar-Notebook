import 'package:freezed_annotation/freezed_annotation.dart';

part 'posicoes.freezed.dart';

part 'posicoes.g.dart';

@freezed
class Posicoes with _$Posicoes {
  const factory Posicoes({
    @JsonKey(name: 'traste_inicial') required int trasteInicial,
    required List<int> fingers,
    required List<int> frets,
  }) = _Posicoes;

  factory Posicoes.fromJson(Map<String, dynamic> json) =>
      _$PosicoesFromJson(json);
}
