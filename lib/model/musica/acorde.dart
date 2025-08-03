import 'package:freezed_annotation/freezed_annotation.dart';
import 'posicoes.dart';

part 'acorde.freezed.dart';

part 'acorde.g.dart';

@freezed
class Acorde with _$Acorde {
  const factory Acorde({
    int? id,
    required String nome,
    @JsonKey(name: 'full_name') required String fullName,
    required String instrumento,
    required String afinacao,
    @JsonKey(name: 'posicoes_json') required Posicoes posicoes,
  }) = _Acorde;

  factory Acorde.fromJson(Map<String, dynamic> json) => _$AcordeFromJson(json);
}
