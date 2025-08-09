import 'package:flutter/material.dart';

import '../model/musica/models.dart';
import '../model/repository/acorde_repository.dart';

class PlaySongViewModel extends ChangeNotifier {
  final IAcordeRepository _acordesRepository;

  Musica musica;
  Afinacao? afinacao;
  double autoPlaySeconds = 0;

  double get maxAutoPlaySeconds => 60;

  double get minAutoPlaySeconds => 0;

  int get autoPlayDivisions => 12;

  PlaySongViewModel({required acordesRepository, required this.musica})
    : _acordesRepository = acordesRepository {
    _loadAfinacao(musica.afinacaoId);
  }

  _loadAfinacao(int afinacaoId) async {
    afinacao = await _acordesRepository.getAfinacaoPorId(afinacaoId);
    notifyListeners();
  }

  void setAutoPlaySeconds(double seconds) {
    autoPlaySeconds = seconds;
    notifyListeners();
  }
}
