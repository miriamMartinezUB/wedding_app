import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wedding_jc/infrastructure/firebase/firebase_options.dart';

class FirebaseService {
  late final FirebaseAuth _firebaseAuth;
  late final FirebaseFirestore _fireStore;

  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: defaultOptions,
    );
    _firebaseAuth = FirebaseAuth.instance;
    _fireStore = FirebaseFirestore.instance;
  }

  FirebaseAuth get firebaseAuth => _firebaseAuth;
  FirebaseFirestore get fireStore => _fireStore;
}
