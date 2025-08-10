import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'package:guitar_notebook/helpers/get_from_assets.dart';
import 'package:guitar_notebook/model/musica/models.dart' as model;

import 'connection/unsupported.dart'
if (dart.library.html) 'connection/web.dart'
if (dart.library.io) 'connection/native.dart';

part 'dao/acordes_dao.dart';
part 'dao/musicas_dao.dart';
part 'database.g.dart';

class TipoAcordeConverter extends TypeConverter<model.TipoAcorde, String> {
  const TipoAcordeConverter();

  @override
  model.TipoAcorde fromSql(String fromDb) =>
      model.TipoAcorde.values.byName(fromDb);

  @override
  String toSql(model.TipoAcorde value) => value.name;
}

class InstrumentoConverter extends TypeConverter<model.Instrumento, String> {
  const InstrumentoConverter();

  @override
  model.Instrumento fromSql(String fromDb) =>
      model.Instrumento.values.byName(fromDb);

  @override
  String toSql(model.Instrumento value) => value.name;
}

class PosicoesConverter extends TypeConverter<model.Posicoes, String> {
  const PosicoesConverter();

  @override
  model.Posicoes fromSql(String fromDb) =>
      model.Posicoes.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);

  @override
  String toSql(model.Posicoes value) => jsonEncode(value.toJson());
}

@DataClassName('AcordeData')
class Acordes extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get nome => text().unique()(); // Ex: "C", "Am"

  TextColumn get tipo => text().map(const TipoAcordeConverter())();
}

@DataClassName('AfinacaoData')
class Afinacoes extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get nome => text()(); // Ex: "Padrão", "Drop D"

  TextColumn get instrumento => text().map(const InstrumentoConverter())();

  TextColumn get notas => text()(); // Ex: "EADGBe"
}

@DataClassName('DigitacaoData')
class Digitacoes extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get acordeId =>
      integer().references(Acordes, #id, onDelete: KeyAction.cascade)();

  IntColumn get afinacaoId =>
      integer().references(Afinacoes, #id, onDelete: KeyAction.cascade)();

  TextColumn get posicoes =>
      text().named('posicoes_json').map(const PosicoesConverter())();
}

@DataClassName('MusicaData')
class Musicas extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get nome => text()();

  TextColumn get instrumento => text().map(const InstrumentoConverter())();

  IntColumn get afinacaoId => integer().references(Afinacoes, #id)();

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
  tables: [Musicas, Partes, Acordes, Afinacoes, Digitacoes, SequenciaCompassos],
  daos: [MusicasDao, AcordesDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();

        final jsonString = await rootBundle.loadString(
          getDataFromAssets('initial_chords.json'),
        );
        final Map<String, dynamic> data = jsonDecode(jsonString);

        // 1. Popula as Afinacoes
        final List<dynamic> afinacoesJson = data['afinacoes'];
        final afinacoesParaSalvar = afinacoesJson.map((json) {
          return AfinacoesCompanion.insert(
            nome: json['nome'] as String,
            instrumento: model.Instrumento.values.byName(json['instrumento']),
            notas: json['notas'] as String,
          );
        }).toList();
        await batch((b) => b.insertAll(afinacoes, afinacoesParaSalvar));

        // 2. Popula os Acordes
        final List<dynamic> acordesJson = data['acordes'];
        final acordesParaSalvar = acordesJson.map((json) {
          return AcordesCompanion.insert(
            nome: json['nome'] as String,
            tipo: model.TipoAcorde.values.byName(json['tipo']),
          );
        }).toList();
        await batch((b) => b.insertAll(acordes, acordesParaSalvar));

        // 3. Popula as Digitações
        final List<dynamic> digitacoesJson = data['digitacoes'];
        final digitacoesParaSalvar = digitacoesJson.map((json) {
          return DigitacoesCompanion.insert(
            acordeId: json['acorde_id'] as int,
            afinacaoId: json['afinacao_id'] as int,
            posicoes: model.Posicoes.fromJson(json['posicoes_json']),
          );
        }).toList();
        await batch((b) => b.insertAll(digitacoes, digitacoesParaSalvar));
      },
      onUpgrade: (m, from, to) async {
        if (from < 2) {
          for (final table in allTables) {
            await m.deleteTable(table.actualTableName);
            await m.createAll();
          }
        }
      },
    );
  }
}

class MusicaCompletaData {
  final MusicaData musica;
  final List<ParteComCompassosData> partes;

  MusicaCompletaData({required this.musica, required this.partes});
}

class ParteComCompassosData {
  final ParteData parte;
  final List<CompassoComAcorde> compassos;

  ParteComCompassosData({required this.parte, required this.compassos});
}

class CompassoComAcorde {
  final SequenciaCompasso compasso;
  final AcordeData acorde;
  final DigitacaoData? digitacao;

  CompassoComAcorde({
    required this.digitacao,
    required this.compasso,
    required this.acorde,
  });
}
