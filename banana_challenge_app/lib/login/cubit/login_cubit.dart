import 'dart:developer';

import 'package:banana_challenge_app/login/cubit/login_state.dart';
import 'package:banana_challenge_client/banana_challenge_client.dart';
import 'package:bloc/bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  final repo = RepositoryUser();

  Future<void> loginUser({
    required String username,
    required String password,
  }) async {
    emit(
      state.copyWith(
        status: LoginStatus.attempting,
      ),
    );

    try {
      final user = await repo.login(
        email: username,
        password: password,
      );

      if (user.id != null) {
        emit(
          state.copyWith(
            status: LoginStatus.success,
            username: user.username,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: LoginStatus.error,
            loginErrorMessage: 'Error al iniciar sesión',
          ),
        );
      }
    } catch (e, st) {
      emit(
        state.copyWith(
          loginErrorMessage: e.toString(),
          status: LoginStatus.error,
        ),
      );
      log('Error: $e\n$st');
    }
  }
}
