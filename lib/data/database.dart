import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:guitar_learner/helpers/get_from_assets.dart';
import 'package:guitar_learner/model/musica/models.dart' as model;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'dao/musicas_dao.dart';

part 'dao/acordes_dao.dart';

part 'database.g.dart';

class TipoAcordeConverter extends TypeConverter<model.TipoAcorde, String> {
  const TipoAcordeConverter();

  @override
  model.TipoAcorde fromSql(String fromDb) {
    return model.TipoAcorde.values.byName(fromDb);
  }

  @override
  String toSql(model.TipoAcorde value) {
    return value.name;
  }
}

class InstrumentoConverter extends TypeConverter<model.Instrumento, String> {
  const InstrumentoConverter();

  @override
  model.Instrumento fromSql(String fromDb) {
    return model.Instrumento.values.byName(fromDb);
  }

  @override
  String toSql(model.Instrumento value) {
    return value.name;
  }
}

class PosicoesConverter extends TypeConverter<model.Posicoes, String> {
  const PosicoesConverter();

  @override
  model.Posicoes fromSql(String fromDb) {
    return model.Posicoes.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(model.Posicoes value) {
    return jsonEncode(value.toJson());
  }
}

@DataClassName('AcordeData')
class Acordes extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get nome => text()();

  TextColumn get tipo => text().map(const TipoAcordeConverter())();

  IntColumn get cordas => integer()();

  TextColumn get posicoes =>
      text().named('posicoes_json').map(const PosicoesConverter())();

  @override
  List<Set<Column>> get uniqueKeys => [
        {nome, cordas},
      ];
}

@DataClassName('MusicaData')
class Musicas extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get nome => text()();

  TextColumn get instrumento => text().map(const InstrumentoConverter())();

  TextColumn get linkYoutube => text().nullable()();
}

@DataClassName('ParteData')
class Partes extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get musicaId =>
      integer().references(Musicas, #id, onDelete: KeyAction.cascade)();

  TextColumn get nome => text()();

  TextColumn get ritmo => text()();

  TextColumn get sequencia => text()();
}

class SequenciaCompassos extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get parteId =>
      integer().references(Partes, #id, onDelete: KeyAction.cascade)();

  IntColumn get acordeId => integer().references(Acordes, #id)();

  IntColumn get vezes => integer()();

  IntColumn get ordem => integer()();
}

@DriftDatabase(
    tables: [Musicas, Partes, Acordes, SequenciaCompassos],
    daos: [MusicasDao, AcordesDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();

        try {
          final jsonString = await rootBundle
              .loadString(getDataFromAssets('initial_chords.json'));
          final List<dynamic> jsonList = jsonDecode(jsonString);

          final acordesParaSalvar = jsonList.map((json) {
            final acordeModel =
                model.Acorde.fromJson(json as Map<String, dynamic>);
            return AcordesCompanion.insert(
                nome: acordeModel.nome,
                tipo: acordeModel.tipo,
                cordas: acordeModel.cordas,
                posicoes: acordeModel.posicoes);
          }).toList();

          await acordesDao.seedAcordes(acordesParaSalvar);

        } catch (ignored) {}
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'guitar_learner.db'));
    return NativeDatabase.createInBackground(file);
  });
}

// Agrupa uma MusicaData com sua lista de Partes
class MusicaCompletaData {
  final MusicaData musica;
  final List<ParteComCompassosData> partes;

  MusicaCompletaData({required this.musica, required this.partes});
}

// Agrupa uma ParteData com sua lista de Compassos
class ParteComCompassosData {
  final ParteData parte;
  final List<CompassoComAcorde> compassos;

  ParteComCompassosData({required this.parte, required this.compassos});
}

// Agrupa um compasso (da tabela SequenciaCompassos) com seu Acorde correspondente
class CompassoComAcorde {
  final SequenciaCompasso compasso;
  final AcordeData acorde;

  CompassoComAcorde({required this.compasso, required this.acorde});
}
