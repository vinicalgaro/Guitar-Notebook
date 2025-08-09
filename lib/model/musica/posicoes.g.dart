// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posicoes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PosicoesImpl _$$PosicoesImplFromJson(Map<String, dynamic> json) =>
    _$PosicoesImpl(
      trasteInicial: (json['traste_inicial'] as num).toInt(),
      fingers: (json['fingers'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      frets: (json['frets'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$PosicoesImplToJson(_$PosicoesImpl instance) =>
    <String, dynamic>{
      'traste_inicial': instance.trasteInicial,
      'fingers': instance.fingers,
      'frets': instance.frets,
    };
