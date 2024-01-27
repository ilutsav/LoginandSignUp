import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../sign_auth.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final signUpAuth = SignUpAuth();
  SignupBloc() : super(SignupInitial()) {
    on<ContinueButtonPressed>(_handleContinueButtonPressed);
    on<SigninPressed>(_handleSigninPressed);
  }

  FutureOr<void> _handleContinueButtonPressed(
      ContinueButtonPressed event, Emitter<SignupState> emit) async {
    emit(SignupLoading());
    try {
      bool isSignupSucess = await signUpAuth.signUp(
          event.name,
          event.email,
          event.password,
          event.gender,
          event.address,
          event.mobile,
          event.occupation,
          event.dob);
      if (isSignupSucess) {
        emit(SignupSuccess());
      }
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }

  FutureOr<void> _handleSigninPressed(
      SigninPressed event, Emitter<SignupState> emit) {
    emit(NavigateToLoginState());
  }
}
