import 'package:shared_preferences/shared_preferences.dart';

enum PreferenceKey{
  name,
  email,
  loggedIn,
  ProfileData,
  token,
  phone,
  language,
  notification,
  theme,
  darkTheme,
  lightTheme,

}
class PreferenceUtils {
  static Future<SharedPreferences> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance! ;
  }

  static String getString(PreferenceKey key, [String defValue = '']) {
    return _prefsInstance!.getString(key.name) ?? defValue ?? "";
  }

  static Future<bool> setString(PreferenceKey key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key.name, value) ;
  }
  static bool getBool(PreferenceKey key, [bool defValue = false]) {
    return _prefsInstance!.getBool(key.name) ?? defValue ?? false;
  }

  static Future<bool> setBool(PreferenceKey key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key.name, value) ;
  }
}