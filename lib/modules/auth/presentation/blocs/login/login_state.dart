part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.submitStatus = ResponseStatus.initial,
    this.userLoginResponse,
  });

  final ResponseStatus submitStatus;
  final UserLoginResponseEntity? userLoginResponse;

  LoginState copyWith({
    ResponseStatus? submitStatus,
    UserLoginResponseEntity? userLoginResponse,
  }) {
    return LoginState(
      submitStatus: submitStatus ?? this.submitStatus,
      userLoginResponse: userLoginResponse ?? this.userLoginResponse,
    );
  }

  @override
  List<Object?> get props => [submitStatus, userLoginResponse];
}

class ResponseStatus extends Equatable {
  final FormzSubmissionStatus status;
  final String? message;

  const ResponseStatus({required this.status, this.message});

  static const initial = ResponseStatus(
    status: FormzSubmissionStatus.initial,
  );

  ResponseStatus copyWith({
    FormzSubmissionStatus? status,
    String? message,
  }) {
    return ResponseStatus(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, message];
}
