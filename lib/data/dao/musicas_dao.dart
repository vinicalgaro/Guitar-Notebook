part of '../database.dart';

@DriftAccessor(tables: [Musicas, Partes, Acordes, SequenciaCompassos])
class MusicasDao extends DatabaseAccessor<AppDatabase> with _$MusicasDaoMixin {
  MusicasDao(AppDatabase db) : super(db);

  Future<void> upsertMusica(model.Musica musica) {
    return transaction(() async {
      final musicaCompanion = MusicasCompanion.insert(
        nome: musica.nome,
        instrumento: musica.instrumento,
        linkYoutube: Value(musica.linkYoutube),
      );

      final musicaId = await into(musicas).insert(musicaCompanion);

      for (var parteModel in musica.partes) {
        final parteCompanion = PartesCompanion.insert(
          musicaId: musicaId,
          nome: parteModel.nome,
          ritmo: parteModel.ritmo.toString(),
          sequencia: parteModel.sequencia.toString(),
        );

        final parteId = await into(partes).insert(parteCompanion);

        int ordem = 0;
        for (var compasso in parteModel.sequencia.compassos) {
          final acorde = await (select(acordes)
                ..where((tbl) =>
                    tbl.nome.equals(compasso.acorde.nome) &
                    tbl.cordas.equals(musica.instrumento.numCordas)))
              .getSingleOrNull();

          if (acorde != null) {
            final sequenciaCompanion = SequenciaCompassosCompanion.insert(
              parteId: parteId,
              acordeId: acorde.id,
              vezes: compasso.vezes,
              ordem: ordem++,
            );
            await into(sequenciaCompassos).insert(sequenciaCompanion);
          }
        }
      }
    });
  }

  Future<void> deleteMusica(int id) {
    return (delete(musicas)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<List<MusicaCompletaData>> getTodasMusicasCompletas() async {
    final musicasResult = await select(musicas).get();
    final musicasCompletas = <MusicaCompletaData>[];

    for (var musicaData in musicasResult) {
      final partesResult = await _getPartesComCompassos(musicaData.id);
      musicasCompletas
          .add(MusicaCompletaData(musica: musicaData, partes: partesResult));
    }
    return musicasCompletas;
  }

  Future<MusicaCompletaData?> getMusicaCompleta(int id) async {
    final musicaResult = await (select(musicas)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
    if (musicaResult == null) {
      return null;
    }

    final partesResult = await _getPartesComCompassos(musicaResult.id);
    return MusicaCompletaData(musica: musicaResult, partes: partesResult);
  }

  Stream<List<MusicaCompletaData>> watchTodasMusicasCompletas() {
    final query = select(musicas);
    return query.watch().asyncMap((musicasResult) async {
      final musicasCompletas = <MusicaCompletaData>[];
      for (var musicaData in musicasResult) {
        final partesResult = await _getPartesComCompassos(musicaData.id);
        musicasCompletas
            .add(MusicaCompletaData(musica: musicaData, partes: partesResult));
      }
      return musicasCompletas;
    });
  }

  Future<List<ParteComCompassosData>> _getPartesComCompassos(
      int musicaId) async {
    final partesResult =
        await (select(partes)..where((p) => p.musicaId.equals(musicaId))).get();
    final partesCompletas = <ParteComCompassosData>[];

    for (var parteData in partesResult) {
      final query = select(sequenciaCompassos).join([
        innerJoin(acordes, acordes.id.equalsExp(sequenciaCompassos.acordeId))
      ])
        ..where(sequenciaCompassos.parteId.equals(parteData.id))
        ..orderBy([OrderingTerm.asc(sequenciaCompassos.ordem)]);

      final compassosResult = await query.get();

      final compassosComAcordes = compassosResult.map((row) {
        return CompassoComAcorde(
          compasso: row.readTable(sequenciaCompassos),
          acorde: row.readTable(acordes),
        );
      }).toList();

      partesCompletas.add(ParteComCompassosData(
          parte: parteData, compassos: compassosComAcordes));
    }
    return partesCompletas;
  }
}
