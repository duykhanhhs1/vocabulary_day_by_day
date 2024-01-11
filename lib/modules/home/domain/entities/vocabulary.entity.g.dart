// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VocabularyEntity _$VocabularyEntityFromJson(Map<String, dynamic> json) =>
    VocabularyEntity(
      id: json['id'] as int,
      type: $enumDecode(_$VocabularyTypeEnumMap, json['type']),
      word: json['word'] as String,
      pronoun: json['pronoun'] as String?,
      explain: json['explain'] as String?,
      example: json['example'] as String?,
    );

Map<String, dynamic> _$VocabularyEntityToJson(VocabularyEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$VocabularyTypeEnumMap[instance.type]!,
      'word': instance.word,
      'pronoun': instance.pronoun,
      'explain': instance.explain,
      'example': instance.example,
    };

const _$VocabularyTypeEnumMap = {
  VocabularyType.noun: 'noun',
  VocabularyType.verb: 'verb',
  VocabularyType.adj: 'adj',
  VocabularyType.adv: 'adv',
};
