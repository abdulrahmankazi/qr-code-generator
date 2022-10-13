import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _preferences;
  static const authToken = 'authToken';

  static const darkTheme = 'isDarkTheme';

  static Future<SharedPreferences> init() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences;
  }

  static Future<bool> setDarkTheme(String darkTheme, bool value) async =>
      await _preferences.setBool(darkTheme, value);

  //sets
  static Future<bool> setBool(String key, bool value) async =>
      await _preferences.setBool(key, value);

  static Future<bool> setDouble(String key, double value) async =>
      await _preferences.setDouble(key, value);

  static Future<bool> setInt(String key, int value) async =>
      await _preferences.setInt(key, value);

  static Future<bool> setString(String key, String value) async =>
      await _preferences.setString(key, value);

  static Future<bool> setStringList(String key, List<String> value) async =>
      await _preferences.setStringList(key, value);

  //gets

  static String? getAuthToken() => _preferences.getString(authToken);
  // static String? getBaseUrl() => _preferences.getString(baseUrl);

  static bool? isDarkTheme() => _preferences.getBool(darkTheme);

  static bool? getBool(String key) => _preferences.getBool(key);

  static double? getDouble(String key) => _preferences.getDouble(key);

  static int? getInt(String key) => _preferences.getInt(key);

  static String? getString(String key) => _preferences.getString(key);

  static List<String>? getStringList(String key) =>
      _preferences.getStringList(key);

  //deletes..
  static Future<bool> remove(String key) async =>
      await _preferences.remove(key);

  static Future<bool> clear() async => await _preferences.clear();
}
