// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acorde.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AcordeImpl _$$AcordeImplFromJson(Map<String, dynamic> json) => _$AcordeImpl(
  id: (json['id'] as num).toInt(),
  nome: json['nome'] as String,
  tipo: $enumDecode(_$TipoAcordeEnumMap, json['tipo']),
  cordas: (json['cordas'] as num).toInt(),
  posicoes: Posicoes.fromJson(json['posicoes_json'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AcordeImplToJson(_$AcordeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'tipo': _$TipoAcordeEnumMap[instance.tipo]!,
      'cordas': instance.cordas,
      'posicoes_json': instance.posicoes,
    };

const _$TipoAcordeEnumMap = {
  TipoAcorde.maior: 'maior',
  TipoAcorde.menor: 'menor',
  TipoAcorde.outro: 'outro',
};
