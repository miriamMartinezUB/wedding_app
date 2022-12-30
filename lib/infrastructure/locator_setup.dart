import 'package:get_it/get_it.dart';
import 'package:wedding_jc/infrastructure/auth/auth_service.dart';
import 'package:wedding_jc/infrastructure/language/language_service.dart';
import 'package:wedding_jc/infrastructure/navigation/navigator_service.dart';
import 'package:wedding_jc/infrastructure/storage/locale_storage_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => LanguageService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => LocaleStorageService());
}

Future<void> initializeConfigurationServices() async {
  /// WARNING: LocaleStorageService always have to be initialized first of others service
  /// because it has a dependency
  await locator<LocaleStorageService>().initialize();
  await locator<LanguageService>().initDelegate();
  await locator<AuthService>().initialize();
}
