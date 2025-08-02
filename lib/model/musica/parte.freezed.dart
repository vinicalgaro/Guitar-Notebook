// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parte.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Parte {
  String get nome => throw _privateConstructorUsedError;
  Ritmo get ritmo => throw _privateConstructorUsedError;
  Sequencia get sequencia => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ParteCopyWith<Parte> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParteCopyWith<$Res> {
  factory $ParteCopyWith(Parte value, $Res Function(Parte) then) =
      _$ParteCopyWithImpl<$Res, Parte>;
  @useResult
  $Res call({String nome, Ritmo ritmo, Sequencia sequencia});
}

/// @nodoc
class _$ParteCopyWithImpl<$Res, $Val extends Parte>
    implements $ParteCopyWith<$Res> {
  _$ParteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? ritmo = null,
    Object? sequencia = null,
  }) {
    return _then(_value.copyWith(
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      ritmo: null == ritmo
          ? _value.ritmo
          : ritmo // ignore: cast_nullable_to_non_nullable
              as Ritmo,
      sequencia: null == sequencia
          ? _value.sequencia
          : sequencia // ignore: cast_nullable_to_non_nullable
              as Sequencia,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParteImplCopyWith<$Res> implements $ParteCopyWith<$Res> {
  factory _$$ParteImplCopyWith(
          _$ParteImpl value, $Res Function(_$ParteImpl) then) =
      __$$ParteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nome, Ritmo ritmo, Sequencia sequencia});
}

/// @nodoc
class __$$ParteImplCopyWithImpl<$Res>
    extends _$ParteCopyWithImpl<$Res, _$ParteImpl>
    implements _$$ParteImplCopyWith<$Res> {
  __$$ParteImplCopyWithImpl(
      _$ParteImpl _value, $Res Function(_$ParteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? ritmo = null,
    Object? sequencia = null,
  }) {
    return _then(_$ParteImpl(
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      ritmo: null == ritmo
          ? _value.ritmo
          : ritmo // ignore: cast_nullable_to_non_nullable
              as Ritmo,
      sequencia: null == sequencia
          ? _value.sequencia
          : sequencia // ignore: cast_nullable_to_non_nullable
              as Sequencia,
    ));
  }
}

/// @nodoc

class _$ParteImpl implements _Parte {
  const _$ParteImpl(
      {required this.nome, required this.ritmo, required this.sequencia});

  @override
  final String nome;
  @override
  final Ritmo ritmo;
  @override
  final Sequencia sequencia;

  @override
  String toString() {
    return 'Parte(nome: $nome, ritmo: $ritmo, sequencia: $sequencia)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParteImpl &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.ritmo, ritmo) || other.ritmo == ritmo) &&
            (identical(other.sequencia, sequencia) ||
                other.sequencia == sequencia));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nome, ritmo, sequencia);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParteImplCopyWith<_$ParteImpl> get copyWith =>
      __$$ParteImplCopyWithImpl<_$ParteImpl>(this, _$identity);
}

abstract class _Parte implements Parte {
  const factory _Parte(
      {required final String nome,
      required final Ritmo ritmo,
      required final Sequencia sequencia}) = _$ParteImpl;

  @override
  String get nome;
  @override
  Ritmo get ritmo;
  @override
  Sequencia get sequencia;
  @override
  @JsonKey(ignore: true)
  _$$ParteImplCopyWith<_$ParteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
