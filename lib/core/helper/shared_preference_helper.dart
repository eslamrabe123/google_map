import '../../exports.dart';

class SharedPreferencesHelper {
  final SharedPreferences _sharedPreferences;
  const SharedPreferencesHelper(this._sharedPreferences);

  Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await _sharedPreferences.setString(key, value);
    if (value is int) return await _sharedPreferences.setInt(key, value);
    if (value is double) return await _sharedPreferences.setDouble(key, value);
    if (value is bool) return await _sharedPreferences.setBool(key, value);

    return await _sharedPreferences.setString(key, value);
  }

  dynamic loadData({
    required String key,
  }) {
    return _sharedPreferences.get(key);
  }

  Future<bool> removeData({
    required String key,
  }) async {
    return await _sharedPreferences.remove(key);
  }

  Future<bool> cleanData() async {
    return await _sharedPreferences.clear();
  }
}
