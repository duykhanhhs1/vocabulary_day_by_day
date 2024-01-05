import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeDatePicked>(_onHomeDatePicked);
  }


  Future<void> _onHomeDatePicked(
    HomeDatePicked event,
    Emitter<HomeState> emit,
  ) async {
    if (event.date.day == state.currentDate.day) {
      return;
    }
    emit(
      state.copyWith(currentDate: event.date),
    );
  }
}
