import 'compasso.dart';

class Sequencia {
  final List<Compasso> compassos;

  Sequencia(this.compassos);

  @override
  String toString() => compassos.map((c) => c.toString()).join(' ');
}
