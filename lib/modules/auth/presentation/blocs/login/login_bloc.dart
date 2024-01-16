import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocabulary_day_by_day/di/di.dart';
import 'package:vocabulary_day_by_day/modules/auth/domain/entities/user.entity.dart';
import 'package:vocabulary_day_by_day/modules/auth/domain/use_cases/auth.use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';


part 'login_event.dart';

part 'login_state.dart';

part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginSubmitted>(_onSubmitted);
  }

  final UserLoginUseCase _userLoginUseCase = getIt.get();

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      state.copyWith(
        submitStatus: state.submitStatus.copyWith(
          status: FormzSubmissionStatus.inProgress,
        ),
      ),
    );
    try {
      final res = await _userLoginUseCase.call(
        UserLoginCredentialsEntity(
          username: event.username,
          password: event.password,
        ),
      );
      res.fold(
        (l) => emit(
          state.copyWith(
            submitStatus: state.submitStatus.copyWith(
              status: FormzSubmissionStatus.failure,
              message: l.message,
            ),
          ),
        ),
        (r) => emit(
          state.copyWith(
            submitStatus: state.submitStatus.copyWith(
              status: FormzSubmissionStatus.success,
            ),
            userLoginResponse: r,
          ),
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          submitStatus: state.submitStatus.copyWith(
            status: FormzSubmissionStatus.failure,
            message: null,
          ),
        ),
      );
    }
  }
}
