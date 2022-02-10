import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static final AppPreference _appPreference = AppPreference._internal();

  factory AppPreference() {
    return _appPreference;
  }

  AppPreference._internal();

  SharedPreferences? preferences;

  Future<void> initialAppPreference() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future setStringData(String key, String value) async {
    await preferences?.setString(key, value);
  }

  getStringData(String key) {
    return preferences?.get(key);
  }

  Future setBoolData(String key, bool value) async {
    await preferences?.setBool(key, value);
  }

  getBoolData(String key) {
    return preferences?.get(key);
  }

  Future clearSharedPreferences() async {
    await preferences?.clear();
  }
}
