import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_jc/infrastructure/auth/auth_service.dart';
import 'package:wedding_jc/infrastructure/locator_setup.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthService _firebaseAuthService = locator<AuthService>();
  SignUpBloc() : super(SignUpInitial()) {
    on<InputEmailEvent>((event, emit) {
      emit(ValidState(
        email: event.email,
      ));
    });
    on<InputPasswordEvent>((event, emit) {
      emit(ValidState(
        email: (state as ValidState).email,
        password: event.password,
      ));
    });
    on<LoginEvent>((event, emit) async {
      try {
        await _firebaseAuthService.login((state as ValidState).email!, (state as ValidState).password!);
      } catch (e) {
        log(e.toString());
      }
    });
    on<RegisterWithGoogleEvent>((event, emit) async {
      try {
        await _firebaseAuthService.signInWithGoogle();
      } catch (e) {
        log('sing in');
        log(e.toString());
      }
    });
  }
}
