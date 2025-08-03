import 'package:flutter/cupertino.dart';

import '../model/musica/models.dart';

class SelectionSequenciaViewModel extends ChangeNotifier {
  // Listas separadas por tipo
  List<Acorde> acordesDisponiveis = [];

  // Lista para construir a sequência
  List<Compasso> sequenciaAtual = [];

  SelectionSequenciaViewModel(Instrumento instrumento) {
    _buscarAcordesDisponiveis(instrumento);
  }

  void _buscarAcordesDisponiveis(Instrumento instrumento) async {
    await Future.delayed(const Duration(
        seconds: 1)); // Simulação da busca de dados //ToDo: remover
    acordesDisponiveis = await _getAcordesDisponiveis(instrumento);

    notifyListeners();
  }

  List<Acorde> getAcordesByTipo(TipoAcorde tipo) =>
      acordesDisponiveis.where((acorde) => acorde.tipo == tipo).toList();

  List<TipoAcorde> getTiposDisponiveis() =>
      acordesDisponiveis.map((acorde) => acorde.tipo).toSet().toList();

  void adicionarAcordeNaSequencia(Acorde acorde) {
    if (sequenciaAtual.isNotEmpty &&
        sequenciaAtual.last.acorde.nome == acorde.nome) {
      final ultimoCompasso = sequenciaAtual.last;
      sequenciaAtual.last =
          Compasso(ultimoCompasso.acorde, ultimoCompasso.vezes + 1);
    } else {
      sequenciaAtual.add(Compasso(acorde, 1));
    }
    notifyListeners();
  }

  void removerCompasso(int index) {
    sequenciaAtual.removeAt(index);
    notifyListeners();
  }

  void limparSequencia() {
    sequenciaAtual.clear();
    notifyListeners();
  }

  Future<List<Acorde>> _getAcordesDisponiveis(Instrumento instrumento) async {
    // ToDo: Implementar a busca real no banco de dados.
    return [
      const Acorde(
          nome: "C",
          fullName: "Dó Maior",
          tipo: TipoAcorde.maior,
          instrumento: 'violao',
          afinacao: 'EADGBe',
          posicoes: Posicoes(trasteInicial: 1, dedos: [])),
      const Acorde(
          nome: "G",
          fullName: "Sol Maior",
          tipo: TipoAcorde.maior,
          instrumento: 'violao',
          afinacao: 'EADGBe',
          posicoes: Posicoes(trasteInicial: 1, dedos: [])),
      const Acorde(
          nome: "D",
          fullName: "Ré Maior",
          tipo: TipoAcorde.maior,
          instrumento: 'violao',
          afinacao: 'EADGBe',
          posicoes: Posicoes(trasteInicial: 1, dedos: [])),
      const Acorde(
          nome: "Am",
          fullName: "Lá Menor",
          tipo: TipoAcorde.menor,
          instrumento: 'violao',
          afinacao: 'EADGBe',
          posicoes: Posicoes(trasteInicial: 1, dedos: [])),
      const Acorde(
          nome: "Em",
          fullName: "Mi Menor",
          tipo: TipoAcorde.menor,
          instrumento: 'violao',
          afinacao: 'EADGBe',
          posicoes: Posicoes(trasteInicial: 1, dedos: [])),
    ];
  }
}
