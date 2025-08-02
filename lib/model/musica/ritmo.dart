class Ritmo {
  final List<Batida> batidas;

  Ritmo(this.batidas);

  @override
  String toString() => batidas.map((b) => b.toString()).join(' ');
}

enum Batida {
  baixo('↓'),
  cima('↑');

  final String _simbolo;

  const Batida(this._simbolo);

  String get simbolo => _simbolo;
}
