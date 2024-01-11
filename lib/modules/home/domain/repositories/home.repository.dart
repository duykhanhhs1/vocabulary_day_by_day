import 'package:vocabulary_day_by_day/common/configs/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:vocabulary_day_by_day/modules/home/domain/entities/vocabulary.entity.dart';

abstract class IHomeRepository {
  Future<Either<Failure, List<VocabularyEntity>>> getVocabularies(DateTime date);
}
