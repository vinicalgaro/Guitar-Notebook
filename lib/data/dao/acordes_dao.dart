part of '../database.dart';

@DriftAccessor(tables: [Acordes, Afinacoes, Digitacoes])
class AcordesDao extends DatabaseAccessor<AppDatabase> with _$AcordesDaoMixin {
  AcordesDao(AppDatabase db) : super(db);

  Future<List<AfinacaoData>> getAfinacoesPorInstrumento(
      model.Instrumento instrumento) {
    return (select(afinacoes)
          ..where((tbl) => tbl.instrumento.equals(instrumento.name)))
        .get();
  }

  Future<List<AcordeComDigitacao>> getAcordesComDigitacao(
      int afinacaoId) async {
    final query = select(digitacoes).join([
      innerJoin(acordes, acordes.id.equalsExp(digitacoes.acordeId)),
    ])
      ..where(digitacoes.afinacaoId.equals(afinacaoId));

    final result = await query.get();

    return result.map((row) {
      return AcordeComDigitacao(
        acorde: row.readTable(acordes),
        digitacao: row.readTable(digitacoes),
      );
    }).toList();
  }
}

class AcordeComDigitacao {
  final AcordeData acorde;
  final DigitacaoData digitacao;

  AcordeComDigitacao({required this.acorde, required this.digitacao});
}
