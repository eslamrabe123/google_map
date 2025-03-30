import '../../exports.dart';

class LocalStorageHelper {
  const LocalStorageHelper._();

  static FlutterSecureStorage storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  static setOnBoardingDone() {
    locator<SharedPreferencesHelper>()
        .saveData(key: StorageConstants.onBoarding, value: true);
  }

  static getOnBoardingDone() {
    return locator<SharedPreferencesHelper>()
            .loadData(key: StorageConstants.onBoarding) ??
        false;
  }

  static setUserToken(String token) async {
    storage.write(key: StorageConstants.userToken, value: token);
  }

  static getUserToken() async {
    return await storage.read(key: StorageConstants.userToken) ?? '';
  }

  static setLanguage({required String lang}) {
    locator<SharedPreferencesHelper>()
        .saveData(key: StorageConstants.language, value: lang);
  }

  static getLanguage() {
    return locator<SharedPreferencesHelper>()
            .loadData(key: StorageConstants.language) ??
        'en';
  }

  static switchDarkOrLightMode({required bool isLightMode}) {
    locator<SharedPreferencesHelper>()
        .saveData(key: StorageConstants.themeMode, value: isLightMode);
  }

  static getThemeMode() {
    return locator<SharedPreferencesHelper>()
            .loadData(key: StorageConstants.themeMode) ??
        true;
  }

  static setUserLoggedIn(bool loggedIn) {
    locator<SharedPreferencesHelper>()
        .saveData(key: StorageConstants.loggedIn, value: loggedIn);
  }

  static getUserLoggedIn() {
    return locator<SharedPreferencesHelper>()
            .loadData(key: StorageConstants.loggedIn) ??
        false;
  }
}
