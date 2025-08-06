class Ritmo {
  final List<Batida> batidas;

  Ritmo(this.batidas);

  @override
  String toString() => batidas.map((b) => b.simbolo).join(',');

  factory Ritmo.fromString(String dbValue) {
    if (dbValue.isEmpty) {
      return Ritmo([]);
    }
    final simbolos = dbValue.split(',');
    final batidas = simbolos.map((simbolo) {
      return Batida.values
          .firstWhere((b) => b.simbolo == simbolo, orElse: () => Batida.baixo);
    }).toList();
    return Ritmo(batidas);
  }
}

enum Batida {
  baixo('↓'),
  cima('↑');

  final String _simbolo;

  const Batida(this._simbolo);

  String get simbolo => _simbolo;
}
