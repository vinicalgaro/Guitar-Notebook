// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MusicasTable extends Musicas with TableInfo<$MusicasTable, MusicaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MusicasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _instrumentoMeta =
      const VerificationMeta('instrumento');
  @override
  late final GeneratedColumnWithTypeConverter<model.Instrumento, String>
      instrumento = GeneratedColumn<String>('instrumento', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<model.Instrumento>(
              $MusicasTable.$converterinstrumento);
  static const VerificationMeta _linkYoutubeMeta =
      const VerificationMeta('linkYoutube');
  @override
  late final GeneratedColumn<String> linkYoutube = GeneratedColumn<String>(
      'link_youtube', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, nome, instrumento, linkYoutube];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'musicas';
  @override
  VerificationContext validateIntegrity(Insertable<MusicaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    context.handle(_instrumentoMeta, const VerificationResult.success());
    if (data.containsKey('link_youtube')) {
      context.handle(
          _linkYoutubeMeta,
          linkYoutube.isAcceptableOrUnknown(
              data['link_youtube']!, _linkYoutubeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MusicaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MusicaData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
      instrumento: $MusicasTable.$converterinstrumento.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}instrumento'])!),
      linkYoutube: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link_youtube']),
    );
  }

  @override
  $MusicasTable createAlias(String alias) {
    return $MusicasTable(attachedDatabase, alias);
  }

  static TypeConverter<model.Instrumento, String> $converterinstrumento =
      const InstrumentoConverter();
}

class MusicaData extends DataClass implements Insertable<MusicaData> {
  final int id;
  final String nome;
  final model.Instrumento instrumento;
  final String? linkYoutube;
  const MusicaData(
      {required this.id,
      required this.nome,
      required this.instrumento,
      this.linkYoutube});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    {
      map['instrumento'] = Variable<String>(
          $MusicasTable.$converterinstrumento.toSql(instrumento));
    }
    if (!nullToAbsent || linkYoutube != null) {
      map['link_youtube'] = Variable<String>(linkYoutube);
    }
    return map;
  }

  MusicasCompanion toCompanion(bool nullToAbsent) {
    return MusicasCompanion(
      id: Value(id),
      nome: Value(nome),
      instrumento: Value(instrumento),
      linkYoutube: linkYoutube == null && nullToAbsent
          ? const Value.absent()
          : Value(linkYoutube),
    );
  }

  factory MusicaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MusicaData(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      instrumento: serializer.fromJson<model.Instrumento>(json['instrumento']),
      linkYoutube: serializer.fromJson<String?>(json['linkYoutube']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'instrumento': serializer.toJson<model.Instrumento>(instrumento),
      'linkYoutube': serializer.toJson<String?>(linkYoutube),
    };
  }

  MusicaData copyWith(
          {int? id,
          String? nome,
          model.Instrumento? instrumento,
          Value<String?> linkYoutube = const Value.absent()}) =>
      MusicaData(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        instrumento: instrumento ?? this.instrumento,
        linkYoutube: linkYoutube.present ? linkYoutube.value : this.linkYoutube,
      );
  MusicaData copyWithCompanion(MusicasCompanion data) {
    return MusicaData(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      instrumento:
          data.instrumento.present ? data.instrumento.value : this.instrumento,
      linkYoutube:
          data.linkYoutube.present ? data.linkYoutube.value : this.linkYoutube,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MusicaData(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('instrumento: $instrumento, ')
          ..write('linkYoutube: $linkYoutube')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, instrumento, linkYoutube);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MusicaData &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.instrumento == this.instrumento &&
          other.linkYoutube == this.linkYoutube);
}

class MusicasCompanion extends UpdateCompanion<MusicaData> {
  final Value<int> id;
  final Value<String> nome;
  final Value<model.Instrumento> instrumento;
  final Value<String?> linkYoutube;
  const MusicasCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.instrumento = const Value.absent(),
    this.linkYoutube = const Value.absent(),
  });
  MusicasCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required model.Instrumento instrumento,
    this.linkYoutube = const Value.absent(),
  })  : nome = Value(nome),
        instrumento = Value(instrumento);
  static Insertable<MusicaData> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<String>? instrumento,
    Expression<String>? linkYoutube,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (instrumento != null) 'instrumento': instrumento,
      if (linkYoutube != null) 'link_youtube': linkYoutube,
    });
  }

  MusicasCompanion copyWith(
      {Value<int>? id,
      Value<String>? nome,
      Value<model.Instrumento>? instrumento,
      Value<String?>? linkYoutube}) {
    return MusicasCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      instrumento: instrumento ?? this.instrumento,
      linkYoutube: linkYoutube ?? this.linkYoutube,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (instrumento.present) {
      map['instrumento'] = Variable<String>(
          $MusicasTable.$converterinstrumento.toSql(instrumento.value));
    }
    if (linkYoutube.present) {
      map['link_youtube'] = Variable<String>(linkYoutube.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MusicasCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('instrumento: $instrumento, ')
          ..write('linkYoutube: $linkYoutube')
          ..write(')'))
        .toString();
  }
}

class $PartesTable extends Partes with TableInfo<$PartesTable, ParteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _musicaIdMeta =
      const VerificationMeta('musicaId');
  @override
  late final GeneratedColumn<int> musicaId = GeneratedColumn<int>(
      'musica_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES musicas (id) ON DELETE CASCADE'));
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ritmoMeta = const VerificationMeta('ritmo');
  @override
  late final GeneratedColumn<String> ritmo = GeneratedColumn<String>(
      'ritmo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sequenciaMeta =
      const VerificationMeta('sequencia');
  @override
  late final GeneratedColumn<String> sequencia = GeneratedColumn<String>(
      'sequencia', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, musicaId, nome, ritmo, sequencia];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'partes';
  @override
  VerificationContext validateIntegrity(Insertable<ParteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('musica_id')) {
      context.handle(_musicaIdMeta,
          musicaId.isAcceptableOrUnknown(data['musica_id']!, _musicaIdMeta));
    } else if (isInserting) {
      context.missing(_musicaIdMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('ritmo')) {
      context.handle(
          _ritmoMeta, ritmo.isAcceptableOrUnknown(data['ritmo']!, _ritmoMeta));
    } else if (isInserting) {
      context.missing(_ritmoMeta);
    }
    if (data.containsKey('sequencia')) {
      context.handle(_sequenciaMeta,
          sequencia.isAcceptableOrUnknown(data['sequencia']!, _sequenciaMeta));
    } else if (isInserting) {
      context.missing(_sequenciaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ParteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ParteData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      musicaId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}musica_id'])!,
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
      ritmo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ritmo'])!,
      sequencia: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sequencia'])!,
    );
  }

  @override
  $PartesTable createAlias(String alias) {
    return $PartesTable(attachedDatabase, alias);
  }
}

class ParteData extends DataClass implements Insertable<ParteData> {
  final int id;
  final int musicaId;
  final String nome;
  final String ritmo;
  final String sequencia;
  const ParteData(
      {required this.id,
      required this.musicaId,
      required this.nome,
      required this.ritmo,
      required this.sequencia});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['musica_id'] = Variable<int>(musicaId);
    map['nome'] = Variable<String>(nome);
    map['ritmo'] = Variable<String>(ritmo);
    map['sequencia'] = Variable<String>(sequencia);
    return map;
  }

  PartesCompanion toCompanion(bool nullToAbsent) {
    return PartesCompanion(
      id: Value(id),
      musicaId: Value(musicaId),
      nome: Value(nome),
      ritmo: Value(ritmo),
      sequencia: Value(sequencia),
    );
  }

  factory ParteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ParteData(
      id: serializer.fromJson<int>(json['id']),
      musicaId: serializer.fromJson<int>(json['musicaId']),
      nome: serializer.fromJson<String>(json['nome']),
      ritmo: serializer.fromJson<String>(json['ritmo']),
      sequencia: serializer.fromJson<String>(json['sequencia']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'musicaId': serializer.toJson<int>(musicaId),
      'nome': serializer.toJson<String>(nome),
      'ritmo': serializer.toJson<String>(ritmo),
      'sequencia': serializer.toJson<String>(sequencia),
    };
  }

  ParteData copyWith(
          {int? id,
          int? musicaId,
          String? nome,
          String? ritmo,
          String? sequencia}) =>
      ParteData(
        id: id ?? this.id,
        musicaId: musicaId ?? this.musicaId,
        nome: nome ?? this.nome,
        ritmo: ritmo ?? this.ritmo,
        sequencia: sequencia ?? this.sequencia,
      );
  ParteData copyWithCompanion(PartesCompanion data) {
    return ParteData(
      id: data.id.present ? data.id.value : this.id,
      musicaId: data.musicaId.present ? data.musicaId.value : this.musicaId,
      nome: data.nome.present ? data.nome.value : this.nome,
      ritmo: data.ritmo.present ? data.ritmo.value : this.ritmo,
      sequencia: data.sequencia.present ? data.sequencia.value : this.sequencia,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ParteData(')
          ..write('id: $id, ')
          ..write('musicaId: $musicaId, ')
          ..write('nome: $nome, ')
          ..write('ritmo: $ritmo, ')
          ..write('sequencia: $sequencia')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, musicaId, nome, ritmo, sequencia);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParteData &&
          other.id == this.id &&
          other.musicaId == this.musicaId &&
          other.nome == this.nome &&
          other.ritmo == this.ritmo &&
          other.sequencia == this.sequencia);
}

class PartesCompanion extends UpdateCompanion<ParteData> {
  final Value<int> id;
  final Value<int> musicaId;
  final Value<String> nome;
  final Value<String> ritmo;
  final Value<String> sequencia;
  const PartesCompanion({
    this.id = const Value.absent(),
    this.musicaId = const Value.absent(),
    this.nome = const Value.absent(),
    this.ritmo = const Value.absent(),
    this.sequencia = const Value.absent(),
  });
  PartesCompanion.insert({
    this.id = const Value.absent(),
    required int musicaId,
    required String nome,
    required String ritmo,
    required String sequencia,
  })  : musicaId = Value(musicaId),
        nome = Value(nome),
        ritmo = Value(ritmo),
        sequencia = Value(sequencia);
  static Insertable<ParteData> custom({
    Expression<int>? id,
    Expression<int>? musicaId,
    Expression<String>? nome,
    Expression<String>? ritmo,
    Expression<String>? sequencia,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (musicaId != null) 'musica_id': musicaId,
      if (nome != null) 'nome': nome,
      if (ritmo != null) 'ritmo': ritmo,
      if (sequencia != null) 'sequencia': sequencia,
    });
  }

  PartesCompanion copyWith(
      {Value<int>? id,
      Value<int>? musicaId,
      Value<String>? nome,
      Value<String>? ritmo,
      Value<String>? sequencia}) {
    return PartesCompanion(
      id: id ?? this.id,
      musicaId: musicaId ?? this.musicaId,
      nome: nome ?? this.nome,
      ritmo: ritmo ?? this.ritmo,
      sequencia: sequencia ?? this.sequencia,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (musicaId.present) {
      map['musica_id'] = Variable<int>(musicaId.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (ritmo.present) {
      map['ritmo'] = Variable<String>(ritmo.value);
    }
    if (sequencia.present) {
      map['sequencia'] = Variable<String>(sequencia.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartesCompanion(')
          ..write('id: $id, ')
          ..write('musicaId: $musicaId, ')
          ..write('nome: $nome, ')
          ..write('ritmo: $ritmo, ')
          ..write('sequencia: $sequencia')
          ..write(')'))
        .toString();
  }
}

class $AcordesTable extends Acordes with TableInfo<$AcordesTable, AcordeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AcordesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tipoMeta = const VerificationMeta('tipo');
  @override
  late final GeneratedColumnWithTypeConverter<model.TipoAcorde, String> tipo =
      GeneratedColumn<String>('tipo', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<model.TipoAcorde>($AcordesTable.$convertertipo);
  static const VerificationMeta _cordasMeta = const VerificationMeta('cordas');
  @override
  late final GeneratedColumn<int> cordas = GeneratedColumn<int>(
      'cordas', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _posicoesMeta =
      const VerificationMeta('posicoes');
  @override
  late final GeneratedColumnWithTypeConverter<model.Posicoes, String> posicoes =
      GeneratedColumn<String>('posicoes_json', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<model.Posicoes>($AcordesTable.$converterposicoes);
  @override
  List<GeneratedColumn> get $columns => [id, nome, tipo, cordas, posicoes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'acordes';
  @override
  VerificationContext validateIntegrity(Insertable<AcordeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    context.handle(_tipoMeta, const VerificationResult.success());
    if (data.containsKey('cordas')) {
      context.handle(_cordasMeta,
          cordas.isAcceptableOrUnknown(data['cordas']!, _cordasMeta));
    } else if (isInserting) {
      context.missing(_cordasMeta);
    }
    context.handle(_posicoesMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {nome, cordas},
      ];
  @override
  AcordeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AcordeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
      tipo: $AcordesTable.$convertertipo.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tipo'])!),
      cordas: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cordas'])!,
      posicoes: $AcordesTable.$converterposicoes.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}posicoes_json'])!),
    );
  }

  @override
  $AcordesTable createAlias(String alias) {
    return $AcordesTable(attachedDatabase, alias);
  }

  static TypeConverter<model.TipoAcorde, String> $convertertipo =
      const TipoAcordeConverter();
  static TypeConverter<model.Posicoes, String> $converterposicoes =
      const PosicoesConverter();
}

class AcordeData extends DataClass implements Insertable<AcordeData> {
  final int id;
  final String nome;
  final model.TipoAcorde tipo;
  final int cordas;
  final model.Posicoes posicoes;
  const AcordeData(
      {required this.id,
      required this.nome,
      required this.tipo,
      required this.cordas,
      required this.posicoes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    {
      map['tipo'] = Variable<String>($AcordesTable.$convertertipo.toSql(tipo));
    }
    map['cordas'] = Variable<int>(cordas);
    {
      map['posicoes_json'] =
          Variable<String>($AcordesTable.$converterposicoes.toSql(posicoes));
    }
    return map;
  }

  AcordesCompanion toCompanion(bool nullToAbsent) {
    return AcordesCompanion(
      id: Value(id),
      nome: Value(nome),
      tipo: Value(tipo),
      cordas: Value(cordas),
      posicoes: Value(posicoes),
    );
  }

  factory AcordeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AcordeData(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      tipo: serializer.fromJson<model.TipoAcorde>(json['tipo']),
      cordas: serializer.fromJson<int>(json['cordas']),
      posicoes: serializer.fromJson<model.Posicoes>(json['posicoes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'tipo': serializer.toJson<model.TipoAcorde>(tipo),
      'cordas': serializer.toJson<int>(cordas),
      'posicoes': serializer.toJson<model.Posicoes>(posicoes),
    };
  }

  AcordeData copyWith(
          {int? id,
          String? nome,
          model.TipoAcorde? tipo,
          int? cordas,
          model.Posicoes? posicoes}) =>
      AcordeData(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        tipo: tipo ?? this.tipo,
        cordas: cordas ?? this.cordas,
        posicoes: posicoes ?? this.posicoes,
      );
  AcordeData copyWithCompanion(AcordesCompanion data) {
    return AcordeData(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      tipo: data.tipo.present ? data.tipo.value : this.tipo,
      cordas: data.cordas.present ? data.cordas.value : this.cordas,
      posicoes: data.posicoes.present ? data.posicoes.value : this.posicoes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AcordeData(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('tipo: $tipo, ')
          ..write('cordas: $cordas, ')
          ..write('posicoes: $posicoes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, tipo, cordas, posicoes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AcordeData &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.tipo == this.tipo &&
          other.cordas == this.cordas &&
          other.posicoes == this.posicoes);
}

class AcordesCompanion extends UpdateCompanion<AcordeData> {
  final Value<int> id;
  final Value<String> nome;
  final Value<model.TipoAcorde> tipo;
  final Value<int> cordas;
  final Value<model.Posicoes> posicoes;
  const AcordesCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.tipo = const Value.absent(),
    this.cordas = const Value.absent(),
    this.posicoes = const Value.absent(),
  });
  AcordesCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required model.TipoAcorde tipo,
    required int cordas,
    required model.Posicoes posicoes,
  })  : nome = Value(nome),
        tipo = Value(tipo),
        cordas = Value(cordas),
        posicoes = Value(posicoes);
  static Insertable<AcordeData> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<String>? tipo,
    Expression<int>? cordas,
    Expression<String>? posicoes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (tipo != null) 'tipo': tipo,
      if (cordas != null) 'cordas': cordas,
      if (posicoes != null) 'posicoes_json': posicoes,
    });
  }

  AcordesCompanion copyWith(
      {Value<int>? id,
      Value<String>? nome,
      Value<model.TipoAcorde>? tipo,
      Value<int>? cordas,
      Value<model.Posicoes>? posicoes}) {
    return AcordesCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      tipo: tipo ?? this.tipo,
      cordas: cordas ?? this.cordas,
      posicoes: posicoes ?? this.posicoes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (tipo.present) {
      map['tipo'] =
          Variable<String>($AcordesTable.$convertertipo.toSql(tipo.value));
    }
    if (cordas.present) {
      map['cordas'] = Variable<int>(cordas.value);
    }
    if (posicoes.present) {
      map['posicoes_json'] = Variable<String>(
          $AcordesTable.$converterposicoes.toSql(posicoes.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AcordesCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('tipo: $tipo, ')
          ..write('cordas: $cordas, ')
          ..write('posicoes: $posicoes')
          ..write(')'))
        .toString();
  }
}

class $SequenciaCompassosTable extends SequenciaCompassos
    with TableInfo<$SequenciaCompassosTable, SequenciaCompasso> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SequenciaCompassosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _parteIdMeta =
      const VerificationMeta('parteId');
  @override
  late final GeneratedColumn<int> parteId = GeneratedColumn<int>(
      'parte_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES partes (id) ON DELETE CASCADE'));
  static const VerificationMeta _acordeIdMeta =
      const VerificationMeta('acordeId');
  @override
  late final GeneratedColumn<int> acordeId = GeneratedColumn<int>(
      'acorde_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES acordes (id)'));
  static const VerificationMeta _vezesMeta = const VerificationMeta('vezes');
  @override
  late final GeneratedColumn<int> vezes = GeneratedColumn<int>(
      'vezes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ordemMeta = const VerificationMeta('ordem');
  @override
  late final GeneratedColumn<int> ordem = GeneratedColumn<int>(
      'ordem', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, parteId, acordeId, vezes, ordem];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sequencia_compassos';
  @override
  VerificationContext validateIntegrity(Insertable<SequenciaCompasso> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parte_id')) {
      context.handle(_parteIdMeta,
          parteId.isAcceptableOrUnknown(data['parte_id']!, _parteIdMeta));
    } else if (isInserting) {
      context.missing(_parteIdMeta);
    }
    if (data.containsKey('acorde_id')) {
      context.handle(_acordeIdMeta,
          acordeId.isAcceptableOrUnknown(data['acorde_id']!, _acordeIdMeta));
    } else if (isInserting) {
      context.missing(_acordeIdMeta);
    }
    if (data.containsKey('vezes')) {
      context.handle(
          _vezesMeta, vezes.isAcceptableOrUnknown(data['vezes']!, _vezesMeta));
    } else if (isInserting) {
      context.missing(_vezesMeta);
    }
    if (data.containsKey('ordem')) {
      context.handle(
          _ordemMeta, ordem.isAcceptableOrUnknown(data['ordem']!, _ordemMeta));
    } else if (isInserting) {
      context.missing(_ordemMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SequenciaCompasso map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SequenciaCompasso(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      parteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parte_id'])!,
      acordeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}acorde_id'])!,
      vezes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vezes'])!,
      ordem: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ordem'])!,
    );
  }

  @override
  $SequenciaCompassosTable createAlias(String alias) {
    return $SequenciaCompassosTable(attachedDatabase, alias);
  }
}

class SequenciaCompasso extends DataClass
    implements Insertable<SequenciaCompasso> {
  final int id;
  final int parteId;
  final int acordeId;
  final int vezes;
  final int ordem;
  const SequenciaCompasso(
      {required this.id,
      required this.parteId,
      required this.acordeId,
      required this.vezes,
      required this.ordem});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['parte_id'] = Variable<int>(parteId);
    map['acorde_id'] = Variable<int>(acordeId);
    map['vezes'] = Variable<int>(vezes);
    map['ordem'] = Variable<int>(ordem);
    return map;
  }

  SequenciaCompassosCompanion toCompanion(bool nullToAbsent) {
    return SequenciaCompassosCompanion(
      id: Value(id),
      parteId: Value(parteId),
      acordeId: Value(acordeId),
      vezes: Value(vezes),
      ordem: Value(ordem),
    );
  }

  factory SequenciaCompasso.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SequenciaCompasso(
      id: serializer.fromJson<int>(json['id']),
      parteId: serializer.fromJson<int>(json['parteId']),
      acordeId: serializer.fromJson<int>(json['acordeId']),
      vezes: serializer.fromJson<int>(json['vezes']),
      ordem: serializer.fromJson<int>(json['ordem']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parteId': serializer.toJson<int>(parteId),
      'acordeId': serializer.toJson<int>(acordeId),
      'vezes': serializer.toJson<int>(vezes),
      'ordem': serializer.toJson<int>(ordem),
    };
  }

  SequenciaCompasso copyWith(
          {int? id, int? parteId, int? acordeId, int? vezes, int? ordem}) =>
      SequenciaCompasso(
        id: id ?? this.id,
        parteId: parteId ?? this.parteId,
        acordeId: acordeId ?? this.acordeId,
        vezes: vezes ?? this.vezes,
        ordem: ordem ?? this.ordem,
      );
  SequenciaCompasso copyWithCompanion(SequenciaCompassosCompanion data) {
    return SequenciaCompasso(
      id: data.id.present ? data.id.value : this.id,
      parteId: data.parteId.present ? data.parteId.value : this.parteId,
      acordeId: data.acordeId.present ? data.acordeId.value : this.acordeId,
      vezes: data.vezes.present ? data.vezes.value : this.vezes,
      ordem: data.ordem.present ? data.ordem.value : this.ordem,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SequenciaCompasso(')
          ..write('id: $id, ')
          ..write('parteId: $parteId, ')
          ..write('acordeId: $acordeId, ')
          ..write('vezes: $vezes, ')
          ..write('ordem: $ordem')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, parteId, acordeId, vezes, ordem);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SequenciaCompasso &&
          other.id == this.id &&
          other.parteId == this.parteId &&
          other.acordeId == this.acordeId &&
          other.vezes == this.vezes &&
          other.ordem == this.ordem);
}

class SequenciaCompassosCompanion extends UpdateCompanion<SequenciaCompasso> {
  final Value<int> id;
  final Value<int> parteId;
  final Value<int> acordeId;
  final Value<int> vezes;
  final Value<int> ordem;
  const SequenciaCompassosCompanion({
    this.id = const Value.absent(),
    this.parteId = const Value.absent(),
    this.acordeId = const Value.absent(),
    this.vezes = const Value.absent(),
    this.ordem = const Value.absent(),
  });
  SequenciaCompassosCompanion.insert({
    this.id = const Value.absent(),
    required int parteId,
    required int acordeId,
    required int vezes,
    required int ordem,
  })  : parteId = Value(parteId),
        acordeId = Value(acordeId),
        vezes = Value(vezes),
        ordem = Value(ordem);
  static Insertable<SequenciaCompasso> custom({
    Expression<int>? id,
    Expression<int>? parteId,
    Expression<int>? acordeId,
    Expression<int>? vezes,
    Expression<int>? ordem,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parteId != null) 'parte_id': parteId,
      if (acordeId != null) 'acorde_id': acordeId,
      if (vezes != null) 'vezes': vezes,
      if (ordem != null) 'ordem': ordem,
    });
  }

  SequenciaCompassosCompanion copyWith(
      {Value<int>? id,
      Value<int>? parteId,
      Value<int>? acordeId,
      Value<int>? vezes,
      Value<int>? ordem}) {
    return SequenciaCompassosCompanion(
      id: id ?? this.id,
      parteId: parteId ?? this.parteId,
      acordeId: acordeId ?? this.acordeId,
      vezes: vezes ?? this.vezes,
      ordem: ordem ?? this.ordem,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parteId.present) {
      map['parte_id'] = Variable<int>(parteId.value);
    }
    if (acordeId.present) {
      map['acorde_id'] = Variable<int>(acordeId.value);
    }
    if (vezes.present) {
      map['vezes'] = Variable<int>(vezes.value);
    }
    if (ordem.present) {
      map['ordem'] = Variable<int>(ordem.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SequenciaCompassosCompanion(')
          ..write('id: $id, ')
          ..write('parteId: $parteId, ')
          ..write('acordeId: $acordeId, ')
          ..write('vezes: $vezes, ')
          ..write('ordem: $ordem')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MusicasTable musicas = $MusicasTable(this);
  late final $PartesTable partes = $PartesTable(this);
  late final $AcordesTable acordes = $AcordesTable(this);
  late final $SequenciaCompassosTable sequenciaCompassos =
      $SequenciaCompassosTable(this);
  late final MusicasDao musicasDao = MusicasDao(this as AppDatabase);
  late final AcordesDao acordesDao = AcordesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [musicas, partes, acordes, sequenciaCompassos];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('musicas',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('partes', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('partes',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('sequencia_compassos', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$MusicasTableCreateCompanionBuilder = MusicasCompanion Function({
  Value<int> id,
  required String nome,
  required model.Instrumento instrumento,
  Value<String?> linkYoutube,
});
typedef $$MusicasTableUpdateCompanionBuilder = MusicasCompanion Function({
  Value<int> id,
  Value<String> nome,
  Value<model.Instrumento> instrumento,
  Value<String?> linkYoutube,
});

class $$MusicasTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MusicasTable,
    MusicaData,
    $$MusicasTableFilterComposer,
    $$MusicasTableOrderingComposer,
    $$MusicasTableCreateCompanionBuilder,
    $$MusicasTableUpdateCompanionBuilder> {
  $$MusicasTableTableManager(_$AppDatabase db, $MusicasTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MusicasTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MusicasTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nome = const Value.absent(),
            Value<model.Instrumento> instrumento = const Value.absent(),
            Value<String?> linkYoutube = const Value.absent(),
          }) =>
              MusicasCompanion(
            id: id,
            nome: nome,
            instrumento: instrumento,
            linkYoutube: linkYoutube,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nome,
            required model.Instrumento instrumento,
            Value<String?> linkYoutube = const Value.absent(),
          }) =>
              MusicasCompanion.insert(
            id: id,
            nome: nome,
            instrumento: instrumento,
            linkYoutube: linkYoutube,
          ),
        ));
}

class $$MusicasTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MusicasTable> {
  $$MusicasTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nome => $state.composableBuilder(
      column: $state.table.nome,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<model.Instrumento, model.Instrumento, String>
      get instrumento => $state.composableBuilder(
          column: $state.table.instrumento,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<String> get linkYoutube => $state.composableBuilder(
      column: $state.table.linkYoutube,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter partesRefs(
      ComposableFilter Function($$PartesTableFilterComposer f) f) {
    final $$PartesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.partes,
        getReferencedColumn: (t) => t.musicaId,
        builder: (joinBuilder, parentComposers) => $$PartesTableFilterComposer(
            ComposerState(
                $state.db, $state.db.partes, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$MusicasTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MusicasTable> {
  $$MusicasTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nome => $state.composableBuilder(
      column: $state.table.nome,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get instrumento => $state.composableBuilder(
      column: $state.table.instrumento,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get linkYoutube => $state.composableBuilder(
      column: $state.table.linkYoutube,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$PartesTableCreateCompanionBuilder = PartesCompanion Function({
  Value<int> id,
  required int musicaId,
  required String nome,
  required String ritmo,
  required String sequencia,
});
typedef $$PartesTableUpdateCompanionBuilder = PartesCompanion Function({
  Value<int> id,
  Value<int> musicaId,
  Value<String> nome,
  Value<String> ritmo,
  Value<String> sequencia,
});

class $$PartesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PartesTable,
    ParteData,
    $$PartesTableFilterComposer,
    $$PartesTableOrderingComposer,
    $$PartesTableCreateCompanionBuilder,
    $$PartesTableUpdateCompanionBuilder> {
  $$PartesTableTableManager(_$AppDatabase db, $PartesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PartesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PartesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> musicaId = const Value.absent(),
            Value<String> nome = const Value.absent(),
            Value<String> ritmo = const Value.absent(),
            Value<String> sequencia = const Value.absent(),
          }) =>
              PartesCompanion(
            id: id,
            musicaId: musicaId,
            nome: nome,
            ritmo: ritmo,
            sequencia: sequencia,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int musicaId,
            required String nome,
            required String ritmo,
            required String sequencia,
          }) =>
              PartesCompanion.insert(
            id: id,
            musicaId: musicaId,
            nome: nome,
            ritmo: ritmo,
            sequencia: sequencia,
          ),
        ));
}

class $$PartesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PartesTable> {
  $$PartesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nome => $state.composableBuilder(
      column: $state.table.nome,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get ritmo => $state.composableBuilder(
      column: $state.table.ritmo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sequencia => $state.composableBuilder(
      column: $state.table.sequencia,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$MusicasTableFilterComposer get musicaId {
    final $$MusicasTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.musicaId,
        referencedTable: $state.db.musicas,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$MusicasTableFilterComposer(
            ComposerState(
                $state.db, $state.db.musicas, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter sequenciaCompassosRefs(
      ComposableFilter Function($$SequenciaCompassosTableFilterComposer f) f) {
    final $$SequenciaCompassosTableFilterComposer composer = $state
        .composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.sequenciaCompassos,
            getReferencedColumn: (t) => t.parteId,
            builder: (joinBuilder, parentComposers) =>
                $$SequenciaCompassosTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.sequenciaCompassos,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$PartesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PartesTable> {
  $$PartesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nome => $state.composableBuilder(
      column: $state.table.nome,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get ritmo => $state.composableBuilder(
      column: $state.table.ritmo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sequencia => $state.composableBuilder(
      column: $state.table.sequencia,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$MusicasTableOrderingComposer get musicaId {
    final $$MusicasTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.musicaId,
        referencedTable: $state.db.musicas,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$MusicasTableOrderingComposer(ComposerState(
                $state.db, $state.db.musicas, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$AcordesTableCreateCompanionBuilder = AcordesCompanion Function({
  Value<int> id,
  required String nome,
  required model.TipoAcorde tipo,
  required int cordas,
  required model.Posicoes posicoes,
});
typedef $$AcordesTableUpdateCompanionBuilder = AcordesCompanion Function({
  Value<int> id,
  Value<String> nome,
  Value<model.TipoAcorde> tipo,
  Value<int> cordas,
  Value<model.Posicoes> posicoes,
});

class $$AcordesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AcordesTable,
    AcordeData,
    $$AcordesTableFilterComposer,
    $$AcordesTableOrderingComposer,
    $$AcordesTableCreateCompanionBuilder,
    $$AcordesTableUpdateCompanionBuilder> {
  $$AcordesTableTableManager(_$AppDatabase db, $AcordesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AcordesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AcordesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nome = const Value.absent(),
            Value<model.TipoAcorde> tipo = const Value.absent(),
            Value<int> cordas = const Value.absent(),
            Value<model.Posicoes> posicoes = const Value.absent(),
          }) =>
              AcordesCompanion(
            id: id,
            nome: nome,
            tipo: tipo,
            cordas: cordas,
            posicoes: posicoes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String nome,
            required model.TipoAcorde tipo,
            required int cordas,
            required model.Posicoes posicoes,
          }) =>
              AcordesCompanion.insert(
            id: id,
            nome: nome,
            tipo: tipo,
            cordas: cordas,
            posicoes: posicoes,
          ),
        ));
}

class $$AcordesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AcordesTable> {
  $$AcordesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nome => $state.composableBuilder(
      column: $state.table.nome,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<model.TipoAcorde, model.TipoAcorde, String>
      get tipo => $state.composableBuilder(
          column: $state.table.tipo,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<int> get cordas => $state.composableBuilder(
      column: $state.table.cordas,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<model.Posicoes, model.Posicoes, String>
      get posicoes => $state.composableBuilder(
          column: $state.table.posicoes,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ComposableFilter sequenciaCompassosRefs(
      ComposableFilter Function($$SequenciaCompassosTableFilterComposer f) f) {
    final $$SequenciaCompassosTableFilterComposer composer = $state
        .composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.sequenciaCompassos,
            getReferencedColumn: (t) => t.acordeId,
            builder: (joinBuilder, parentComposers) =>
                $$SequenciaCompassosTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.sequenciaCompassos,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$AcordesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AcordesTable> {
  $$AcordesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nome => $state.composableBuilder(
      column: $state.table.nome,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tipo => $state.composableBuilder(
      column: $state.table.tipo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get cordas => $state.composableBuilder(
      column: $state.table.cordas,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get posicoes => $state.composableBuilder(
      column: $state.table.posicoes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SequenciaCompassosTableCreateCompanionBuilder
    = SequenciaCompassosCompanion Function({
  Value<int> id,
  required int parteId,
  required int acordeId,
  required int vezes,
  required int ordem,
});
typedef $$SequenciaCompassosTableUpdateCompanionBuilder
    = SequenciaCompassosCompanion Function({
  Value<int> id,
  Value<int> parteId,
  Value<int> acordeId,
  Value<int> vezes,
  Value<int> ordem,
});

class $$SequenciaCompassosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SequenciaCompassosTable,
    SequenciaCompasso,
    $$SequenciaCompassosTableFilterComposer,
    $$SequenciaCompassosTableOrderingComposer,
    $$SequenciaCompassosTableCreateCompanionBuilder,
    $$SequenciaCompassosTableUpdateCompanionBuilder> {
  $$SequenciaCompassosTableTableManager(
      _$AppDatabase db, $SequenciaCompassosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SequenciaCompassosTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$SequenciaCompassosTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> parteId = const Value.absent(),
            Value<int> acordeId = const Value.absent(),
            Value<int> vezes = const Value.absent(),
            Value<int> ordem = const Value.absent(),
          }) =>
              SequenciaCompassosCompanion(
            id: id,
            parteId: parteId,
            acordeId: acordeId,
            vezes: vezes,
            ordem: ordem,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int parteId,
            required int acordeId,
            required int vezes,
            required int ordem,
          }) =>
              SequenciaCompassosCompanion.insert(
            id: id,
            parteId: parteId,
            acordeId: acordeId,
            vezes: vezes,
            ordem: ordem,
          ),
        ));
}

class $$SequenciaCompassosTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SequenciaCompassosTable> {
  $$SequenciaCompassosTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get vezes => $state.composableBuilder(
      column: $state.table.vezes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get ordem => $state.composableBuilder(
      column: $state.table.ordem,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$PartesTableFilterComposer get parteId {
    final $$PartesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parteId,
        referencedTable: $state.db.partes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$PartesTableFilterComposer(
            ComposerState(
                $state.db, $state.db.partes, joinBuilder, parentComposers)));
    return composer;
  }

  $$AcordesTableFilterComposer get acordeId {
    final $$AcordesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.acordeId,
        referencedTable: $state.db.acordes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$AcordesTableFilterComposer(
            ComposerState(
                $state.db, $state.db.acordes, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$SequenciaCompassosTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SequenciaCompassosTable> {
  $$SequenciaCompassosTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get vezes => $state.composableBuilder(
      column: $state.table.vezes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get ordem => $state.composableBuilder(
      column: $state.table.ordem,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$PartesTableOrderingComposer get parteId {
    final $$PartesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parteId,
        referencedTable: $state.db.partes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$PartesTableOrderingComposer(ComposerState(
                $state.db, $state.db.partes, joinBuilder, parentComposers)));
    return composer;
  }

  $$AcordesTableOrderingComposer get acordeId {
    final $$AcordesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.acordeId,
        referencedTable: $state.db.acordes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$AcordesTableOrderingComposer(ComposerState(
                $state.db, $state.db.acordes, joinBuilder, parentComposers)));
    return composer;
  }
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MusicasTableTableManager get musicas =>
      $$MusicasTableTableManager(_db, _db.musicas);
  $$PartesTableTableManager get partes =>
      $$PartesTableTableManager(_db, _db.partes);
  $$AcordesTableTableManager get acordes =>
      $$AcordesTableTableManager(_db, _db.acordes);
  $$SequenciaCompassosTableTableManager get sequenciaCompassos =>
      $$SequenciaCompassosTableTableManager(_db, _db.sequenciaCompassos);
}

mixin _$MusicasDaoMixin on DatabaseAccessor<AppDatabase> {
  $MusicasTable get musicas => attachedDatabase.musicas;
  $PartesTable get partes => attachedDatabase.partes;
  $AcordesTable get acordes => attachedDatabase.acordes;
  $SequenciaCompassosTable get sequenciaCompassos =>
      attachedDatabase.sequenciaCompassos;
}
mixin _$AcordesDaoMixin on DatabaseAccessor<AppDatabase> {
  $AcordesTable get acordes => attachedDatabase.acordes;
}
