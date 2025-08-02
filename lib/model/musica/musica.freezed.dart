// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'musica.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Musica {
  String get nome => throw _privateConstructorUsedError;
  Instrumento get instrumento => throw _privateConstructorUsedError;
  String? get linkYoutube => throw _privateConstructorUsedError;
  List<Parte> get partes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MusicaCopyWith<Musica> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicaCopyWith<$Res> {
  factory $MusicaCopyWith(Musica value, $Res Function(Musica) then) =
      _$MusicaCopyWithImpl<$Res, Musica>;
  @useResult
  $Res call(
      {String nome,
      Instrumento instrumento,
      String? linkYoutube,
      List<Parte> partes});
}

/// @nodoc
class _$MusicaCopyWithImpl<$Res, $Val extends Musica>
    implements $MusicaCopyWith<$Res> {
  _$MusicaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? instrumento = null,
    Object? linkYoutube = freezed,
    Object? partes = null,
  }) {
    return _then(_value.copyWith(
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      instrumento: null == instrumento
          ? _value.instrumento
          : instrumento // ignore: cast_nullable_to_non_nullable
              as Instrumento,
      linkYoutube: freezed == linkYoutube
          ? _value.linkYoutube
          : linkYoutube // ignore: cast_nullable_to_non_nullable
              as String?,
      partes: null == partes
          ? _value.partes
          : partes // ignore: cast_nullable_to_non_nullable
              as List<Parte>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MusicaImplCopyWith<$Res> implements $MusicaCopyWith<$Res> {
  factory _$$MusicaImplCopyWith(
          _$MusicaImpl value, $Res Function(_$MusicaImpl) then) =
      __$$MusicaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nome,
      Instrumento instrumento,
      String? linkYoutube,
      List<Parte> partes});
}

/// @nodoc
class __$$MusicaImplCopyWithImpl<$Res>
    extends _$MusicaCopyWithImpl<$Res, _$MusicaImpl>
    implements _$$MusicaImplCopyWith<$Res> {
  __$$MusicaImplCopyWithImpl(
      _$MusicaImpl _value, $Res Function(_$MusicaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? instrumento = null,
    Object? linkYoutube = freezed,
    Object? partes = null,
  }) {
    return _then(_$MusicaImpl(
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      instrumento: null == instrumento
          ? _value.instrumento
          : instrumento // ignore: cast_nullable_to_non_nullable
              as Instrumento,
      linkYoutube: freezed == linkYoutube
          ? _value.linkYoutube
          : linkYoutube // ignore: cast_nullable_to_non_nullable
              as String?,
      partes: null == partes
          ? _value._partes
          : partes // ignore: cast_nullable_to_non_nullable
              as List<Parte>,
    ));
  }
}

/// @nodoc

class _$MusicaImpl implements _Musica {
  const _$MusicaImpl(
      {required this.nome,
      required this.instrumento,
      this.linkYoutube,
      required final List<Parte> partes})
      : _partes = partes;

  @override
  final String nome;
  @override
  final Instrumento instrumento;
  @override
  final String? linkYoutube;
  final List<Parte> _partes;
  @override
  List<Parte> get partes {
    if (_partes is EqualUnmodifiableListView) return _partes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_partes);
  }

  @override
  String toString() {
    return 'Musica(nome: $nome, instrumento: $instrumento, linkYoutube: $linkYoutube, partes: $partes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicaImpl &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.instrumento, instrumento) ||
                other.instrumento == instrumento) &&
            (identical(other.linkYoutube, linkYoutube) ||
                other.linkYoutube == linkYoutube) &&
            const DeepCollectionEquality().equals(other._partes, _partes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nome, instrumento, linkYoutube,
      const DeepCollectionEquality().hash(_partes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicaImplCopyWith<_$MusicaImpl> get copyWith =>
      __$$MusicaImplCopyWithImpl<_$MusicaImpl>(this, _$identity);
}

abstract class _Musica implements Musica {
  const factory _Musica(
      {required final String nome,
      required final Instrumento instrumento,
      final String? linkYoutube,
      required final List<Parte> partes}) = _$MusicaImpl;

  @override
  String get nome;
  @override
  Instrumento get instrumento;
  @override
  String? get linkYoutube;
  @override
  List<Parte> get partes;
  @override
  @JsonKey(ignore: true)
  _$$MusicaImplCopyWith<_$MusicaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
