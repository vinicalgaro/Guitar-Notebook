import 'package:flutter/material.dart';
import 'package:guitar_learner/model/musica/models.dart' as model;
import 'package:guitar_learner/model/repository/musica_repository.dart';

import '../model/musica/models.dart';
import '../model/settings_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final IMusicaRepository _musicaRepository;
  final SettingsRepository _settingsRepository;

  Stream<List<model.Musica>>? musicasStream;
  Musica? ultimaMusica;

  HomeViewModel(
      {required IMusicaRepository repository,
      required SettingsRepository settingsRepository})
      : _musicaRepository = repository,
        _settingsRepository = settingsRepository {
    _init();
  }

  void _init() {
    _carregarDados();
    _watchMusicas();
  }

  void deletarMusica(int musicaId) async {
    await _musicaRepository.deletarMusica(musicaId);

    if (ultimaMusica?.id == musicaId) {
      await _settingsRepository.clearUltimaMusica();
      ultimaMusica = null;
    }

    notifyListeners();
  }

  void _watchMusicas() {
    musicasStream = _musicaRepository.watchAllMusicas();
    notifyListeners();
  }

  Future<void> _carregarDados() async {
    final lastPlayedId = await _settingsRepository.getUltimaMusicaId();

    if (lastPlayedId != null) {
      final musicaEncontrada = await _musicaRepository.getMusica(lastPlayedId);

      if (musicaEncontrada != null) {
        ultimaMusica = musicaEncontrada;
      } else {
        await _settingsRepository.clearUltimaMusica();
        ultimaMusica = null;
      }
    } else {
      ultimaMusica = null;
    }

    notifyListeners();
  }
}
