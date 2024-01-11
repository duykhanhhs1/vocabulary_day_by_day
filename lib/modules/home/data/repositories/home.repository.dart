import 'package:vocabulary_day_by_day/common/configs/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vocabulary_day_by_day/modules/home/data/data_sources/home.datasource.dart';
import 'package:vocabulary_day_by_day/modules/home/domain/entities/vocabulary.entity.dart';
import 'package:vocabulary_day_by_day/modules/home/domain/repositories/home.repository.dart';

@Injectable(as: IHomeRepository)
class HomeRepository implements IHomeRepository {
  final IHomeDataSource authDataSource;

  HomeRepository({required this.authDataSource});


  @override
  Future<Either<Failure, List<VocabularyEntity>>> getVocabularies(DateTime date) {
    return  authDataSource.getVocabularies(date);
  }
}
