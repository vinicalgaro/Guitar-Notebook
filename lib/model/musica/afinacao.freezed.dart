// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'afinacao.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Afinacao {
  int get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  Instrumento get instrumento => throw _privateConstructorUsedError;
  String get notas => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AfinacaoCopyWith<Afinacao> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AfinacaoCopyWith<$Res> {
  factory $AfinacaoCopyWith(Afinacao value, $Res Function(Afinacao) then) =
      _$AfinacaoCopyWithImpl<$Res, Afinacao>;
  @useResult
  $Res call({int id, String nome, Instrumento instrumento, String notas});
}

/// @nodoc
class _$AfinacaoCopyWithImpl<$Res, $Val extends Afinacao>
    implements $AfinacaoCopyWith<$Res> {
  _$AfinacaoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? instrumento = null,
    Object? notas = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      instrumento: null == instrumento
          ? _value.instrumento
          : instrumento // ignore: cast_nullable_to_non_nullable
              as Instrumento,
      notas: null == notas
          ? _value.notas
          : notas // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AfinacaoImplCopyWith<$Res>
    implements $AfinacaoCopyWith<$Res> {
  factory _$$AfinacaoImplCopyWith(
          _$AfinacaoImpl value, $Res Function(_$AfinacaoImpl) then) =
      __$$AfinacaoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String nome, Instrumento instrumento, String notas});
}

/// @nodoc
class __$$AfinacaoImplCopyWithImpl<$Res>
    extends _$AfinacaoCopyWithImpl<$Res, _$AfinacaoImpl>
    implements _$$AfinacaoImplCopyWith<$Res> {
  __$$AfinacaoImplCopyWithImpl(
      _$AfinacaoImpl _value, $Res Function(_$AfinacaoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? instrumento = null,
    Object? notas = null,
  }) {
    return _then(_$AfinacaoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      instrumento: null == instrumento
          ? _value.instrumento
          : instrumento // ignore: cast_nullable_to_non_nullable
              as Instrumento,
      notas: null == notas
          ? _value.notas
          : notas // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AfinacaoImpl implements _Afinacao {
  const _$AfinacaoImpl(
      {required this.id,
      required this.nome,
      required this.instrumento,
      required this.notas});

  @override
  final int id;
  @override
  final String nome;
  @override
  final Instrumento instrumento;
  @override
  final String notas;

  @override
  String toString() {
    return 'Afinacao(id: $id, nome: $nome, instrumento: $instrumento, notas: $notas)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AfinacaoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.instrumento, instrumento) ||
                other.instrumento == instrumento) &&
            (identical(other.notas, notas) || other.notas == notas));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, nome, instrumento, notas);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AfinacaoImplCopyWith<_$AfinacaoImpl> get copyWith =>
      __$$AfinacaoImplCopyWithImpl<_$AfinacaoImpl>(this, _$identity);
}

abstract class _Afinacao implements Afinacao {
  const factory _Afinacao(
      {required final int id,
      required final String nome,
      required final Instrumento instrumento,
      required final String notas}) = _$AfinacaoImpl;

  @override
  int get id;
  @override
  String get nome;
  @override
  Instrumento get instrumento;
  @override
  String get notas;
  @override
  @JsonKey(ignore: true)
  _$$AfinacaoImplCopyWith<_$AfinacaoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
