import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleStorageService {
  late final SharedPreferences _prefs;
  late final FlutterSecureStorage _secureStorage;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    _secureStorage = const FlutterSecureStorage();
  }

  /// String encrypted methods
  Future<void> saveEncryptString(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String> getDecryptString(String key) async {
    return await _secureStorage.read(key: key) ?? '';
  }

  /// String methods
  void saveString(String key, String value) {
    _prefs.setString(key, value);
  }

  void getString(String key) {
    _prefs.getString(key);
  }

  /// StringList methods
  void saveStringList(String key, List<String>? value) {
    _prefs.setStringList(key, value ?? []);
  }

  void addValueToStringList(String key, String value) {
    List<String> list = _prefs.getStringList(key) ?? [];
    if (!list.contains(value)) {
      list.add(value);
      _prefs.setStringList(key, list);
    }
  }

  void removeValueToStringList(String key, String value) {
    List<String> list = _prefs.getStringList(key) ?? [];
    if (list.contains(value)) {
      list.remove(value);
      _prefs.setStringList(key, list);
    }
  }

  List<String> getStringList(String key) {
    return _prefs.getStringList(key) ?? [];
  }
}
