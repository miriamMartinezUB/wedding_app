import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_jc/infrastructure/auth/auth_service.dart';
import 'package:wedding_jc/infrastructure/locator_setup.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthService _firebaseAuthService = locator<AuthService>();
  SignUpBloc() : super(SignUpInitial()) {
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
