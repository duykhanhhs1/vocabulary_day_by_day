part of 'home_bloc.dart';

final class HomeState extends Equatable {
   HomeState({
    this.getUserDataStatus = ResponseStatus.initial,
    DateTime? currentDate,
  }) : currentDate = currentDate ?? DateTime.now();

  final ResponseStatus getUserDataStatus;
  final DateTime currentDate;

  HomeState copyWith({
    ResponseStatus? getUserDataStatus,
    DateTime? currentDate,
  }) {
    return HomeState(
      getUserDataStatus: getUserDataStatus ?? this.getUserDataStatus,
      currentDate: currentDate ?? this.currentDate,
    );
  }

  @override
  List<Object?> get props => [getUserDataStatus, currentDate];
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
