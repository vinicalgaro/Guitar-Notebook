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
    return _converterParaModelo(musicaCompletaData);
  }

  @override
  Stream<List<model.Musica>> watchAllMusicas() {
    return _musicasDao.watchTodasMusicasCompletas().map((listaDoBanco) {
      return listaDoBanco.map(_converterParaModelo).toList();
    });
  }

  model.Musica _converterParaModelo(MusicaCompletaData data) {
    final partesDoModelo = data.partes.map((parteData) {
      final compassosDoModelo = parteData.compassos.map((compassoComAcorde) {
        final acordeDoModelo = model.Acorde(
          id: compassoComAcorde.acorde.id,
          nome: compassoComAcorde.acorde.nome,
          tipo: compassoComAcorde.acorde.tipo,
          cordas: compassoComAcorde.acorde.cordas,
          posicoes: compassoComAcorde.acorde.posicoes,
        );

        return model.Compasso(
          acordeDoModelo,
          compassoComAcorde.compasso.vezes,
        );
      }).toList();

      return model.Parte(
        nome: parteData.parte.nome,
        ritmo: model.Ritmo.fromString(parteData.parte.ritmo),
        sequencia: model.Sequencia(compassosDoModelo),
      );
    }).toList();

    return model.Musica(
      id: data.musica.id,
      nome: data.musica.nome,
      instrumento: data.musica.instrumento,
      linkYoutube: data.musica.linkYoutube,
      partes: partesDoModelo,
    );
  }
}
