import 'package:firebase_database/firebase_database.dart';
import 'package:wedding_jc/infrastructure/auth/auth_service.dart';
import 'package:wedding_jc/infrastructure/locator_setup.dart';
import 'package:wedding_jc/infrastructure/storage/locale_storage_service.dart';
import 'package:wedding_jc/resources/storage_keys.dart';

class DatabaseService {
  late final String _token;
  late final FirebaseDatabase _database;
  late final DatabaseReference _ref;

  Future<void> initialize() async {
    LocaleStorageService storageService = locator<LocaleStorageService>();
    locator<AuthService>().isAuthenticated$.listen((isAuthenticated) async {
      _token = await storageService.getDecryptString(StorageKeys.keyEncryptToken);
    });

    _database = FirebaseDatabase.instance;
    _ref = FirebaseDatabase.instance.ref();
  }

  ///https://firebase.google.com/docs/database/rest/save-data
}
