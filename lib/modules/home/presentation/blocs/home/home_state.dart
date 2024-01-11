part of 'home_bloc.dart';

final class HomeState extends Equatable {
  HomeState({
    this.getUserDataStatus = ResponseStatus.initial,
    this.loadStatus = LoadStatus.loading,
    List<VocabularyEntity>? vocabularies,
    DateTime? currentDate,
  })  : currentDate = currentDate ?? DateTime.now(),
        vocabularies = vocabularies ?? [];

  final ResponseStatus getUserDataStatus;
  final DateTime currentDate;
  final List<VocabularyEntity> vocabularies;
  final LoadStatus loadStatus;

  HomeState copyWith({
    ResponseStatus? getUserDataStatus,
    DateTime? currentDate,
    List<VocabularyEntity>? vocabularies,
    LoadStatus? loadStatus,
  }) {
    return HomeState(
      getUserDataStatus: getUserDataStatus ?? this.getUserDataStatus,
      currentDate: currentDate ?? this.currentDate,
      vocabularies: vocabularies ?? this.vocabularies,
      loadStatus: loadStatus ?? this.loadStatus,
    );
  }

  @override
  List<Object?> get props => [getUserDataStatus, currentDate, vocabularies];
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
enum LoadStatus {
  loading,
  error,
  success;

  bool get isLoading => this == loading;

  bool get isError => this == error;

  bool get isSuccess => this == success;
}
