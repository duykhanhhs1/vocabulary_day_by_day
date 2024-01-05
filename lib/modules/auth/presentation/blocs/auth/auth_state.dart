part of 'auth_bloc.dart';

final class AuthState extends Equatable {
  const AuthState({
    this.getUserDataStatus = ResponseStatus.initial,
    this.isLoggedIn = false,
  });

  final ResponseStatus getUserDataStatus;
  final bool isLoggedIn;

  AuthState copyWith({
    ResponseStatus? getUserDataStatus,
    bool? isLoggedIn,
  }) {
    return AuthState(
      getUserDataStatus: getUserDataStatus ?? this.getUserDataStatus,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }

  @override
  List<Object> get props => [getUserDataStatus, isLoggedIn];
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
