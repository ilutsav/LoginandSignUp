part of 'signup_bloc.dart';

@immutable
class SignupEvent {}

class ContinueButtonPressed extends SignupEvent {
  final String name;
  final String email;
  final String password;
  final String gender;
  final String address;
  final String mobile;
  final String occupation;
  final String dob;

  ContinueButtonPressed(
      {required this.name,
      required this.email,
      required this.password,
      required this.gender,
      required this.address,
      required this.mobile,
      required this.occupation,
      required this.dob});
}

class SigninPressed extends SignupEvent {}
