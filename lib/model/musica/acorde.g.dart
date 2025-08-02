// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acorde.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AcordeImpl _$$AcordeImplFromJson(Map<String, dynamic> json) => _$AcordeImpl(
      id: (json['id'] as num?)?.toInt(),
      nome: json['nome'] as String,
      instrumento: json['instrumento'] as String,
      imagemUrl: json['imagem_url'] as String,
      afinacao: json['afinacao'] as String,
      posicoes:
          Posicoes.fromJson(json['posicoes_json'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AcordeImplToJson(_$AcordeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'instrumento': instance.instrumento,
      'imagem_url': instance.imagemUrl,
      'afinacao': instance.afinacao,
      'posicoes_json': instance.posicoes,
    };
