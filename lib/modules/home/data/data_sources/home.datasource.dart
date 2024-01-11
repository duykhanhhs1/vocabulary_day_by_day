import 'package:vocabulary_day_by_day/common/configs/usecase.dart';
import 'package:vocabulary_day_by_day/common/utils/exception.util.dart';
import 'package:vocabulary_day_by_day/modules/home/domain/entities/vocabulary.entity.dart';
import 'package:vocabulary_day_by_day/modules/home/enum.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class IHomeDataSource {
  Future<Either<Failure, List<VocabularyEntity>>> getVocabularies(
      DateTime date);
}

@Injectable(as: IHomeDataSource)
class UserDataSource implements IHomeDataSource {
  @override
  Future<Either<Failure, List<VocabularyEntity>>> getVocabularies(
      DateTime date) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      //final response = await HttpService.instance.get(Endpoints.USER_PROFILE);
      return Right([
        VocabularyEntity(
          id: 0,
          type: VocabularyType.noun,
          word: "dog",
          pronoun: "d/o/g",
          explain: "An animal can say: wolf wolf",
          example: "This is a dog",
        ),
        VocabularyEntity(
          id: 1,
          type: VocabularyType.verb,
          word: "run",
        ),
      ]);
    } catch (e) {
      return Left(ExceptionUtil.failure(e));
    }
  }
}
