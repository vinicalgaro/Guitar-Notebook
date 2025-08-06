import 'package:guitar_learner/model/musica/models.dart' as model;

abstract class IAcordeRepository {
  Future<List<model.Afinacao>> getAfinacoesPorInstrumento(model.Instrumento instrumento);
  Future<List<model.Acorde>> getAcordesDisponiveis(int afinacaoId);
}