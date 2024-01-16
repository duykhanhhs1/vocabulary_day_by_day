part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required LoadStatus loadStatus,
    required List<VocabularyEntity> vocabularies,
    required DateTime currentDate,
  }) = _HomeState;

  factory HomeState.initData() => HomeState(
        loadStatus: LoadStatus.loading,
        vocabularies: [],
        currentDate: DateTime.now(),
      );
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

enum LoadStatus {
  loading,
  error,
  success;

  bool get isLoading => this == loading;

  bool get isError => this == error;

  bool get isSuccess => this == success;
}
