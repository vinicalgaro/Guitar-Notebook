import 'package:guitar_notebook/data/database.dart';
import 'package:guitar_notebook/model/repository/acorde_repository.dart';

import '../../model/musica/models.dart' as model;

class AcordeRepositoryImpl implements IAcordeRepository {
  final AcordesDao _acordesDao;

  AcordeRepositoryImpl(this._acordesDao);

  @override
  Future<List<model.Afinacao>> getAfinacoesPorInstrumento(
      model.Instrumento instrumento) async {
    final afinacoesData =
        await _acordesDao.getAfinacoesPorInstrumento(instrumento);
    return afinacoesData.map((e) => _converterAfinacaoParaModelo(e)).toList();
  }

  @override
  Future<List<model.Acorde>> getAcordesDisponiveis(int afinacaoId) async {
    final acordesComDigitacao =
        await _acordesDao.getAcordesComDigitacao(afinacaoId);
    return acordesComDigitacao
        .map((e) => _converterAcordeParaModelo(e.acorde, e.digitacao))
        .toList();
  }

  @override
  Future<model.Afinacao?> getAfinacaoPorId(int id) async {
    final afinacaoData = await _acordesDao.getAfinacaoPorId(id);
    if (afinacaoData == null) return null;
    return _converterAfinacaoParaModelo(afinacaoData);
  }

  model.Afinacao _converterAfinacaoParaModelo(AfinacaoData data) => model.Afinacao(
        id: data.id,
        nome: data.nome,
        instrumento: data.instrumento,
        notas: data.notas,
      );

  model.Acorde _converterAcordeParaModelo(
          AcordeData acordeData, DigitacaoData digitacaoData) =>
      model.Acorde(
        id: acordeData.id,
        nome: acordeData.nome,
        tipo: acordeData.tipo,
        cordas: digitacaoData.posicoes.frets.length,
        posicoes: digitacaoData.posicoes,
      );
}
