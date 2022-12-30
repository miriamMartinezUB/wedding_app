import 'package:wedding_jc/infrastructure/locator_setup.dart';
import 'package:wedding_jc/infrastructure/storage/locale_storage_service.dart';
import 'package:wedding_jc/resources/storage_keys.dart';

class HomeStorage {
  final LocaleStorageService localeStorageService = locator<LocaleStorageService>();

  Future<List<String>> get tasksDone async {
    return localeStorageService.getStringList(StorageKeys.keyDoneTasks);
  }

  Future<void> markTaskAsDone({required String taskId}) async {
    localeStorageService.addValueToStringList(StorageKeys.keyDoneTasks, taskId);
  }
}
