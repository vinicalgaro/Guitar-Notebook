import 'package:flutter/material.dart';
import 'package:guitar_notebook/extensions/navigation_extension.dart';
import 'package:guitar_notebook/model/musica/models.dart' as model;
import 'package:guitar_notebook/model/repository/musica_repository.dart';

import '../model/musica/models.dart';
import '../model/settings_repository.dart';
import '../routes/app_routes.dart';

class HomeViewModel extends ChangeNotifier {
  final IMusicaRepository _musicaRepository;
  final SettingsRepository _settingsRepository;

  HomeViewModel({
    required IMusicaRepository repository,
    required SettingsRepository settingsRepository,
  }) : _musicaRepository = repository,
       _settingsRepository = settingsRepository {
    checkWizardStatus();
  }

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  bool _shouldShowWizard = false;

  bool get shouldShowWizard => _shouldShowWizard;

  Future<void> init() async {
    await checkWizardStatus();
  }

  Future<void> checkWizardStatus() async {
    _isLoading = true;
    notifyListeners();

    final hasSeenWizard = await _settingsRepository.getWizard();
    _shouldShowWizard = !hasSeenWizard;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> wizardCompleted() async {
    await _settingsRepository.saveWizard();
    _shouldShowWizard = false;
    notifyListeners();
  }

  Stream<List<model.Musica>> get musicasStream =>
      _musicaRepository.watchAllMusicas();

  Stream<Musica?> get ultimaMusicaStream async* {
    final lastPlayedId = await _settingsRepository.getUltimaMusicaId();
    if (lastPlayedId == null) {
      yield null;
      return;
    }

    await for (final musicas in musicasStream) {
      try {
        final musicaAtualizada = musicas.firstWhere(
          (m) => m.id == lastPlayedId,
        );
        yield musicaAtualizada;
      } catch (e) {
        await _settingsRepository.clearUltimaMusica();
        yield null;
      }
    }
  }

  void deletarMusica(int musicaId) async {
    final lastPlayedId = await _settingsRepository.getUltimaMusicaId();
    await _musicaRepository.deletarMusica(musicaId);

    if (lastPlayedId == musicaId) {
      await _settingsRepository.clearUltimaMusica();
    }
  }

  void playSong(BuildContext context, Musica musica) {
    _settingsRepository.saveUltimaMusicaId(musica.id!);
    context.goTo(AppRoutes.playSong, arguments: musica);
    notifyListeners();
  }
}
