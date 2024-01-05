part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class LoginPassed extends AuthEvent {
  const LoginPassed({
    required this.userLoginResponse,
  });

  final UserLoginResponseEntity userLoginResponse;

  @override
  List<Object> get props => [userLoginResponse];
}

final class SplashPassed extends AuthEvent {
  const SplashPassed();

  @override
  List<Object> get props => [];
}

final class LogoutRequested extends AuthEvent {
  const LogoutRequested();

  @override
  List<Object> get props => [];
}
