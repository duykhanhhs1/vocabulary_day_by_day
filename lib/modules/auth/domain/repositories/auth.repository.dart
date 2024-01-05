import 'package:vocabulary_day_by_day/common/configs/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:vocabulary_day_by_day/modules/auth/domain/entities/user.entity.dart';

abstract class IAuthRepository {
  Future<Either<Failure, UserLoginResponseEntity>> loginUser(
      UserLoginCredentialsEntity user);

  Future<Either<Failure, UserEntity>> getProfile();
}
