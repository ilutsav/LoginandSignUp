import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mudita/login/bloc/auth/login_auth.dart';
import 'package:mudita/screens/signup_page.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final loginAuth = LoginAuth();

  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_handleLoginButtonPressed);
    on<NavigateToSignUpEvent>(_navigateToSignUpEvent);
  }

  void _handleLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      bool loginSucess = await loginAuth.Login(event.email, event.password);
      if (loginSucess) {
        emit(LoginSuccess());
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  FutureOr<void> _navigateToSignUpEvent(
      NavigateToSignUpEvent event, Emitter<LoginState> emit) {
    emit(NavigateToSignUpState());
  }
}
