part of 'login_bloc.dart';

@freezed
abstract class LoginState  with _$LoginState {
  const factory LoginState({
    @Default(ResponseStatus.initial) ResponseStatus submitStatus,
    UserLoginResponseEntity? userLoginResponse,
  }) = _LoginState;
}

@freezed
abstract class ResponseStatus with _$ResponseStatus {
  const factory ResponseStatus({
    required FormzSubmissionStatus status,
    String? message,
  }) = _ResponseStatus;

  static const initial = ResponseStatus(
    status: FormzSubmissionStatus.initial,
  );
}
