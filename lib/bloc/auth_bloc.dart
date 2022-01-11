import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_fundamental/services/auth_service.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthByEmailPassword) {
        try {
          emit(AuthLoading());
          print('loading');

          final result = await AuthService()
              .loginByEmailPassword(event.email, event.password);

          print(result);
          emit(AuthSuccess(result['token']));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthByGoogle) {
        try {
          emit(AuthLoading());
          final result = await AuthService().loginByGoogle();
          emit(AuthSuccess(result['token']));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthByFacebook) {
        try {
          emit(AuthLoading());
          final result = await AuthService().loginByFacebook();
          emit(AuthSuccess(result['token']));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
