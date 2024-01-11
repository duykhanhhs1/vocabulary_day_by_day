import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:vocabulary_day_by_day/di/di.dart';
import 'package:vocabulary_day_by_day/modules/home/domain/entities/vocabulary.entity.dart';
import 'package:vocabulary_day_by_day/modules/home/domain/use_cases/home.use_case.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeInitialized>(_onHomeInitialized);
    on<HomeDatePicked>(_onHomeDatePicked);
    _onInit();
  }

  final GetVocabulariesUseCase _getVocabulariesUseCase = getIt.get();

  void _onHomeDatePicked(
    HomeDatePicked event,
    Emitter<HomeState> emit,
  ) {
    if (event.date.day == state.currentDate.day) {
      return;
    }
    emit(
      state.copyWith(currentDate: event.date),
    );
  }

  FutureOr<void> _onHomeInitialized(
    HomeInitialized event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(loadStatus: LoadStatus.loading),
    );
    final res = await _getVocabulariesUseCase.call(state.currentDate);
    res.fold((l) {
      emit(
        state.copyWith(loadStatus: LoadStatus.error),
      );
    }, (r) {
      emit(
        state.copyWith(
          loadStatus: LoadStatus.success,
          vocabularies: r,
        ),
      );
    });
  }

  void _onInit() {
    add(const HomeInitialized());
  }
}
