import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:vocabulary_day_by_day/common/configs/keys.dart';
import 'package:vocabulary_day_by_day/common/configs/usecase.dart';
import 'package:vocabulary_day_by_day/di/di.dart';
import 'package:vocabulary_day_by_day/modules/auth/domain/entities/user.entity.dart';
import 'package:vocabulary_day_by_day/modules/auth/domain/use_cases/auth.use_case.dart';
import 'package:vocabulary_day_by_day/services/storages/app_storage.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<LoginPassed>(_onLoginPassed);
    on<SplashPassed>(_onSplashPassed);
    on<LogoutRequested>(_onLogoutRequested);
  }

  final GetProfileUseCase _getProfileUseCase = getIt.get();

  SharedPreferences get _prefs => AppStorage.instance.prefs;

  Future<void> _onLoginPassed(
    LoginPassed event,
    Emitter<AuthState> emit,
  ) async {
    _setTokens(
      accessToken: event.userLoginResponse.accessToken,
      refreshToken: event.userLoginResponse.refreshToken,
    );

    await _getUserData(emit);
  }

  Future<void> _getUserData(Emitter<AuthState> emit) async {
    try {
      final res = await _getProfileUseCase.call(NoParams());
      res.fold(
        (l) => emit(
          state.copyWith(
            getUserDataStatus: state.getUserDataStatus.copyWith(
              status: FormzSubmissionStatus.failure,
              message: l.message,
            ),
          ),
        ),
        (r) {
          emit(
            state.copyWith(
              getUserDataStatus: state.getUserDataStatus.copyWith(
                status: FormzSubmissionStatus.success,
              ),
              isLoggedIn: true,
            ),
          );
        },
      );
    } catch (_) {
      emit(
        state.copyWith(
          getUserDataStatus: state.getUserDataStatus.copyWith(
            status: FormzSubmissionStatus.failure,
            message: null,
          ),
        ),
      );
    }
  }

  Future<void> _setTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _prefs.setString(AppStorageKey.ACCESS_TOKEN, accessToken);
    await _prefs.setString(AppStorageKey.REFRESH_TOKEN, refreshToken);
  }

  Future<void> _removeTokens() async {
    await _prefs.remove(AppStorageKey.ACCESS_TOKEN);
    await _prefs.remove(AppStorageKey.REFRESH_TOKEN);
  }

  FutureOr<void> _onSplashPassed(
      SplashPassed event, Emitter<AuthState> emit) async {
    await _getUserData(emit);
  }

  FutureOr<void> _onLogoutRequested(
      LogoutRequested event, Emitter<AuthState> emit) {
    _removeTokens();
    emit(
      state.copyWith(
        isLoggedIn: false,
        getUserDataStatus: ResponseStatus.initial,
      ),
    );
  }
}
