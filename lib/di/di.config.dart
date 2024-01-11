// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:vocabulary_day_by_day/modules/auth/data/data_sources/auth.datasource.dart'
    as _i3;
import 'package:vocabulary_day_by_day/modules/auth/data/repositories/auth.repository.dart'
    as _i5;
import 'package:vocabulary_day_by_day/modules/auth/domain/repositories/auth.repository.dart'
    as _i4;
import 'package:vocabulary_day_by_day/modules/auth/domain/use_cases/auth.use_case.dart'
    as _i9;
import 'package:vocabulary_day_by_day/modules/home/data/data_sources/home.datasource.dart'
    as _i6;
import 'package:vocabulary_day_by_day/modules/home/data/repositories/home.repository.dart'
    as _i8;
import 'package:vocabulary_day_by_day/modules/home/domain/repositories/home.repository.dart'
    as _i7;
import 'package:vocabulary_day_by_day/modules/home/domain/use_cases/home.use_case.dart'
    as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.IAuthDataSource>(() => _i3.UserDataSource());
    gh.factory<_i4.IAuthRepository>(
        () => _i5.AuthRepository(authDataSource: gh<_i3.IAuthDataSource>()));
    gh.factory<_i6.IHomeDataSource>(() => _i6.UserDataSource());
    gh.factory<_i7.IHomeRepository>(
        () => _i8.HomeRepository(authDataSource: gh<_i6.IHomeDataSource>()));
    gh.factory<_i9.UserLoginUseCase>(
        () => _i9.UserLoginUseCase(repository: gh<_i4.IAuthRepository>()));
    gh.factory<_i9.GetProfileUseCase>(
        () => _i9.GetProfileUseCase(repository: gh<_i4.IAuthRepository>()));
    gh.factory<_i10.GetVocabulariesUseCase>(() =>
        _i10.GetVocabulariesUseCase(repository: gh<_i7.IHomeRepository>()));
    return this;
  }
}
