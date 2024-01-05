import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

abstract class Failure extends Equatable {
  final ErrorEntity? error;

  const Failure({this.error});

  @override
  List<Object> get props => [];

  String? get message => error?.message;

  bool get networkIsNotAvailable => error?.networkIsNotAvailable ?? false;

  @override
  String toString() {
    return "$runtimeType: error: ${error.toString()}";
  }
}
// General failures
class SystemFailure extends Failure {
  const SystemFailure({ErrorEntity? error}) : super(error: error);
}

class CacheFailure extends Failure {
  const CacheFailure({ErrorEntity? error}) : super(error: error);
}

class SyncFailure extends Failure {}

class ErrorEntity {
  final String? message;
  final int? statusCode;
  final bool? networkIsNotAvailable;

  ErrorEntity({
    this.message,
    this.statusCode,
    this.networkIsNotAvailable,
  });

  @override
  String toString() {
    return "{message: $message, statusCode: $statusCode}";
  }
}
