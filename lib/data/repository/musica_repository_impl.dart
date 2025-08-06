import 'package:guitar_learner/data/database.dart';
import 'package:guitar_learner/model/musica/models.dart' as model;
import 'package:guitar_learner/model/repository/musica_repository.dart';

class MusicaRepositoryImpl implements IMusicaRepository {
  final MusicasDao _musicasDao;

  MusicaRepositoryImpl(this._musicasDao);

  @override
  Future<void> salvarMusica(model.Musica musica) {
    return _musicasDao.upsertMusica(musica);
  }

  @override
  Future<void> deletarMusica(int id) {
    return _musicasDao.deleteMusica(id);
  }

  @override
  Future<model.Musica?> getMusica(int id) async {
    final musicaCompletaData = await _musicasDao.getMusicaCompleta(id);
    if (musicaCompletaData == null) {
      return null;
    }
    return await _converterParaModelo(musicaCompletaData);
  }

  @override
  Stream<List<model.Musica>> watchAllMusicas() {
    return _musicasDao
        .watchTodasMusicasCompletas()
        .asyncMap((listaDoBanco) async {
      final List<model.Musica> listaConvertida = [];
      for (var data in listaDoBanco) {
        listaConvertida.add(await _converterParaModelo(data));
      }
      return listaConvertida;
    });
  }

  Future<model.Musica> _converterParaModelo(MusicaCompletaData data) async {
    final partesDoModelo = <model.Parte>[];

    for (var parteData in data.partes) {
      final compassosDoModelo = <model.Compasso>[];
      for (var compassoComAcorde in parteData.compassos) {
        final acordeDoModelo = model.Acorde(
          id: compassoComAcorde.acorde.id,
          nome: compassoComAcorde.acorde.nome,
          tipo: compassoComAcorde.acorde.tipo,
          cordas: 0,
          posicoes: const model.Posicoes(trasteInicial: 0, dedos: []),
        );

        compassosDoModelo.add(model.Compasso(
          acordeDoModelo,
          compassoComAcorde.compasso.vezes,
        ));
      }

      partesDoModelo.add(model.Parte(
        nome: parteData.parte.nome,
        ritmo: model.Ritmo.fromString(parteData.parte.ritmo),
        sequencia: model.Sequencia(compassosDoModelo),
      ));
    }

    return model.Musica(
      id: data.musica.id,
      nome: data.musica.nome,
      instrumento: data.musica.instrumento,
      afinacaoId: data.musica.afinacaoId,
      linkYoutube: data.musica.linkYoutube,
      partes: partesDoModelo,
    );
  }
}
