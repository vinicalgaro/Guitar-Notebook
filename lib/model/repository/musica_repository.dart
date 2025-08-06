import 'package:guitar_learner/model/musica/models.dart' as model;

abstract class IMusicaRepository {
  Future<void> salvarMusica(model.Musica musica);

  Future<void> deletarMusica(int id);

  Future<model.Musica?> getMusica(int id);

  Stream<List<model.Musica>> watchAllMusicas();
}