// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AfinacoesTable extends Afinacoes
    with TableInfo<$AfinacoesTable, AfinacaoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AfinacoesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<model.Instrumento, String>
  instrumento = GeneratedColumn<String>(
    'instrumento',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<model.Instrumento>($AfinacoesTable.$converterinstrumento);
  static const VerificationMeta _notasMeta = const VerificationMeta('notas');
  @override
  late final GeneratedColumn<String> notas = GeneratedColumn<String>(
    'notas',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nome, instrumento, notas];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'afinacoes';
  @override
  VerificationContext validateIntegrity(
    Insertable<AfinacaoData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('notas')) {
      context.handle(
        _notasMeta,
        notas.isAcceptableOrUnknown(data['notas']!, _notasMeta),
      );
    } else if (isInserting) {
      context.missing(_notasMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AfinacaoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AfinacaoData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      instrumento: $AfinacoesTable.$converterinstrumento.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}instrumento'],
        )!,
      ),
      notas: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notas'],
      )!,
    );
  }

  @override
  $AfinacoesTable createAlias(String alias) {
    return $AfinacoesTable(attachedDatabase, alias);
  }

  static TypeConverter<model.Instrumento, String> $converterinstrumento =
      const InstrumentoConverter();
}

class AfinacaoData extends DataClass implements Insertable<AfinacaoData> {
  final int id;
  final String nome;
  final model.Instrumento instrumento;
  final String notas;
  const AfinacaoData({
    required this.id,
    required this.nome,
    required this.instrumento,
    required this.notas,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    {
      map['instrumento'] = Variable<String>(
        $AfinacoesTable.$converterinstrumento.toSql(instrumento),
      );
    }
    map['notas'] = Variable<String>(notas);
    return map;
  }

  AfinacoesCompanion toCompanion(bool nullToAbsent) {
    return AfinacoesCompanion(
      id: Value(id),
      nome: Value(nome),
      instrumento: Value(instrumento),
      notas: Value(notas),
    );
  }

  factory AfinacaoData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AfinacaoData(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      instrumento: serializer.fromJson<model.Instrumento>(json['instrumento']),
      notas: serializer.fromJson<String>(json['notas']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'instrumento': serializer.toJson<model.Instrumento>(instrumento),
      'notas': serializer.toJson<String>(notas),
    };
  }

  AfinacaoData copyWith({
    int? id,
    String? nome,
    model.Instrumento? instrumento,
    String? notas,
  }) => AfinacaoData(
    id: id ?? this.id,
    nome: nome ?? this.nome,
    instrumento: instrumento ?? this.instrumento,
    notas: notas ?? this.notas,
  );
  AfinacaoData copyWithCompanion(AfinacoesCompanion data) {
    return AfinacaoData(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      instrumento: data.instrumento.present
          ? data.instrumento.value
          : this.instrumento,
      notas: data.notas.present ? data.notas.value : this.notas,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AfinacaoData(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('instrumento: $instrumento, ')
          ..write('notas: $notas')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, instrumento, notas);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AfinacaoData &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.instrumento == this.instrumento &&
          other.notas == this.notas);
}

class AfinacoesCompanion extends UpdateCompanion<AfinacaoData> {
  final Value<int> id;
  final Value<String> nome;
  final Value<model.Instrumento> instrumento;
  final Value<String> notas;
  const AfinacoesCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.instrumento = const Value.absent(),
    this.notas = const Value.absent(),
  });
  AfinacoesCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required model.Instrumento instrumento,
    required String notas,
  }) : nome = Value(nome),
       instrumento = Value(instrumento),
       notas = Value(notas);
  static Insertable<AfinacaoData> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<String>? instrumento,
    Expression<String>? notas,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (instrumento != null) 'instrumento': instrumento,
      if (notas != null) 'notas': notas,
    });
  }

  AfinacoesCompanion copyWith({
    Value<int>? id,
    Value<String>? nome,
    Value<model.Instrumento>? instrumento,
    Value<String>? notas,
  }) {
    return AfinacoesCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      instrumento: instrumento ?? this.instrumento,
      notas: notas ?? this.notas,
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
        $AfinacoesTable.$converterinstrumento.toSql(instrumento.value),
      );
    }
    if (notas.present) {
      map['notas'] = Variable<String>(notas.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AfinacoesCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('instrumento: $instrumento, ')
          ..write('notas: $notas')
          ..write(')'))
        .toString();
  }
}

class $MusicasTable extends Musicas with TableInfo<$MusicasTable, MusicaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MusicasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<model.Instrumento, String>
  instrumento = GeneratedColumn<String>(
    'instrumento',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<model.Instrumento>($MusicasTable.$converterinstrumento);
  static const VerificationMeta _afinacaoIdMeta = const VerificationMeta(
    'afinacaoId',
  );
  @override
  late final GeneratedColumn<int> afinacaoId = GeneratedColumn<int>(
    'afinacao_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES afinacoes (id)',
    ),
  );
  static const VerificationMeta _linkYoutubeMeta = const VerificationMeta(
    'linkYoutube',
  );
  @override
  late final GeneratedColumn<String> linkYoutube = GeneratedColumn<String>(
    'link_youtube',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nome,
    instrumento,
    afinacaoId,
    linkYoutube,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'musicas';
  @override
  VerificationContext validateIntegrity(
    Insertable<MusicaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('afinacao_id')) {
      context.handle(
        _afinacaoIdMeta,
        afinacaoId.isAcceptableOrUnknown(data['afinacao_id']!, _afinacaoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_afinacaoIdMeta);
    }
    if (data.containsKey('link_youtube')) {
      context.handle(
        _linkYoutubeMeta,
        linkYoutube.isAcceptableOrUnknown(
          data['link_youtube']!,
          _linkYoutubeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MusicaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MusicaData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      instrumento: $MusicasTable.$converterinstrumento.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}instrumento'],
        )!,
      ),
      afinacaoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}afinacao_id'],
      )!,
      linkYoutube: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}link_youtube'],
      ),
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
  final int afinacaoId;
  final String? linkYoutube;
  const MusicaData({
    required this.id,
    required this.nome,
    required this.instrumento,
    required this.afinacaoId,
    this.linkYoutube,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    {
      map['instrumento'] = Variable<String>(
        $MusicasTable.$converterinstrumento.toSql(instrumento),
      );
    }
    map['afinacao_id'] = Variable<int>(afinacaoId);
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
      afinacaoId: Value(afinacaoId),
      linkYoutube: linkYoutube == null && nullToAbsent
          ? const Value.absent()
          : Value(linkYoutube),
    );
  }

  factory MusicaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MusicaData(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      instrumento: serializer.fromJson<model.Instrumento>(json['instrumento']),
      afinacaoId: serializer.fromJson<int>(json['afinacaoId']),
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
      'afinacaoId': serializer.toJson<int>(afinacaoId),
      'linkYoutube': serializer.toJson<String?>(linkYoutube),
    };
  }

  MusicaData copyWith({
    int? id,
    String? nome,
    model.Instrumento? instrumento,
    int? afinacaoId,
    Value<String?> linkYoutube = const Value.absent(),
  }) => MusicaData(
    id: id ?? this.id,
    nome: nome ?? this.nome,
    instrumento: instrumento ?? this.instrumento,
    afinacaoId: afinacaoId ?? this.afinacaoId,
    linkYoutube: linkYoutube.present ? linkYoutube.value : this.linkYoutube,
  );
  MusicaData copyWithCompanion(MusicasCompanion data) {
    return MusicaData(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      instrumento: data.instrumento.present
          ? data.instrumento.value
          : this.instrumento,
      afinacaoId: data.afinacaoId.present
          ? data.afinacaoId.value
          : this.afinacaoId,
      linkYoutube: data.linkYoutube.present
          ? data.linkYoutube.value
          : this.linkYoutube,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MusicaData(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('instrumento: $instrumento, ')
          ..write('afinacaoId: $afinacaoId, ')
          ..write('linkYoutube: $linkYoutube')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, nome, instrumento, afinacaoId, linkYoutube);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MusicaData &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.instrumento == this.instrumento &&
          other.afinacaoId == this.afinacaoId &&
          other.linkYoutube == this.linkYoutube);
}

class MusicasCompanion extends UpdateCompanion<MusicaData> {
  final Value<int> id;
  final Value<String> nome;
  final Value<model.Instrumento> instrumento;
  final Value<int> afinacaoId;
  final Value<String?> linkYoutube;
  const MusicasCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.instrumento = const Value.absent(),
    this.afinacaoId = const Value.absent(),
    this.linkYoutube = const Value.absent(),
  });
  MusicasCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required model.Instrumento instrumento,
    required int afinacaoId,
    this.linkYoutube = const Value.absent(),
  }) : nome = Value(nome),
       instrumento = Value(instrumento),
       afinacaoId = Value(afinacaoId);
  static Insertable<MusicaData> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<String>? instrumento,
    Expression<int>? afinacaoId,
    Expression<String>? linkYoutube,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (instrumento != null) 'instrumento': instrumento,
      if (afinacaoId != null) 'afinacao_id': afinacaoId,
      if (linkYoutube != null) 'link_youtube': linkYoutube,
    });
  }

  MusicasCompanion copyWith({
    Value<int>? id,
    Value<String>? nome,
    Value<model.Instrumento>? instrumento,
    Value<int>? afinacaoId,
    Value<String?>? linkYoutube,
  }) {
    return MusicasCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      instrumento: instrumento ?? this.instrumento,
      afinacaoId: afinacaoId ?? this.afinacaoId,
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
        $MusicasTable.$converterinstrumento.toSql(instrumento.value),
      );
    }
    if (afinacaoId.present) {
      map['afinacao_id'] = Variable<int>(afinacaoId.value);
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
          ..write('afinacaoId: $afinacaoId, ')
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _musicaIdMeta = const VerificationMeta(
    'musicaId',
  );
  @override
  late final GeneratedColumn<int> musicaId = GeneratedColumn<int>(
    'musica_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES musicas (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ritmoMeta = const VerificationMeta('ritmo');
  @override
  late final GeneratedColumn<String> ritmo = GeneratedColumn<String>(
    'ritmo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sequenciaMeta = const VerificationMeta(
    'sequencia',
  );
  @override
  late final GeneratedColumn<String> sequencia = GeneratedColumn<String>(
    'sequencia',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, musicaId, nome, ritmo, sequencia];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'partes';
  @override
  VerificationContext validateIntegrity(
    Insertable<ParteData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('musica_id')) {
      context.handle(
        _musicaIdMeta,
        musicaId.isAcceptableOrUnknown(data['musica_id']!, _musicaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_musicaIdMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('ritmo')) {
      context.handle(
        _ritmoMeta,
        ritmo.isAcceptableOrUnknown(data['ritmo']!, _ritmoMeta),
      );
    } else if (isInserting) {
      context.missing(_ritmoMeta);
    }
    if (data.containsKey('sequencia')) {
      context.handle(
        _sequenciaMeta,
        sequencia.isAcceptableOrUnknown(data['sequencia']!, _sequenciaMeta),
      );
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      musicaId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}musica_id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      ritmo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ritmo'],
      )!,
      sequencia: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sequencia'],
      )!,
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
  const ParteData({
    required this.id,
    required this.musicaId,
    required this.nome,
    required this.ritmo,
    required this.sequencia,
  });
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

  factory ParteData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  ParteData copyWith({
    int? id,
    int? musicaId,
    String? nome,
    String? ritmo,
    String? sequencia,
  }) => ParteData(
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
  }) : musicaId = Value(musicaId),
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

  PartesCompanion copyWith({
    Value<int>? id,
    Value<int>? musicaId,
    Value<String>? nome,
    Value<String>? ritmo,
    Value<String>? sequencia,
  }) {
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  late final GeneratedColumnWithTypeConverter<model.TipoAcorde, String> tipo =
      GeneratedColumn<String>(
        'tipo',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<model.TipoAcorde>($AcordesTable.$convertertipo);
  @override
  List<GeneratedColumn> get $columns => [id, nome, tipo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'acordes';
  @override
  VerificationContext validateIntegrity(
    Insertable<AcordeData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AcordeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AcordeData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      tipo: $AcordesTable.$convertertipo.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}tipo'],
        )!,
      ),
    );
  }

  @override
  $AcordesTable createAlias(String alias) {
    return $AcordesTable(attachedDatabase, alias);
  }

  static TypeConverter<model.TipoAcorde, String> $convertertipo =
      const TipoAcordeConverter();
}

class AcordeData extends DataClass implements Insertable<AcordeData> {
  final int id;
  final String nome;
  final model.TipoAcorde tipo;
  const AcordeData({required this.id, required this.nome, required this.tipo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    {
      map['tipo'] = Variable<String>($AcordesTable.$convertertipo.toSql(tipo));
    }
    return map;
  }

  AcordesCompanion toCompanion(bool nullToAbsent) {
    return AcordesCompanion(
      id: Value(id),
      nome: Value(nome),
      tipo: Value(tipo),
    );
  }

  factory AcordeData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AcordeData(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      tipo: serializer.fromJson<model.TipoAcorde>(json['tipo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'tipo': serializer.toJson<model.TipoAcorde>(tipo),
    };
  }

  AcordeData copyWith({int? id, String? nome, model.TipoAcorde? tipo}) =>
      AcordeData(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        tipo: tipo ?? this.tipo,
      );
  AcordeData copyWithCompanion(AcordesCompanion data) {
    return AcordeData(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      tipo: data.tipo.present ? data.tipo.value : this.tipo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AcordeData(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('tipo: $tipo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, tipo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AcordeData &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.tipo == this.tipo);
}

class AcordesCompanion extends UpdateCompanion<AcordeData> {
  final Value<int> id;
  final Value<String> nome;
  final Value<model.TipoAcorde> tipo;
  const AcordesCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.tipo = const Value.absent(),
  });
  AcordesCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required model.TipoAcorde tipo,
  }) : nome = Value(nome),
       tipo = Value(tipo);
  static Insertable<AcordeData> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<String>? tipo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (tipo != null) 'tipo': tipo,
    });
  }

  AcordesCompanion copyWith({
    Value<int>? id,
    Value<String>? nome,
    Value<model.TipoAcorde>? tipo,
  }) {
    return AcordesCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      tipo: tipo ?? this.tipo,
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
      map['tipo'] = Variable<String>(
        $AcordesTable.$convertertipo.toSql(tipo.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AcordesCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('tipo: $tipo')
          ..write(')'))
        .toString();
  }
}

class $DigitacoesTable extends Digitacoes
    with TableInfo<$DigitacoesTable, DigitacaoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DigitacoesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _acordeIdMeta = const VerificationMeta(
    'acordeId',
  );
  @override
  late final GeneratedColumn<int> acordeId = GeneratedColumn<int>(
    'acorde_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES acordes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _afinacaoIdMeta = const VerificationMeta(
    'afinacaoId',
  );
  @override
  late final GeneratedColumn<int> afinacaoId = GeneratedColumn<int>(
    'afinacao_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES afinacoes (id) ON DELETE CASCADE',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<model.Posicoes, String> posicoes =
      GeneratedColumn<String>(
        'posicoes_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<model.Posicoes>($DigitacoesTable.$converterposicoes);
  @override
  List<GeneratedColumn> get $columns => [id, acordeId, afinacaoId, posicoes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'digitacoes';
  @override
  VerificationContext validateIntegrity(
    Insertable<DigitacaoData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('acorde_id')) {
      context.handle(
        _acordeIdMeta,
        acordeId.isAcceptableOrUnknown(data['acorde_id']!, _acordeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_acordeIdMeta);
    }
    if (data.containsKey('afinacao_id')) {
      context.handle(
        _afinacaoIdMeta,
        afinacaoId.isAcceptableOrUnknown(data['afinacao_id']!, _afinacaoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_afinacaoIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DigitacaoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DigitacaoData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      acordeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}acorde_id'],
      )!,
      afinacaoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}afinacao_id'],
      )!,
      posicoes: $DigitacoesTable.$converterposicoes.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}posicoes_json'],
        )!,
      ),
    );
  }

  @override
  $DigitacoesTable createAlias(String alias) {
    return $DigitacoesTable(attachedDatabase, alias);
  }

  static TypeConverter<model.Posicoes, String> $converterposicoes =
      const PosicoesConverter();
}

class DigitacaoData extends DataClass implements Insertable<DigitacaoData> {
  final int id;
  final int acordeId;
  final int afinacaoId;
  final model.Posicoes posicoes;
  const DigitacaoData({
    required this.id,
    required this.acordeId,
    required this.afinacaoId,
    required this.posicoes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['acorde_id'] = Variable<int>(acordeId);
    map['afinacao_id'] = Variable<int>(afinacaoId);
    {
      map['posicoes_json'] = Variable<String>(
        $DigitacoesTable.$converterposicoes.toSql(posicoes),
      );
    }
    return map;
  }

  DigitacoesCompanion toCompanion(bool nullToAbsent) {
    return DigitacoesCompanion(
      id: Value(id),
      acordeId: Value(acordeId),
      afinacaoId: Value(afinacaoId),
      posicoes: Value(posicoes),
    );
  }

  factory DigitacaoData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DigitacaoData(
      id: serializer.fromJson<int>(json['id']),
      acordeId: serializer.fromJson<int>(json['acordeId']),
      afinacaoId: serializer.fromJson<int>(json['afinacaoId']),
      posicoes: serializer.fromJson<model.Posicoes>(json['posicoes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'acordeId': serializer.toJson<int>(acordeId),
      'afinacaoId': serializer.toJson<int>(afinacaoId),
      'posicoes': serializer.toJson<model.Posicoes>(posicoes),
    };
  }

  DigitacaoData copyWith({
    int? id,
    int? acordeId,
    int? afinacaoId,
    model.Posicoes? posicoes,
  }) => DigitacaoData(
    id: id ?? this.id,
    acordeId: acordeId ?? this.acordeId,
    afinacaoId: afinacaoId ?? this.afinacaoId,
    posicoes: posicoes ?? this.posicoes,
  );
  DigitacaoData copyWithCompanion(DigitacoesCompanion data) {
    return DigitacaoData(
      id: data.id.present ? data.id.value : this.id,
      acordeId: data.acordeId.present ? data.acordeId.value : this.acordeId,
      afinacaoId: data.afinacaoId.present
          ? data.afinacaoId.value
          : this.afinacaoId,
      posicoes: data.posicoes.present ? data.posicoes.value : this.posicoes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DigitacaoData(')
          ..write('id: $id, ')
          ..write('acordeId: $acordeId, ')
          ..write('afinacaoId: $afinacaoId, ')
          ..write('posicoes: $posicoes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, acordeId, afinacaoId, posicoes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DigitacaoData &&
          other.id == this.id &&
          other.acordeId == this.acordeId &&
          other.afinacaoId == this.afinacaoId &&
          other.posicoes == this.posicoes);
}

class DigitacoesCompanion extends UpdateCompanion<DigitacaoData> {
  final Value<int> id;
  final Value<int> acordeId;
  final Value<int> afinacaoId;
  final Value<model.Posicoes> posicoes;
  const DigitacoesCompanion({
    this.id = const Value.absent(),
    this.acordeId = const Value.absent(),
    this.afinacaoId = const Value.absent(),
    this.posicoes = const Value.absent(),
  });
  DigitacoesCompanion.insert({
    this.id = const Value.absent(),
    required int acordeId,
    required int afinacaoId,
    required model.Posicoes posicoes,
  }) : acordeId = Value(acordeId),
       afinacaoId = Value(afinacaoId),
       posicoes = Value(posicoes);
  static Insertable<DigitacaoData> custom({
    Expression<int>? id,
    Expression<int>? acordeId,
    Expression<int>? afinacaoId,
    Expression<String>? posicoes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (acordeId != null) 'acorde_id': acordeId,
      if (afinacaoId != null) 'afinacao_id': afinacaoId,
      if (posicoes != null) 'posicoes_json': posicoes,
    });
  }

  DigitacoesCompanion copyWith({
    Value<int>? id,
    Value<int>? acordeId,
    Value<int>? afinacaoId,
    Value<model.Posicoes>? posicoes,
  }) {
    return DigitacoesCompanion(
      id: id ?? this.id,
      acordeId: acordeId ?? this.acordeId,
      afinacaoId: afinacaoId ?? this.afinacaoId,
      posicoes: posicoes ?? this.posicoes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (acordeId.present) {
      map['acorde_id'] = Variable<int>(acordeId.value);
    }
    if (afinacaoId.present) {
      map['afinacao_id'] = Variable<int>(afinacaoId.value);
    }
    if (posicoes.present) {
      map['posicoes_json'] = Variable<String>(
        $DigitacoesTable.$converterposicoes.toSql(posicoes.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DigitacoesCompanion(')
          ..write('id: $id, ')
          ..write('acordeId: $acordeId, ')
          ..write('afinacaoId: $afinacaoId, ')
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
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _parteIdMeta = const VerificationMeta(
    'parteId',
  );
  @override
  late final GeneratedColumn<int> parteId = GeneratedColumn<int>(
    'parte_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES partes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _acordeIdMeta = const VerificationMeta(
    'acordeId',
  );
  @override
  late final GeneratedColumn<int> acordeId = GeneratedColumn<int>(
    'acorde_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES acordes (id)',
    ),
  );
  static const VerificationMeta _vezesMeta = const VerificationMeta('vezes');
  @override
  late final GeneratedColumn<int> vezes = GeneratedColumn<int>(
    'vezes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ordemMeta = const VerificationMeta('ordem');
  @override
  late final GeneratedColumn<int> ordem = GeneratedColumn<int>(
    'ordem',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, parteId, acordeId, vezes, ordem];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sequencia_compassos';
  @override
  VerificationContext validateIntegrity(
    Insertable<SequenciaCompasso> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parte_id')) {
      context.handle(
        _parteIdMeta,
        parteId.isAcceptableOrUnknown(data['parte_id']!, _parteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_parteIdMeta);
    }
    if (data.containsKey('acorde_id')) {
      context.handle(
        _acordeIdMeta,
        acordeId.isAcceptableOrUnknown(data['acorde_id']!, _acordeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_acordeIdMeta);
    }
    if (data.containsKey('vezes')) {
      context.handle(
        _vezesMeta,
        vezes.isAcceptableOrUnknown(data['vezes']!, _vezesMeta),
      );
    } else if (isInserting) {
      context.missing(_vezesMeta);
    }
    if (data.containsKey('ordem')) {
      context.handle(
        _ordemMeta,
        ordem.isAcceptableOrUnknown(data['ordem']!, _ordemMeta),
      );
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      parteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parte_id'],
      )!,
      acordeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}acorde_id'],
      )!,
      vezes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vezes'],
      )!,
      ordem: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ordem'],
      )!,
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
  const SequenciaCompasso({
    required this.id,
    required this.parteId,
    required this.acordeId,
    required this.vezes,
    required this.ordem,
  });
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

  factory SequenciaCompasso.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  SequenciaCompasso copyWith({
    int? id,
    int? parteId,
    int? acordeId,
    int? vezes,
    int? ordem,
  }) => SequenciaCompasso(
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
  }) : parteId = Value(parteId),
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

  SequenciaCompassosCompanion copyWith({
    Value<int>? id,
    Value<int>? parteId,
    Value<int>? acordeId,
    Value<int>? vezes,
    Value<int>? ordem,
  }) {
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
  late final $AfinacoesTable afinacoes = $AfinacoesTable(this);
  late final $MusicasTable musicas = $MusicasTable(this);
  late final $PartesTable partes = $PartesTable(this);
  late final $AcordesTable acordes = $AcordesTable(this);
  late final $DigitacoesTable digitacoes = $DigitacoesTable(this);
  late final $SequenciaCompassosTable sequenciaCompassos =
      $SequenciaCompassosTable(this);
  late final MusicasDao musicasDao = MusicasDao(this as AppDatabase);
  late final AcordesDao acordesDao = AcordesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    afinacoes,
    musicas,
    partes,
    acordes,
    digitacoes,
    sequenciaCompassos,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'musicas',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('partes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'acordes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('digitacoes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'afinacoes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('digitacoes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'partes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('sequencia_compassos', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$AfinacoesTableCreateCompanionBuilder =
    AfinacoesCompanion Function({
      Value<int> id,
      required String nome,
      required model.Instrumento instrumento,
      required String notas,
    });
typedef $$AfinacoesTableUpdateCompanionBuilder =
    AfinacoesCompanion Function({
      Value<int> id,
      Value<String> nome,
      Value<model.Instrumento> instrumento,
      Value<String> notas,
    });

final class $$AfinacoesTableReferences
    extends BaseReferences<_$AppDatabase, $AfinacoesTable, AfinacaoData> {
  $$AfinacoesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MusicasTable, List<MusicaData>> _musicasRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.musicas,
    aliasName: $_aliasNameGenerator(db.afinacoes.id, db.musicas.afinacaoId),
  );

  $$MusicasTableProcessedTableManager get musicasRefs {
    final manager = $$MusicasTableTableManager(
      $_db,
      $_db.musicas,
    ).filter((f) => f.afinacaoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_musicasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DigitacoesTable, List<DigitacaoData>>
  _digitacoesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.digitacoes,
    aliasName: $_aliasNameGenerator(db.afinacoes.id, db.digitacoes.afinacaoId),
  );

  $$DigitacoesTableProcessedTableManager get digitacoesRefs {
    final manager = $$DigitacoesTableTableManager(
      $_db,
      $_db.digitacoes,
    ).filter((f) => f.afinacaoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_digitacoesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AfinacoesTableFilterComposer
    extends Composer<_$AppDatabase, $AfinacoesTable> {
  $$AfinacoesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<model.Instrumento, model.Instrumento, String>
  get instrumento => $composableBuilder(
    column: $table.instrumento,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get notas => $composableBuilder(
    column: $table.notas,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> musicasRefs(
    Expression<bool> Function($$MusicasTableFilterComposer f) f,
  ) {
    final $$MusicasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.musicas,
      getReferencedColumn: (t) => t.afinacaoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MusicasTableFilterComposer(
            $db: $db,
            $table: $db.musicas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> digitacoesRefs(
    Expression<bool> Function($$DigitacoesTableFilterComposer f) f,
  ) {
    final $$DigitacoesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.digitacoes,
      getReferencedColumn: (t) => t.afinacaoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DigitacoesTableFilterComposer(
            $db: $db,
            $table: $db.digitacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AfinacoesTableOrderingComposer
    extends Composer<_$AppDatabase, $AfinacoesTable> {
  $$AfinacoesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instrumento => $composableBuilder(
    column: $table.instrumento,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notas => $composableBuilder(
    column: $table.notas,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AfinacoesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AfinacoesTable> {
  $$AfinacoesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumnWithTypeConverter<model.Instrumento, String> get instrumento =>
      $composableBuilder(
        column: $table.instrumento,
        builder: (column) => column,
      );

  GeneratedColumn<String> get notas =>
      $composableBuilder(column: $table.notas, builder: (column) => column);

  Expression<T> musicasRefs<T extends Object>(
    Expression<T> Function($$MusicasTableAnnotationComposer a) f,
  ) {
    final $$MusicasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.musicas,
      getReferencedColumn: (t) => t.afinacaoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MusicasTableAnnotationComposer(
            $db: $db,
            $table: $db.musicas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> digitacoesRefs<T extends Object>(
    Expression<T> Function($$DigitacoesTableAnnotationComposer a) f,
  ) {
    final $$DigitacoesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.digitacoes,
      getReferencedColumn: (t) => t.afinacaoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DigitacoesTableAnnotationComposer(
            $db: $db,
            $table: $db.digitacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AfinacoesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AfinacoesTable,
          AfinacaoData,
          $$AfinacoesTableFilterComposer,
          $$AfinacoesTableOrderingComposer,
          $$AfinacoesTableAnnotationComposer,
          $$AfinacoesTableCreateCompanionBuilder,
          $$AfinacoesTableUpdateCompanionBuilder,
          (AfinacaoData, $$AfinacoesTableReferences),
          AfinacaoData,
          PrefetchHooks Function({bool musicasRefs, bool digitacoesRefs})
        > {
  $$AfinacoesTableTableManager(_$AppDatabase db, $AfinacoesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AfinacoesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AfinacoesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AfinacoesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<model.Instrumento> instrumento = const Value.absent(),
                Value<String> notas = const Value.absent(),
              }) => AfinacoesCompanion(
                id: id,
                nome: nome,
                instrumento: instrumento,
                notas: notas,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nome,
                required model.Instrumento instrumento,
                required String notas,
              }) => AfinacoesCompanion.insert(
                id: id,
                nome: nome,
                instrumento: instrumento,
                notas: notas,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AfinacoesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({musicasRefs = false, digitacoesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (musicasRefs) db.musicas,
                    if (digitacoesRefs) db.digitacoes,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (musicasRefs)
                        await $_getPrefetchedData<
                          AfinacaoData,
                          $AfinacoesTable,
                          MusicaData
                        >(
                          currentTable: table,
                          referencedTable: $$AfinacoesTableReferences
                              ._musicasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AfinacoesTableReferences(
                                db,
                                table,
                                p0,
                              ).musicasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.afinacaoId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (digitacoesRefs)
                        await $_getPrefetchedData<
                          AfinacaoData,
                          $AfinacoesTable,
                          DigitacaoData
                        >(
                          currentTable: table,
                          referencedTable: $$AfinacoesTableReferences
                              ._digitacoesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AfinacoesTableReferences(
                                db,
                                table,
                                p0,
                              ).digitacoesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.afinacaoId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AfinacoesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AfinacoesTable,
      AfinacaoData,
      $$AfinacoesTableFilterComposer,
      $$AfinacoesTableOrderingComposer,
      $$AfinacoesTableAnnotationComposer,
      $$AfinacoesTableCreateCompanionBuilder,
      $$AfinacoesTableUpdateCompanionBuilder,
      (AfinacaoData, $$AfinacoesTableReferences),
      AfinacaoData,
      PrefetchHooks Function({bool musicasRefs, bool digitacoesRefs})
    >;
typedef $$MusicasTableCreateCompanionBuilder =
    MusicasCompanion Function({
      Value<int> id,
      required String nome,
      required model.Instrumento instrumento,
      required int afinacaoId,
      Value<String?> linkYoutube,
    });
typedef $$MusicasTableUpdateCompanionBuilder =
    MusicasCompanion Function({
      Value<int> id,
      Value<String> nome,
      Value<model.Instrumento> instrumento,
      Value<int> afinacaoId,
      Value<String?> linkYoutube,
    });

final class $$MusicasTableReferences
    extends BaseReferences<_$AppDatabase, $MusicasTable, MusicaData> {
  $$MusicasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AfinacoesTable _afinacaoIdTable(_$AppDatabase db) =>
      db.afinacoes.createAlias(
        $_aliasNameGenerator(db.musicas.afinacaoId, db.afinacoes.id),
      );

  $$AfinacoesTableProcessedTableManager get afinacaoId {
    final $_column = $_itemColumn<int>('afinacao_id')!;

    final manager = $$AfinacoesTableTableManager(
      $_db,
      $_db.afinacoes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_afinacaoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PartesTable, List<ParteData>> _partesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.partes,
    aliasName: $_aliasNameGenerator(db.musicas.id, db.partes.musicaId),
  );

  $$PartesTableProcessedTableManager get partesRefs {
    final manager = $$PartesTableTableManager(
      $_db,
      $_db.partes,
    ).filter((f) => f.musicaId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_partesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MusicasTableFilterComposer
    extends Composer<_$AppDatabase, $MusicasTable> {
  $$MusicasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<model.Instrumento, model.Instrumento, String>
  get instrumento => $composableBuilder(
    column: $table.instrumento,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get linkYoutube => $composableBuilder(
    column: $table.linkYoutube,
    builder: (column) => ColumnFilters(column),
  );

  $$AfinacoesTableFilterComposer get afinacaoId {
    final $$AfinacoesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.afinacaoId,
      referencedTable: $db.afinacoes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AfinacoesTableFilterComposer(
            $db: $db,
            $table: $db.afinacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> partesRefs(
    Expression<bool> Function($$PartesTableFilterComposer f) f,
  ) {
    final $$PartesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.partes,
      getReferencedColumn: (t) => t.musicaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartesTableFilterComposer(
            $db: $db,
            $table: $db.partes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MusicasTableOrderingComposer
    extends Composer<_$AppDatabase, $MusicasTable> {
  $$MusicasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instrumento => $composableBuilder(
    column: $table.instrumento,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get linkYoutube => $composableBuilder(
    column: $table.linkYoutube,
    builder: (column) => ColumnOrderings(column),
  );

  $$AfinacoesTableOrderingComposer get afinacaoId {
    final $$AfinacoesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.afinacaoId,
      referencedTable: $db.afinacoes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AfinacoesTableOrderingComposer(
            $db: $db,
            $table: $db.afinacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MusicasTableAnnotationComposer
    extends Composer<_$AppDatabase, $MusicasTable> {
  $$MusicasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumnWithTypeConverter<model.Instrumento, String> get instrumento =>
      $composableBuilder(
        column: $table.instrumento,
        builder: (column) => column,
      );

  GeneratedColumn<String> get linkYoutube => $composableBuilder(
    column: $table.linkYoutube,
    builder: (column) => column,
  );

  $$AfinacoesTableAnnotationComposer get afinacaoId {
    final $$AfinacoesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.afinacaoId,
      referencedTable: $db.afinacoes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AfinacoesTableAnnotationComposer(
            $db: $db,
            $table: $db.afinacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> partesRefs<T extends Object>(
    Expression<T> Function($$PartesTableAnnotationComposer a) f,
  ) {
    final $$PartesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.partes,
      getReferencedColumn: (t) => t.musicaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartesTableAnnotationComposer(
            $db: $db,
            $table: $db.partes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MusicasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MusicasTable,
          MusicaData,
          $$MusicasTableFilterComposer,
          $$MusicasTableOrderingComposer,
          $$MusicasTableAnnotationComposer,
          $$MusicasTableCreateCompanionBuilder,
          $$MusicasTableUpdateCompanionBuilder,
          (MusicaData, $$MusicasTableReferences),
          MusicaData,
          PrefetchHooks Function({bool afinacaoId, bool partesRefs})
        > {
  $$MusicasTableTableManager(_$AppDatabase db, $MusicasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MusicasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MusicasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MusicasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<model.Instrumento> instrumento = const Value.absent(),
                Value<int> afinacaoId = const Value.absent(),
                Value<String?> linkYoutube = const Value.absent(),
              }) => MusicasCompanion(
                id: id,
                nome: nome,
                instrumento: instrumento,
                afinacaoId: afinacaoId,
                linkYoutube: linkYoutube,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nome,
                required model.Instrumento instrumento,
                required int afinacaoId,
                Value<String?> linkYoutube = const Value.absent(),
              }) => MusicasCompanion.insert(
                id: id,
                nome: nome,
                instrumento: instrumento,
                afinacaoId: afinacaoId,
                linkYoutube: linkYoutube,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MusicasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({afinacaoId = false, partesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (partesRefs) db.partes],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (afinacaoId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.afinacaoId,
                                referencedTable: $$MusicasTableReferences
                                    ._afinacaoIdTable(db),
                                referencedColumn: $$MusicasTableReferences
                                    ._afinacaoIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (partesRefs)
                    await $_getPrefetchedData<
                      MusicaData,
                      $MusicasTable,
                      ParteData
                    >(
                      currentTable: table,
                      referencedTable: $$MusicasTableReferences
                          ._partesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$MusicasTableReferences(db, table, p0).partesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.musicaId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MusicasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MusicasTable,
      MusicaData,
      $$MusicasTableFilterComposer,
      $$MusicasTableOrderingComposer,
      $$MusicasTableAnnotationComposer,
      $$MusicasTableCreateCompanionBuilder,
      $$MusicasTableUpdateCompanionBuilder,
      (MusicaData, $$MusicasTableReferences),
      MusicaData,
      PrefetchHooks Function({bool afinacaoId, bool partesRefs})
    >;
typedef $$PartesTableCreateCompanionBuilder =
    PartesCompanion Function({
      Value<int> id,
      required int musicaId,
      required String nome,
      required String ritmo,
      required String sequencia,
    });
typedef $$PartesTableUpdateCompanionBuilder =
    PartesCompanion Function({
      Value<int> id,
      Value<int> musicaId,
      Value<String> nome,
      Value<String> ritmo,
      Value<String> sequencia,
    });

final class $$PartesTableReferences
    extends BaseReferences<_$AppDatabase, $PartesTable, ParteData> {
  $$PartesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MusicasTable _musicaIdTable(_$AppDatabase db) => db.musicas
      .createAlias($_aliasNameGenerator(db.partes.musicaId, db.musicas.id));

  $$MusicasTableProcessedTableManager get musicaId {
    final $_column = $_itemColumn<int>('musica_id')!;

    final manager = $$MusicasTableTableManager(
      $_db,
      $_db.musicas,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_musicaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SequenciaCompassosTable, List<SequenciaCompasso>>
  _sequenciaCompassosRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.sequenciaCompassos,
        aliasName: $_aliasNameGenerator(
          db.partes.id,
          db.sequenciaCompassos.parteId,
        ),
      );

  $$SequenciaCompassosTableProcessedTableManager get sequenciaCompassosRefs {
    final manager = $$SequenciaCompassosTableTableManager(
      $_db,
      $_db.sequenciaCompassos,
    ).filter((f) => f.parteId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _sequenciaCompassosRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PartesTableFilterComposer
    extends Composer<_$AppDatabase, $PartesTable> {
  $$PartesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ritmo => $composableBuilder(
    column: $table.ritmo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sequencia => $composableBuilder(
    column: $table.sequencia,
    builder: (column) => ColumnFilters(column),
  );

  $$MusicasTableFilterComposer get musicaId {
    final $$MusicasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.musicaId,
      referencedTable: $db.musicas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MusicasTableFilterComposer(
            $db: $db,
            $table: $db.musicas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> sequenciaCompassosRefs(
    Expression<bool> Function($$SequenciaCompassosTableFilterComposer f) f,
  ) {
    final $$SequenciaCompassosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sequenciaCompassos,
      getReferencedColumn: (t) => t.parteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SequenciaCompassosTableFilterComposer(
            $db: $db,
            $table: $db.sequenciaCompassos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PartesTableOrderingComposer
    extends Composer<_$AppDatabase, $PartesTable> {
  $$PartesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ritmo => $composableBuilder(
    column: $table.ritmo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sequencia => $composableBuilder(
    column: $table.sequencia,
    builder: (column) => ColumnOrderings(column),
  );

  $$MusicasTableOrderingComposer get musicaId {
    final $$MusicasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.musicaId,
      referencedTable: $db.musicas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MusicasTableOrderingComposer(
            $db: $db,
            $table: $db.musicas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PartesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PartesTable> {
  $$PartesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get ritmo =>
      $composableBuilder(column: $table.ritmo, builder: (column) => column);

  GeneratedColumn<String> get sequencia =>
      $composableBuilder(column: $table.sequencia, builder: (column) => column);

  $$MusicasTableAnnotationComposer get musicaId {
    final $$MusicasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.musicaId,
      referencedTable: $db.musicas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MusicasTableAnnotationComposer(
            $db: $db,
            $table: $db.musicas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> sequenciaCompassosRefs<T extends Object>(
    Expression<T> Function($$SequenciaCompassosTableAnnotationComposer a) f,
  ) {
    final $$SequenciaCompassosTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.sequenciaCompassos,
          getReferencedColumn: (t) => t.parteId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SequenciaCompassosTableAnnotationComposer(
                $db: $db,
                $table: $db.sequenciaCompassos,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PartesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PartesTable,
          ParteData,
          $$PartesTableFilterComposer,
          $$PartesTableOrderingComposer,
          $$PartesTableAnnotationComposer,
          $$PartesTableCreateCompanionBuilder,
          $$PartesTableUpdateCompanionBuilder,
          (ParteData, $$PartesTableReferences),
          ParteData,
          PrefetchHooks Function({bool musicaId, bool sequenciaCompassosRefs})
        > {
  $$PartesTableTableManager(_$AppDatabase db, $PartesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PartesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PartesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PartesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> musicaId = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<String> ritmo = const Value.absent(),
                Value<String> sequencia = const Value.absent(),
              }) => PartesCompanion(
                id: id,
                musicaId: musicaId,
                nome: nome,
                ritmo: ritmo,
                sequencia: sequencia,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int musicaId,
                required String nome,
                required String ritmo,
                required String sequencia,
              }) => PartesCompanion.insert(
                id: id,
                musicaId: musicaId,
                nome: nome,
                ritmo: ritmo,
                sequencia: sequencia,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$PartesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({musicaId = false, sequenciaCompassosRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (sequenciaCompassosRefs) db.sequenciaCompassos,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (musicaId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.musicaId,
                                    referencedTable: $$PartesTableReferences
                                        ._musicaIdTable(db),
                                    referencedColumn: $$PartesTableReferences
                                        ._musicaIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (sequenciaCompassosRefs)
                        await $_getPrefetchedData<
                          ParteData,
                          $PartesTable,
                          SequenciaCompasso
                        >(
                          currentTable: table,
                          referencedTable: $$PartesTableReferences
                              ._sequenciaCompassosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PartesTableReferences(
                                db,
                                table,
                                p0,
                              ).sequenciaCompassosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.parteId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PartesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PartesTable,
      ParteData,
      $$PartesTableFilterComposer,
      $$PartesTableOrderingComposer,
      $$PartesTableAnnotationComposer,
      $$PartesTableCreateCompanionBuilder,
      $$PartesTableUpdateCompanionBuilder,
      (ParteData, $$PartesTableReferences),
      ParteData,
      PrefetchHooks Function({bool musicaId, bool sequenciaCompassosRefs})
    >;
typedef $$AcordesTableCreateCompanionBuilder =
    AcordesCompanion Function({
      Value<int> id,
      required String nome,
      required model.TipoAcorde tipo,
    });
typedef $$AcordesTableUpdateCompanionBuilder =
    AcordesCompanion Function({
      Value<int> id,
      Value<String> nome,
      Value<model.TipoAcorde> tipo,
    });

final class $$AcordesTableReferences
    extends BaseReferences<_$AppDatabase, $AcordesTable, AcordeData> {
  $$AcordesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DigitacoesTable, List<DigitacaoData>>
  _digitacoesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.digitacoes,
    aliasName: $_aliasNameGenerator(db.acordes.id, db.digitacoes.acordeId),
  );

  $$DigitacoesTableProcessedTableManager get digitacoesRefs {
    final manager = $$DigitacoesTableTableManager(
      $_db,
      $_db.digitacoes,
    ).filter((f) => f.acordeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_digitacoesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SequenciaCompassosTable, List<SequenciaCompasso>>
  _sequenciaCompassosRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.sequenciaCompassos,
        aliasName: $_aliasNameGenerator(
          db.acordes.id,
          db.sequenciaCompassos.acordeId,
        ),
      );

  $$SequenciaCompassosTableProcessedTableManager get sequenciaCompassosRefs {
    final manager = $$SequenciaCompassosTableTableManager(
      $_db,
      $_db.sequenciaCompassos,
    ).filter((f) => f.acordeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _sequenciaCompassosRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AcordesTableFilterComposer
    extends Composer<_$AppDatabase, $AcordesTable> {
  $$AcordesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<model.TipoAcorde, model.TipoAcorde, String>
  get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  Expression<bool> digitacoesRefs(
    Expression<bool> Function($$DigitacoesTableFilterComposer f) f,
  ) {
    final $$DigitacoesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.digitacoes,
      getReferencedColumn: (t) => t.acordeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DigitacoesTableFilterComposer(
            $db: $db,
            $table: $db.digitacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> sequenciaCompassosRefs(
    Expression<bool> Function($$SequenciaCompassosTableFilterComposer f) f,
  ) {
    final $$SequenciaCompassosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sequenciaCompassos,
      getReferencedColumn: (t) => t.acordeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SequenciaCompassosTableFilterComposer(
            $db: $db,
            $table: $db.sequenciaCompassos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AcordesTableOrderingComposer
    extends Composer<_$AppDatabase, $AcordesTable> {
  $$AcordesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AcordesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AcordesTable> {
  $$AcordesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumnWithTypeConverter<model.TipoAcorde, String> get tipo =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  Expression<T> digitacoesRefs<T extends Object>(
    Expression<T> Function($$DigitacoesTableAnnotationComposer a) f,
  ) {
    final $$DigitacoesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.digitacoes,
      getReferencedColumn: (t) => t.acordeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DigitacoesTableAnnotationComposer(
            $db: $db,
            $table: $db.digitacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> sequenciaCompassosRefs<T extends Object>(
    Expression<T> Function($$SequenciaCompassosTableAnnotationComposer a) f,
  ) {
    final $$SequenciaCompassosTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.sequenciaCompassos,
          getReferencedColumn: (t) => t.acordeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SequenciaCompassosTableAnnotationComposer(
                $db: $db,
                $table: $db.sequenciaCompassos,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AcordesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AcordesTable,
          AcordeData,
          $$AcordesTableFilterComposer,
          $$AcordesTableOrderingComposer,
          $$AcordesTableAnnotationComposer,
          $$AcordesTableCreateCompanionBuilder,
          $$AcordesTableUpdateCompanionBuilder,
          (AcordeData, $$AcordesTableReferences),
          AcordeData,
          PrefetchHooks Function({
            bool digitacoesRefs,
            bool sequenciaCompassosRefs,
          })
        > {
  $$AcordesTableTableManager(_$AppDatabase db, $AcordesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AcordesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AcordesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AcordesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<model.TipoAcorde> tipo = const Value.absent(),
              }) => AcordesCompanion(id: id, nome: nome, tipo: tipo),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nome,
                required model.TipoAcorde tipo,
              }) => AcordesCompanion.insert(id: id, nome: nome, tipo: tipo),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AcordesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({digitacoesRefs = false, sequenciaCompassosRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (digitacoesRefs) db.digitacoes,
                    if (sequenciaCompassosRefs) db.sequenciaCompassos,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (digitacoesRefs)
                        await $_getPrefetchedData<
                          AcordeData,
                          $AcordesTable,
                          DigitacaoData
                        >(
                          currentTable: table,
                          referencedTable: $$AcordesTableReferences
                              ._digitacoesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AcordesTableReferences(
                                db,
                                table,
                                p0,
                              ).digitacoesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.acordeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (sequenciaCompassosRefs)
                        await $_getPrefetchedData<
                          AcordeData,
                          $AcordesTable,
                          SequenciaCompasso
                        >(
                          currentTable: table,
                          referencedTable: $$AcordesTableReferences
                              ._sequenciaCompassosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AcordesTableReferences(
                                db,
                                table,
                                p0,
                              ).sequenciaCompassosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.acordeId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AcordesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AcordesTable,
      AcordeData,
      $$AcordesTableFilterComposer,
      $$AcordesTableOrderingComposer,
      $$AcordesTableAnnotationComposer,
      $$AcordesTableCreateCompanionBuilder,
      $$AcordesTableUpdateCompanionBuilder,
      (AcordeData, $$AcordesTableReferences),
      AcordeData,
      PrefetchHooks Function({bool digitacoesRefs, bool sequenciaCompassosRefs})
    >;
typedef $$DigitacoesTableCreateCompanionBuilder =
    DigitacoesCompanion Function({
      Value<int> id,
      required int acordeId,
      required int afinacaoId,
      required model.Posicoes posicoes,
    });
typedef $$DigitacoesTableUpdateCompanionBuilder =
    DigitacoesCompanion Function({
      Value<int> id,
      Value<int> acordeId,
      Value<int> afinacaoId,
      Value<model.Posicoes> posicoes,
    });

final class $$DigitacoesTableReferences
    extends BaseReferences<_$AppDatabase, $DigitacoesTable, DigitacaoData> {
  $$DigitacoesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AcordesTable _acordeIdTable(_$AppDatabase db) => db.acordes
      .createAlias($_aliasNameGenerator(db.digitacoes.acordeId, db.acordes.id));

  $$AcordesTableProcessedTableManager get acordeId {
    final $_column = $_itemColumn<int>('acorde_id')!;

    final manager = $$AcordesTableTableManager(
      $_db,
      $_db.acordes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_acordeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AfinacoesTable _afinacaoIdTable(_$AppDatabase db) =>
      db.afinacoes.createAlias(
        $_aliasNameGenerator(db.digitacoes.afinacaoId, db.afinacoes.id),
      );

  $$AfinacoesTableProcessedTableManager get afinacaoId {
    final $_column = $_itemColumn<int>('afinacao_id')!;

    final manager = $$AfinacoesTableTableManager(
      $_db,
      $_db.afinacoes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_afinacaoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DigitacoesTableFilterComposer
    extends Composer<_$AppDatabase, $DigitacoesTable> {
  $$DigitacoesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<model.Posicoes, model.Posicoes, String>
  get posicoes => $composableBuilder(
    column: $table.posicoes,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  $$AcordesTableFilterComposer get acordeId {
    final $$AcordesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.acordeId,
      referencedTable: $db.acordes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AcordesTableFilterComposer(
            $db: $db,
            $table: $db.acordes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AfinacoesTableFilterComposer get afinacaoId {
    final $$AfinacoesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.afinacaoId,
      referencedTable: $db.afinacoes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AfinacoesTableFilterComposer(
            $db: $db,
            $table: $db.afinacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DigitacoesTableOrderingComposer
    extends Composer<_$AppDatabase, $DigitacoesTable> {
  $$DigitacoesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get posicoes => $composableBuilder(
    column: $table.posicoes,
    builder: (column) => ColumnOrderings(column),
  );

  $$AcordesTableOrderingComposer get acordeId {
    final $$AcordesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.acordeId,
      referencedTable: $db.acordes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AcordesTableOrderingComposer(
            $db: $db,
            $table: $db.acordes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AfinacoesTableOrderingComposer get afinacaoId {
    final $$AfinacoesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.afinacaoId,
      referencedTable: $db.afinacoes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AfinacoesTableOrderingComposer(
            $db: $db,
            $table: $db.afinacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DigitacoesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DigitacoesTable> {
  $$DigitacoesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<model.Posicoes, String> get posicoes =>
      $composableBuilder(column: $table.posicoes, builder: (column) => column);

  $$AcordesTableAnnotationComposer get acordeId {
    final $$AcordesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.acordeId,
      referencedTable: $db.acordes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AcordesTableAnnotationComposer(
            $db: $db,
            $table: $db.acordes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AfinacoesTableAnnotationComposer get afinacaoId {
    final $$AfinacoesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.afinacaoId,
      referencedTable: $db.afinacoes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AfinacoesTableAnnotationComposer(
            $db: $db,
            $table: $db.afinacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DigitacoesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DigitacoesTable,
          DigitacaoData,
          $$DigitacoesTableFilterComposer,
          $$DigitacoesTableOrderingComposer,
          $$DigitacoesTableAnnotationComposer,
          $$DigitacoesTableCreateCompanionBuilder,
          $$DigitacoesTableUpdateCompanionBuilder,
          (DigitacaoData, $$DigitacoesTableReferences),
          DigitacaoData,
          PrefetchHooks Function({bool acordeId, bool afinacaoId})
        > {
  $$DigitacoesTableTableManager(_$AppDatabase db, $DigitacoesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DigitacoesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DigitacoesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DigitacoesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> acordeId = const Value.absent(),
                Value<int> afinacaoId = const Value.absent(),
                Value<model.Posicoes> posicoes = const Value.absent(),
              }) => DigitacoesCompanion(
                id: id,
                acordeId: acordeId,
                afinacaoId: afinacaoId,
                posicoes: posicoes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int acordeId,
                required int afinacaoId,
                required model.Posicoes posicoes,
              }) => DigitacoesCompanion.insert(
                id: id,
                acordeId: acordeId,
                afinacaoId: afinacaoId,
                posicoes: posicoes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DigitacoesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({acordeId = false, afinacaoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (acordeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.acordeId,
                                referencedTable: $$DigitacoesTableReferences
                                    ._acordeIdTable(db),
                                referencedColumn: $$DigitacoesTableReferences
                                    ._acordeIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (afinacaoId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.afinacaoId,
                                referencedTable: $$DigitacoesTableReferences
                                    ._afinacaoIdTable(db),
                                referencedColumn: $$DigitacoesTableReferences
                                    ._afinacaoIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DigitacoesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DigitacoesTable,
      DigitacaoData,
      $$DigitacoesTableFilterComposer,
      $$DigitacoesTableOrderingComposer,
      $$DigitacoesTableAnnotationComposer,
      $$DigitacoesTableCreateCompanionBuilder,
      $$DigitacoesTableUpdateCompanionBuilder,
      (DigitacaoData, $$DigitacoesTableReferences),
      DigitacaoData,
      PrefetchHooks Function({bool acordeId, bool afinacaoId})
    >;
typedef $$SequenciaCompassosTableCreateCompanionBuilder =
    SequenciaCompassosCompanion Function({
      Value<int> id,
      required int parteId,
      required int acordeId,
      required int vezes,
      required int ordem,
    });
typedef $$SequenciaCompassosTableUpdateCompanionBuilder =
    SequenciaCompassosCompanion Function({
      Value<int> id,
      Value<int> parteId,
      Value<int> acordeId,
      Value<int> vezes,
      Value<int> ordem,
    });

final class $$SequenciaCompassosTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SequenciaCompassosTable,
          SequenciaCompasso
        > {
  $$SequenciaCompassosTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PartesTable _parteIdTable(_$AppDatabase db) => db.partes.createAlias(
    $_aliasNameGenerator(db.sequenciaCompassos.parteId, db.partes.id),
  );

  $$PartesTableProcessedTableManager get parteId {
    final $_column = $_itemColumn<int>('parte_id')!;

    final manager = $$PartesTableTableManager(
      $_db,
      $_db.partes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AcordesTable _acordeIdTable(_$AppDatabase db) =>
      db.acordes.createAlias(
        $_aliasNameGenerator(db.sequenciaCompassos.acordeId, db.acordes.id),
      );

  $$AcordesTableProcessedTableManager get acordeId {
    final $_column = $_itemColumn<int>('acorde_id')!;

    final manager = $$AcordesTableTableManager(
      $_db,
      $_db.acordes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_acordeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SequenciaCompassosTableFilterComposer
    extends Composer<_$AppDatabase, $SequenciaCompassosTable> {
  $$SequenciaCompassosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get vezes => $composableBuilder(
    column: $table.vezes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ordem => $composableBuilder(
    column: $table.ordem,
    builder: (column) => ColumnFilters(column),
  );

  $$PartesTableFilterComposer get parteId {
    final $$PartesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parteId,
      referencedTable: $db.partes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartesTableFilterComposer(
            $db: $db,
            $table: $db.partes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AcordesTableFilterComposer get acordeId {
    final $$AcordesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.acordeId,
      referencedTable: $db.acordes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AcordesTableFilterComposer(
            $db: $db,
            $table: $db.acordes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SequenciaCompassosTableOrderingComposer
    extends Composer<_$AppDatabase, $SequenciaCompassosTable> {
  $$SequenciaCompassosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get vezes => $composableBuilder(
    column: $table.vezes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ordem => $composableBuilder(
    column: $table.ordem,
    builder: (column) => ColumnOrderings(column),
  );

  $$PartesTableOrderingComposer get parteId {
    final $$PartesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parteId,
      referencedTable: $db.partes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartesTableOrderingComposer(
            $db: $db,
            $table: $db.partes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AcordesTableOrderingComposer get acordeId {
    final $$AcordesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.acordeId,
      referencedTable: $db.acordes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AcordesTableOrderingComposer(
            $db: $db,
            $table: $db.acordes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SequenciaCompassosTableAnnotationComposer
    extends Composer<_$AppDatabase, $SequenciaCompassosTable> {
  $$SequenciaCompassosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get vezes =>
      $composableBuilder(column: $table.vezes, builder: (column) => column);

  GeneratedColumn<int> get ordem =>
      $composableBuilder(column: $table.ordem, builder: (column) => column);

  $$PartesTableAnnotationComposer get parteId {
    final $$PartesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parteId,
      referencedTable: $db.partes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartesTableAnnotationComposer(
            $db: $db,
            $table: $db.partes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AcordesTableAnnotationComposer get acordeId {
    final $$AcordesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.acordeId,
      referencedTable: $db.acordes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AcordesTableAnnotationComposer(
            $db: $db,
            $table: $db.acordes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SequenciaCompassosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SequenciaCompassosTable,
          SequenciaCompasso,
          $$SequenciaCompassosTableFilterComposer,
          $$SequenciaCompassosTableOrderingComposer,
          $$SequenciaCompassosTableAnnotationComposer,
          $$SequenciaCompassosTableCreateCompanionBuilder,
          $$SequenciaCompassosTableUpdateCompanionBuilder,
          (SequenciaCompasso, $$SequenciaCompassosTableReferences),
          SequenciaCompasso,
          PrefetchHooks Function({bool parteId, bool acordeId})
        > {
  $$SequenciaCompassosTableTableManager(
    _$AppDatabase db,
    $SequenciaCompassosTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SequenciaCompassosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SequenciaCompassosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SequenciaCompassosTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> parteId = const Value.absent(),
                Value<int> acordeId = const Value.absent(),
                Value<int> vezes = const Value.absent(),
                Value<int> ordem = const Value.absent(),
              }) => SequenciaCompassosCompanion(
                id: id,
                parteId: parteId,
                acordeId: acordeId,
                vezes: vezes,
                ordem: ordem,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int parteId,
                required int acordeId,
                required int vezes,
                required int ordem,
              }) => SequenciaCompassosCompanion.insert(
                id: id,
                parteId: parteId,
                acordeId: acordeId,
                vezes: vezes,
                ordem: ordem,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SequenciaCompassosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({parteId = false, acordeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (parteId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.parteId,
                                referencedTable:
                                    $$SequenciaCompassosTableReferences
                                        ._parteIdTable(db),
                                referencedColumn:
                                    $$SequenciaCompassosTableReferences
                                        ._parteIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (acordeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.acordeId,
                                referencedTable:
                                    $$SequenciaCompassosTableReferences
                                        ._acordeIdTable(db),
                                referencedColumn:
                                    $$SequenciaCompassosTableReferences
                                        ._acordeIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SequenciaCompassosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SequenciaCompassosTable,
      SequenciaCompasso,
      $$SequenciaCompassosTableFilterComposer,
      $$SequenciaCompassosTableOrderingComposer,
      $$SequenciaCompassosTableAnnotationComposer,
      $$SequenciaCompassosTableCreateCompanionBuilder,
      $$SequenciaCompassosTableUpdateCompanionBuilder,
      (SequenciaCompasso, $$SequenciaCompassosTableReferences),
      SequenciaCompasso,
      PrefetchHooks Function({bool parteId, bool acordeId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AfinacoesTableTableManager get afinacoes =>
      $$AfinacoesTableTableManager(_db, _db.afinacoes);
  $$MusicasTableTableManager get musicas =>
      $$MusicasTableTableManager(_db, _db.musicas);
  $$PartesTableTableManager get partes =>
      $$PartesTableTableManager(_db, _db.partes);
  $$AcordesTableTableManager get acordes =>
      $$AcordesTableTableManager(_db, _db.acordes);
  $$DigitacoesTableTableManager get digitacoes =>
      $$DigitacoesTableTableManager(_db, _db.digitacoes);
  $$SequenciaCompassosTableTableManager get sequenciaCompassos =>
      $$SequenciaCompassosTableTableManager(_db, _db.sequenciaCompassos);
}

mixin _$MusicasDaoMixin on DatabaseAccessor<AppDatabase> {
  $AfinacoesTable get afinacoes => attachedDatabase.afinacoes;
  $MusicasTable get musicas => attachedDatabase.musicas;
  $PartesTable get partes => attachedDatabase.partes;
  $AcordesTable get acordes => attachedDatabase.acordes;
  $SequenciaCompassosTable get sequenciaCompassos =>
      attachedDatabase.sequenciaCompassos;
}
mixin _$AcordesDaoMixin on DatabaseAccessor<AppDatabase> {
  $AcordesTable get acordes => attachedDatabase.acordes;
  $AfinacoesTable get afinacoes => attachedDatabase.afinacoes;
  $DigitacoesTable get digitacoes => attachedDatabase.digitacoes;
}
