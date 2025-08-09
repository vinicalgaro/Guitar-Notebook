import 'package:flutter/material.dart';

import '../model/musica/models.dart';
import '../model/repository/acorde_repository.dart';

class PlaySongViewModel extends ChangeNotifier {
  final IAcordeRepository _acordesRepository;

  Musica musica;
  Afinacao? afinacao;

  PlaySongViewModel({required acordesRepository, required this.musica})
    : _acordesRepository = acordesRepository {
    _loadAfinacao(musica.afinacaoId);
  }

  _loadAfinacao(int afinacaoId) async {
    afinacao = await _acordesRepository.getAfinacaoPorId(afinacaoId);
    notifyListeners();
  }
}
