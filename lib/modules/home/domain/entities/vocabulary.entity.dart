import 'package:vocabulary_day_by_day/common/utils/datetime.util.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vocabulary_day_by_day/modules/home/enum.dart';

part 'vocabulary.entity.g.dart';

@JsonSerializable(explicitToJson: true)
@JsonSerializableDateTime()
class VocabularyEntity {
  final int id;
  final VocabularyType type;
  final String word;
  final String? pronoun;
  final String? explain;
  final String? example;

  VocabularyEntity({
    required this.id,
    required this.type,
    required this.word,
    this.pronoun,
    this.explain ,
    this.example,
  });

  factory VocabularyEntity.fromJson(Map<String, dynamic> json) =>
      _$VocabularyEntityFromJson(json);

  Map<String, dynamic> toJson() => _$VocabularyEntityToJson(this);
}
