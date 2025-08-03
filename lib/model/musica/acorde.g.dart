// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acorde.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AcordeImpl _$$AcordeImplFromJson(Map<String, dynamic> json) => _$AcordeImpl(
      id: (json['id'] as num?)?.toInt(),
      nome: json['nome'] as String,
      fullName: json['full_name'] as String,
      tipo: $enumDecode(_$TipoAcordeEnumMap, json['tipo']),
      instrumento: json['instrumento'] as String,
      afinacao: json['afinacao'] as String,
      posicoes:
          Posicoes.fromJson(json['posicoes_json'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AcordeImplToJson(_$AcordeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'full_name': instance.fullName,
      'tipo': _$TipoAcordeEnumMap[instance.tipo]!,
      'instrumento': instance.instrumento,
      'afinacao': instance.afinacao,
      'posicoes_json': instance.posicoes,
    };

const _$TipoAcordeEnumMap = {
  TipoAcorde.maior: 'maior',
  TipoAcorde.menor: 'menor',
  TipoAcorde.outro: 'outro',
};
