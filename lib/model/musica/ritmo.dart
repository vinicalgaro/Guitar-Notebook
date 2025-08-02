class Ritmo {
  final List<Batida> batidas;

  Ritmo(this.batidas);

  @override
  String toString() => batidas.map((b) => b.toString()).join(' ');
}

enum Batida {
  baixo,
  cima;

  @override
  toString() {
    switch (this) {
      case Batida.baixo:
        return '↓';
      case Batida.cima:
        return '↑';
    }
  }
}
