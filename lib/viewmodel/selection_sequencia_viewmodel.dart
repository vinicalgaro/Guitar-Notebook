import 'package:flutter/cupertino.dart';
import 'package:guitar_notebook/model/repository/acorde_repository.dart';

import '../model/musica/models.dart';

class SelectionSequenciaViewModel extends ChangeNotifier {
  final IAcordeRepository _repository;
  final int afinacaoId;

  final int _maxCompassos = 8;

  bool _isLoading = true;

  List<Acorde> acordesDisponiveis = [];
  List<Compasso> sequenciaAtual = [];

  SelectionSequenciaViewModel({
    required this.afinacaoId,
    required repository,
  }) : _repository = repository {
    _buscarAcordesDisponiveis();
  }

  bool get isLoading => _isLoading;

  void _buscarAcordesDisponiveis() async {
    acordesDisponiveis = await _repository.getAcordesDisponiveis(afinacaoId);
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
}
