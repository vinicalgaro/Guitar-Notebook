import 'package:flutter/material.dart';
import 'package:guitar_learner/model/musica/models.dart' as model;
import 'package:guitar_learner/model/repository/musica_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final IMusicaRepository _musicaRepository;

  HomeViewModel({required IMusicaRepository repository})
      : _musicaRepository = repository {
    watchMusicas();
  }

  Stream<List<model.Musica>>? musicasStream;

  void watchMusicas() {
    musicasStream = _musicaRepository.watchAllMusicas();
    notifyListeners();
  }
}
