part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class InputEmailEvent extends SignUpEvent {
  final String email;

  InputEmailEvent(this.email);
}

class InputPasswordEvent extends SignUpEvent {
  final String password;

  InputPasswordEvent(this.password);
}

class LoginEvent extends SignUpEvent {}

class RegisterWithGoogleEvent extends SignUpEvent {}
