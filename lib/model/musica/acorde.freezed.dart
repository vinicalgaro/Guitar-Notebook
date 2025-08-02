// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'acorde.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Acorde _$AcordeFromJson(Map<String, dynamic> json) {
  return _Acorde.fromJson(json);
}

/// @nodoc
mixin _$Acorde {
  int? get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String get instrumento => throw _privateConstructorUsedError;
  @JsonKey(name: 'imagem_url')
  String get imagemUrl => throw _privateConstructorUsedError;
  String get afinacao => throw _privateConstructorUsedError;
  @JsonKey(name: 'posicoes_json')
  Posicoes get posicoes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AcordeCopyWith<Acorde> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcordeCopyWith<$Res> {
  factory $AcordeCopyWith(Acorde value, $Res Function(Acorde) then) =
      _$AcordeCopyWithImpl<$Res, Acorde>;
  @useResult
  $Res call(
      {int? id,
      String nome,
      String instrumento,
      @JsonKey(name: 'imagem_url') String imagemUrl,
      String afinacao,
      @JsonKey(name: 'posicoes_json') Posicoes posicoes});

  $PosicoesCopyWith<$Res> get posicoes;
}

/// @nodoc
class _$AcordeCopyWithImpl<$Res, $Val extends Acorde>
    implements $AcordeCopyWith<$Res> {
  _$AcordeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nome = null,
    Object? instrumento = null,
    Object? imagemUrl = null,
    Object? afinacao = null,
    Object? posicoes = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      instrumento: null == instrumento
          ? _value.instrumento
          : instrumento // ignore: cast_nullable_to_non_nullable
              as String,
      imagemUrl: null == imagemUrl
          ? _value.imagemUrl
          : imagemUrl // ignore: cast_nullable_to_non_nullable
              as String,
      afinacao: null == afinacao
          ? _value.afinacao
          : afinacao // ignore: cast_nullable_to_non_nullable
              as String,
      posicoes: null == posicoes
          ? _value.posicoes
          : posicoes // ignore: cast_nullable_to_non_nullable
              as Posicoes,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PosicoesCopyWith<$Res> get posicoes {
    return $PosicoesCopyWith<$Res>(_value.posicoes, (value) {
      return _then(_value.copyWith(posicoes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AcordeImplCopyWith<$Res> implements $AcordeCopyWith<$Res> {
  factory _$$AcordeImplCopyWith(
          _$AcordeImpl value, $Res Function(_$AcordeImpl) then) =
      __$$AcordeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String nome,
      String instrumento,
      @JsonKey(name: 'imagem_url') String imagemUrl,
      String afinacao,
      @JsonKey(name: 'posicoes_json') Posicoes posicoes});

  @override
  $PosicoesCopyWith<$Res> get posicoes;
}

/// @nodoc
class __$$AcordeImplCopyWithImpl<$Res>
    extends _$AcordeCopyWithImpl<$Res, _$AcordeImpl>
    implements _$$AcordeImplCopyWith<$Res> {
  __$$AcordeImplCopyWithImpl(
      _$AcordeImpl _value, $Res Function(_$AcordeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nome = null,
    Object? instrumento = null,
    Object? imagemUrl = null,
    Object? afinacao = null,
    Object? posicoes = null,
  }) {
    return _then(_$AcordeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      instrumento: null == instrumento
          ? _value.instrumento
          : instrumento // ignore: cast_nullable_to_non_nullable
              as String,
      imagemUrl: null == imagemUrl
          ? _value.imagemUrl
          : imagemUrl // ignore: cast_nullable_to_non_nullable
              as String,
      afinacao: null == afinacao
          ? _value.afinacao
          : afinacao // ignore: cast_nullable_to_non_nullable
              as String,
      posicoes: null == posicoes
          ? _value.posicoes
          : posicoes // ignore: cast_nullable_to_non_nullable
              as Posicoes,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AcordeImpl implements _Acorde {
  const _$AcordeImpl(
      {this.id,
      required this.nome,
      required this.instrumento,
      @JsonKey(name: 'imagem_url') required this.imagemUrl,
      required this.afinacao,
      @JsonKey(name: 'posicoes_json') required this.posicoes});

  factory _$AcordeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AcordeImplFromJson(json);

  @override
  final int? id;
  @override
  final String nome;
  @override
  final String instrumento;
  @override
  @JsonKey(name: 'imagem_url')
  final String imagemUrl;
  @override
  final String afinacao;
  @override
  @JsonKey(name: 'posicoes_json')
  final Posicoes posicoes;

  @override
  String toString() {
    return 'Acorde(id: $id, nome: $nome, instrumento: $instrumento, imagemUrl: $imagemUrl, afinacao: $afinacao, posicoes: $posicoes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcordeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.instrumento, instrumento) ||
                other.instrumento == instrumento) &&
            (identical(other.imagemUrl, imagemUrl) ||
                other.imagemUrl == imagemUrl) &&
            (identical(other.afinacao, afinacao) ||
                other.afinacao == afinacao) &&
            (identical(other.posicoes, posicoes) ||
                other.posicoes == posicoes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, nome, instrumento, imagemUrl, afinacao, posicoes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AcordeImplCopyWith<_$AcordeImpl> get copyWith =>
      __$$AcordeImplCopyWithImpl<_$AcordeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AcordeImplToJson(
      this,
    );
  }
}

abstract class _Acorde implements Acorde {
  const factory _Acorde(
          {final int? id,
          required final String nome,
          required final String instrumento,
          @JsonKey(name: 'imagem_url') required final String imagemUrl,
          required final String afinacao,
          @JsonKey(name: 'posicoes_json') required final Posicoes posicoes}) =
      _$AcordeImpl;

  factory _Acorde.fromJson(Map<String, dynamic> json) = _$AcordeImpl.fromJson;

  @override
  int? get id;
  @override
  String get nome;
  @override
  String get instrumento;
  @override
  @JsonKey(name: 'imagem_url')
  String get imagemUrl;
  @override
  String get afinacao;
  @override
  @JsonKey(name: 'posicoes_json')
  Posicoes get posicoes;
  @override
  @JsonKey(ignore: true)
  _$$AcordeImplCopyWith<_$AcordeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
