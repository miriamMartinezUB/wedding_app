import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  late final String _token;
  late final FirebaseDatabase _database;
  late final DatabaseReference _ref;

  Future<void> initialize() async {
    _database = FirebaseDatabase.instance;
    _ref = FirebaseDatabase.instance.ref();
  }

  ///https://firebase.google.com/docs/database/rest/save-data
}
