import 'package:guitar_learner/data/database.dart';
import 'package:guitar_learner/model/musica/acorde.dart';
import 'package:guitar_learner/model/repository/acorde_repository.dart';

import '../../model/musica/models.dart' as model;

class AcordeRepositoryImpl implements IAcordeRepository {
  final AcordesDao _acordesDao;

  AcordeRepositoryImpl(this._acordesDao);

  @override
  Future<List<Acorde>> getAcordesDisponiveis(int numCordas) async {
    List<AcordeData> acordesData = await _acordesDao.getTodosAcordes(numCordas);
    return acordesData.map((e) => _converterParaModelo(e)).toList();
  }

  model.Acorde _converterParaModelo(AcordeData data) => model.Acorde(
      id: data.id,
      nome: data.nome,
      tipo: data.tipo,
      cordas: data.cordas,
      posicoes: data.posicoes);
}
