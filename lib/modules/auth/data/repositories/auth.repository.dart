import 'package:vocabulary_day_by_day/common/configs/usecase.dart';
import 'package:vocabulary_day_by_day/modules/auth/data/data_sources/auth.datasource.dart';
import 'package:vocabulary_day_by_day/modules/auth/domain/entities/user.entity.dart';
import 'package:vocabulary_day_by_day/modules/auth/domain/repositories/auth.repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  final IAuthDataSource authDataSource;

  AuthRepository({required this.authDataSource});

  @override
  Future<Either<Failure, UserLoginResponseEntity>> loginUser(
      UserLoginCredentialsEntity user)  {
    return  authDataSource.loginUser(user);
  }

  @override
  Future<Either<Failure, UserEntity>> getProfile() {
    return  authDataSource.getProfile();

  }
}
