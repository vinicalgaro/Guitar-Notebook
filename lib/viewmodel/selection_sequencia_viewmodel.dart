import 'package:flutter/cupertino.dart';
import 'package:guitar_learner/model/repository/acorde_repository.dart';

import '../model/musica/models.dart';

class SelectionSequenciaViewModel extends ChangeNotifier {
  final IAcordeRepository _repository;

  final int _maxCompassos = 8;

  bool _isLoading = true;

  List<Acorde> acordesDisponiveis = [];
  List<Compasso> sequenciaAtual = [];

  SelectionSequenciaViewModel(
      {required Instrumento instrumento, required repository})
      : _repository = repository {
    _buscarAcordesDisponiveis(instrumento);
  }

  bool get isLoading => _isLoading;

  void _buscarAcordesDisponiveis(Instrumento instrumento) async {
    acordesDisponiveis = await _getAcordesDisponiveis(instrumento);
    _isLoading = false;

    notifyListeners();
  }

  bool get podeAdicionarSequencia =>
      sequenciaAtual.fold<int>(
          0, (somaAnterior, compasso) => somaAnterior + compasso.vezes) <
      _maxCompassos;

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

  Future<List<Acorde>> _getAcordesDisponiveis(Instrumento instrumento) async =>
      _repository.getAcordesDisponiveis(instrumento.numCordas);
}
