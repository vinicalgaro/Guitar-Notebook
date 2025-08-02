import 'package:guitar_learner/model/musica/models.dart';

import 'parte.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
  violao('Violão', 6),
  guitarra('Guitarra', 6),
  ukelele('Ukelele', 4);

  final String _name;
  final int _numCordas;

  const Instrumento(this._name, this._numCordas);

  int get numCordas => _numCordas;

  String get name => _name;
}
