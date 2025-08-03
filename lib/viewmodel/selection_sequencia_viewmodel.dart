import 'package:flutter/cupertino.dart';

import '../model/musica/models.dart';

class SelectionSequenciaViewModel extends ChangeNotifier {
  List<Acorde> acordesDisponiveis = [];

  SelectionSequenciaViewModel(Instrumento instrumento) {
    buscarAcordesDisponiveis(instrumento);
  }

  buscarAcordesDisponiveis(Instrumento instrumento) async {
    acordesDisponiveis = await _getAcordesDisponiveis(instrumento);
    notifyListeners();
  }

  Future<List<Acorde>> _getAcordesDisponiveis(Instrumento instrumento) async {
    return []; //ToDo: implementar busca no banco
  }
}
