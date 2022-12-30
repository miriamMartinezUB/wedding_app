import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:wedding_jc/domain/person.dart';
import 'package:wedding_jc/infrastructure/firebase/firebase_service.dart';
import 'package:wedding_jc/infrastructure/locator_setup.dart';
import 'package:wedding_jc/infrastructure/storage/locale_storage_service.dart';
import 'package:wedding_jc/infrastructure/storage/remote/person_storage.dart';
import 'package:wedding_jc/resources/storage_keys.dart';

class AuthService {
  late final FirebaseAuth _firebaseAuth;
  late final LocaleStorageService _storageService;

  Future<void> initialize() async {
    _firebaseAuth = locator<FirebaseService>().firebaseAuth;
    _storageService = locator<LocaleStorageService>();
  }

  Stream<bool> get isAuthenticated$ => _firebaseAuth.idTokenChanges().distinct().map((User? user) => user != null);

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
    _saveAppUserFromUser(user!);

    return user;
  }

  Future<void> logout() async {
    _cleanAppUser();
    await _firebaseAuth.signOut();
  }

  Future<void> deleteAccount() async {
    _cleanAppUser();
    await user?.delete();
  }

  void _saveAppUserFromUser(User user) {
    _storageService.saveEncryptString(StorageKeys.keyEncryptToken, user.refreshToken!);

    PersonStorage().add(
      Person(
        id: user.uid,
        name: (user.displayName ?? '').split(' ').first,
        surnames: (user.displayName ?? '').split(' ').last,
        addedBy: user.uid,
      ),
    );
  }

  void _cleanAppUser() {
    _storageService.saveEncryptString(StorageKeys.keyEncryptToken, '');
  }
}
