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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Posicoes _$PosicoesFromJson(Map<String, dynamic> json) {
  return _Posicoes.fromJson(json);
}

/// @nodoc
mixin _$Posicoes {
  @JsonKey(name: 'traste_inicial')
  int get trasteInicial => throw _privateConstructorUsedError;
  List<int> get fingers => throw _privateConstructorUsedError;
  List<int> get frets => throw _privateConstructorUsedError;

  /// Serializes this Posicoes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Posicoes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PosicoesCopyWith<Posicoes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosicoesCopyWith<$Res> {
  factory $PosicoesCopyWith(Posicoes value, $Res Function(Posicoes) then) =
      _$PosicoesCopyWithImpl<$Res, Posicoes>;
  @useResult
  $Res call({
    @JsonKey(name: 'traste_inicial') int trasteInicial,
    List<int> fingers,
    List<int> frets,
  });
}

/// @nodoc
class _$PosicoesCopyWithImpl<$Res, $Val extends Posicoes>
    implements $PosicoesCopyWith<$Res> {
  _$PosicoesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Posicoes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trasteInicial = null,
    Object? fingers = null,
    Object? frets = null,
  }) {
    return _then(
      _value.copyWith(
            trasteInicial: null == trasteInicial
                ? _value.trasteInicial
                : trasteInicial // ignore: cast_nullable_to_non_nullable
                      as int,
            fingers: null == fingers
                ? _value.fingers
                : fingers // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            frets: null == frets
                ? _value.frets
                : frets // ignore: cast_nullable_to_non_nullable
                      as List<int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PosicoesImplCopyWith<$Res>
    implements $PosicoesCopyWith<$Res> {
  factory _$$PosicoesImplCopyWith(
    _$PosicoesImpl value,
    $Res Function(_$PosicoesImpl) then,
  ) = __$$PosicoesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'traste_inicial') int trasteInicial,
    List<int> fingers,
    List<int> frets,
  });
}

/// @nodoc
class __$$PosicoesImplCopyWithImpl<$Res>
    extends _$PosicoesCopyWithImpl<$Res, _$PosicoesImpl>
    implements _$$PosicoesImplCopyWith<$Res> {
  __$$PosicoesImplCopyWithImpl(
    _$PosicoesImpl _value,
    $Res Function(_$PosicoesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Posicoes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trasteInicial = null,
    Object? fingers = null,
    Object? frets = null,
  }) {
    return _then(
      _$PosicoesImpl(
        trasteInicial: null == trasteInicial
            ? _value.trasteInicial
            : trasteInicial // ignore: cast_nullable_to_non_nullable
                  as int,
        fingers: null == fingers
            ? _value._fingers
            : fingers // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        frets: null == frets
            ? _value._frets
            : frets // ignore: cast_nullable_to_non_nullable
                  as List<int>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PosicoesImpl implements _Posicoes {
  const _$PosicoesImpl({
    @JsonKey(name: 'traste_inicial') required this.trasteInicial,
    required final List<int> fingers,
    required final List<int> frets,
  }) : _fingers = fingers,
       _frets = frets;

  factory _$PosicoesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PosicoesImplFromJson(json);

  @override
  @JsonKey(name: 'traste_inicial')
  final int trasteInicial;
  final List<int> _fingers;
  @override
  List<int> get fingers {
    if (_fingers is EqualUnmodifiableListView) return _fingers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fingers);
  }

  final List<int> _frets;
  @override
  List<int> get frets {
    if (_frets is EqualUnmodifiableListView) return _frets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_frets);
  }

  @override
  String toString() {
    return 'Posicoes(trasteInicial: $trasteInicial, fingers: $fingers, frets: $frets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosicoesImpl &&
            (identical(other.trasteInicial, trasteInicial) ||
                other.trasteInicial == trasteInicial) &&
            const DeepCollectionEquality().equals(other._fingers, _fingers) &&
            const DeepCollectionEquality().equals(other._frets, _frets));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    trasteInicial,
    const DeepCollectionEquality().hash(_fingers),
    const DeepCollectionEquality().hash(_frets),
  );

  /// Create a copy of Posicoes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PosicoesImplCopyWith<_$PosicoesImpl> get copyWith =>
      __$$PosicoesImplCopyWithImpl<_$PosicoesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PosicoesImplToJson(this);
  }
}

abstract class _Posicoes implements Posicoes {
  const factory _Posicoes({
    @JsonKey(name: 'traste_inicial') required final int trasteInicial,
    required final List<int> fingers,
    required final List<int> frets,
  }) = _$PosicoesImpl;

  factory _Posicoes.fromJson(Map<String, dynamic> json) =
      _$PosicoesImpl.fromJson;

  @override
  @JsonKey(name: 'traste_inicial')
  int get trasteInicial;
  @override
  List<int> get fingers;
  @override
  List<int> get frets;

  /// Create a copy of Posicoes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PosicoesImplCopyWith<_$PosicoesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
