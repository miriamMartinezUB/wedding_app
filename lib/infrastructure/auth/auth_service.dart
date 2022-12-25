import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wedding_jc/infrastructure/auth/firebase_options.dart';

class AuthService {
  late final FirebaseAuth _firebaseAuth;

  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: defaultOptions,
    );
    _firebaseAuth = FirebaseAuth.instance;
  }

  Stream<bool> get isAuthenticated$ => _firebaseAuth.idTokenChanges().map((User? user) => user != null);

  bool get isAuthenticated {
    bool isAuthenticated = false;
    _firebaseAuth.idTokenChanges().listen((User? user) {
      isAuthenticated = user != null;
    });
    return isAuthenticated;
  }

  User? get user => _firebaseAuth.currentUser;

  Future<User?> signInWithGoogle() async {
    User? user;
    // The `GoogleAuthProvider` can only be used while running on the web
    GoogleAuthProvider authProvider = GoogleAuthProvider();
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithPopup(authProvider);
      user = userCredential.user;
    } catch (e) {
      log(e.toString());
    }
    return user;
  }

  // Future<User?> signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //   if (googleUser == null) {
  //     throw FlutterError('Error on try to signIn, we get null user');
  //   }
  //   final googleAuth = await googleUser.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //   final authResult = await _firebaseAuth.signInWithCredential(credential);
  //   return authResult.user;
  // }

  Future<void> login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }
  }

  Future<void> logout() async => await _firebaseAuth.signOut();

  Future<void> register(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> changePassword(String newPassword) async {
    await user?.updatePassword(newPassword);
  }

  Future<void> deleteAccount() async {
    await user?.delete();
  }
}
