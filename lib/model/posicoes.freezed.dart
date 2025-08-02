// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posicoes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Posicoes _$PosicoesFromJson(Map<String, dynamic> json) {
  return _Posicoes.fromJson(json);
}

/// @nodoc
mixin _$Posicoes {
  @JsonKey(name: 'traste_inicial')
  int get trasteInicial => throw _privateConstructorUsedError;
  List<int> get dedos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PosicoesCopyWith<Posicoes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosicoesCopyWith<$Res> {
  factory $PosicoesCopyWith(Posicoes value, $Res Function(Posicoes) then) =
      _$PosicoesCopyWithImpl<$Res, Posicoes>;
  @useResult
  $Res call(
      {@JsonKey(name: 'traste_inicial') int trasteInicial, List<int> dedos});
}

/// @nodoc
class _$PosicoesCopyWithImpl<$Res, $Val extends Posicoes>
    implements $PosicoesCopyWith<$Res> {
  _$PosicoesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trasteInicial = null,
    Object? dedos = null,
  }) {
    return _then(_value.copyWith(
      trasteInicial: null == trasteInicial
          ? _value.trasteInicial
          : trasteInicial // ignore: cast_nullable_to_non_nullable
              as int,
      dedos: null == dedos
          ? _value.dedos
          : dedos // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PosicoesImplCopyWith<$Res>
    implements $PosicoesCopyWith<$Res> {
  factory _$$PosicoesImplCopyWith(
          _$PosicoesImpl value, $Res Function(_$PosicoesImpl) then) =
      __$$PosicoesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'traste_inicial') int trasteInicial, List<int> dedos});
}

/// @nodoc
class __$$PosicoesImplCopyWithImpl<$Res>
    extends _$PosicoesCopyWithImpl<$Res, _$PosicoesImpl>
    implements _$$PosicoesImplCopyWith<$Res> {
  __$$PosicoesImplCopyWithImpl(
      _$PosicoesImpl _value, $Res Function(_$PosicoesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trasteInicial = null,
    Object? dedos = null,
  }) {
    return _then(_$PosicoesImpl(
      trasteInicial: null == trasteInicial
          ? _value.trasteInicial
          : trasteInicial // ignore: cast_nullable_to_non_nullable
              as int,
      dedos: null == dedos
          ? _value._dedos
          : dedos // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PosicoesImpl implements _Posicoes {
  const _$PosicoesImpl(
      {@JsonKey(name: 'traste_inicial') required this.trasteInicial,
      required final List<int> dedos})
      : _dedos = dedos;

  factory _$PosicoesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PosicoesImplFromJson(json);

  @override
  @JsonKey(name: 'traste_inicial')
  final int trasteInicial;
  final List<int> _dedos;
  @override
  List<int> get dedos {
    if (_dedos is EqualUnmodifiableListView) return _dedos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dedos);
  }

  @override
  String toString() {
    return 'Posicoes(trasteInicial: $trasteInicial, dedos: $dedos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosicoesImpl &&
            (identical(other.trasteInicial, trasteInicial) ||
                other.trasteInicial == trasteInicial) &&
            const DeepCollectionEquality().equals(other._dedos, _dedos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, trasteInicial, const DeepCollectionEquality().hash(_dedos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PosicoesImplCopyWith<_$PosicoesImpl> get copyWith =>
      __$$PosicoesImplCopyWithImpl<_$PosicoesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PosicoesImplToJson(
      this,
    );
  }
}

abstract class _Posicoes implements Posicoes {
  const factory _Posicoes(
      {@JsonKey(name: 'traste_inicial') required final int trasteInicial,
      required final List<int> dedos}) = _$PosicoesImpl;

  factory _Posicoes.fromJson(Map<String, dynamic> json) =
      _$PosicoesImpl.fromJson;

  @override
  @JsonKey(name: 'traste_inicial')
  int get trasteInicial;
  @override
  List<int> get dedos;
  @override
  @JsonKey(ignore: true)
  _$$PosicoesImplCopyWith<_$PosicoesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
