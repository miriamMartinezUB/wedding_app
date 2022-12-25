part of 'sign_up_bloc.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class ValidState extends SignUpState {
  final String? email;
  final String? password;
  final String? confirmPassword;

  ValidState({
    this.email,
    this.password,
    this.confirmPassword,
  });
}

class InValidState extends SignUpState {
  final String? errorEmailText;
  final String? errorPasswordText;
  final String? errorConfirmPasswordText;

  InValidState({
    this.errorEmailText,
    this.errorPasswordText,
    this.errorConfirmPasswordText,
  });
}
