import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocabulary_day_by_day/di/di.dart';
import 'package:vocabulary_day_by_day/modules/home/domain/entities/vocabulary.entity.dart';
import 'package:vocabulary_day_by_day/modules/home/domain/use_cases/home.use_case.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initData()) {
    on<HomeInitialized>(_onHomeInitialized);
    on<HomeDatePicked>(_onHomeDatePicked);
    _onInit();
  }

  final GetVocabulariesUseCase _getVocabulariesUseCase = getIt.get();

  FutureOr<void> _onHomeDatePicked(
    HomeDatePicked event,
    Emitter<HomeState> emit,
  ) async {
    if (event.date.day == state.currentDate.day) {
      return;
    }
    emit(
      state.copyWith(currentDate: event.date),
    );
    await _getVocabularies(emit);
  }

  FutureOr<void> _onHomeInitialized(
    HomeInitialized event,
    Emitter<HomeState> emit,
  ) async {
    await _getVocabularies(emit);
  }

  Future<void> _getVocabularies(Emitter<HomeState> emit) async {
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
