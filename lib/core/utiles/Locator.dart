
import '../../exports.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  locator.registerSingleton<SharedPreferencesHelper>(
      SharedPreferencesHelper(locator<SharedPreferences>()));
  locator.registerLazySingleton(() => DioService());
  locator.registerLazySingleton(() => Validation());
  locator.registerLazySingleton(() => MediaHelper());

  //? Repositories
  locator.registerLazySingleton(() => GoogleMapRepository(locator<DioService>()));
}
