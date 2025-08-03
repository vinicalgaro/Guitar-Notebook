import 'acorde.dart';

class Compasso {
  final Acorde acorde;
  final int vezes;

  Compasso(this.acorde, this.vezes);

  @override
  String toString() => '${vezes}x ${acorde.nome}';
}