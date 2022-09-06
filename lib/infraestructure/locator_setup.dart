import 'package:get_it/get_it.dart';
import 'package:wedding_jc/infraestructure/navigation/navigator_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
