part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class HomeDatePicked extends HomeEvent {
  const HomeDatePicked({
    required this.date,
  });

  final DateTime date;

  @override
  List<Object> get props => [date];
}
