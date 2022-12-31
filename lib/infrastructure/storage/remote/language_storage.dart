import 'package:wedding_jc/domain/language.dart';
import 'package:wedding_jc/infrastructure/storage/remote/remote_storage_interface.dart';

class LanguageStorage extends RemoteStorageInterface<Language> {
  LanguageStorage() : super('language');

  @override
  Future<void> add(Language t) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  // TODO: implement all
  Future<List<Language>> get all => throw UnimplementedError();

  @override
  // TODO: implement all$
  Stream<List<Language>> get all$ => throw UnimplementedError();

  @override
  Future<Language> get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<void> remove(Language t) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<void> update(Language t) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
