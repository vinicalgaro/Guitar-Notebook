import 'package:guitar_learner/model/musica/models.dart' as model;

abstract class IAcordeRepository {
  Future<List<model.Acorde>> getAcordesDisponiveis(int numCordas);
}