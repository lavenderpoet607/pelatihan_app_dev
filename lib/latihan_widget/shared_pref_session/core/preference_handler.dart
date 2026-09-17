import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static const _keyIsLogin = 'isLogin';
  static const _keyUsername = 'username';
  static const _keyLoginTime = 'loginTime';

  static Future<void> setLogin(bool isLogin) async {
    final prefs = _prefs ?? await SharedPreferences.getInstance();
    _prefs = prefs;
    await prefs.setBool(_keyIsLogin, isLogin);
  }

  static bool get isLogin {
    return _prefs?.getBool(_keyIsLogin) ?? false;
  }

  static Future<void> setUsername(String username) async {
    final prefs = _prefs ?? await SharedPreferences.getInstance();
    _prefs = prefs;
    await prefs.setString(_keyUsername, username);
  }

  static String get username {
    return _prefs?.getString(_keyUsername) ?? 'Pengguna Demo';
  }

  static Future<void> setLoginTime(String time) async {
    final prefs = _prefs ?? await SharedPreferences.getInstance();
    _prefs = prefs;
    await prefs.setString(_keyLoginTime, time);
  }

  static String get loginTime {
    return _prefs?.getString(_keyLoginTime) ?? '-';
  }

  static Future<void> logOut() async {
    final prefs = _prefs ?? await SharedPreferences.getInstance();
    _prefs = prefs;
    await prefs.remove(_keyIsLogin);
    await prefs.remove(_keyUsername);
    await prefs.remove(_keyLoginTime);
  }
}
