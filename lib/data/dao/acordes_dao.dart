part of '../database.dart';

@DriftAccessor(tables: [Acordes])
class AcordesDao extends DatabaseAccessor<AppDatabase> with _$AcordesDaoMixin {
  AcordesDao(AppDatabase db) : super(db);

  Future<void> seedAcordes(List<AcordesCompanion> acordesParaSalvar) async {
    await batch((b) {
      b.insertAll(
        acordes,
        acordesParaSalvar,
        mode: InsertMode.insertOrIgnore,
      );
    });
  }

  Future<List<AcordeData>> getTodosAcordes(int numCorda) async =>
      await (select(acordes)..where((tbl) => tbl.cordas.equals(numCorda)))
          .get();
}
