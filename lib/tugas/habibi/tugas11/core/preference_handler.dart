import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static SharedPreferences? _prefs;

  static const String _keyIsLogin = 'isLogin_habibi_tugas11';
  static const String _keyUsername = 'username_habibi_tugas11';

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<SharedPreferences> _getInstance() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  static Future<void> setLogin(bool isLogin) async {
    final prefs = await _getInstance();
    await prefs.setBool(_keyIsLogin, isLogin);
  }

  static bool get isLogin {
    return _prefs?.getBool(_keyIsLogin) ?? false;
  }

  static Future<void> setUsername(String username) async {
    final prefs = await _getInstance();
    await prefs.setString(_keyUsername, username);
  }

  static String get username {
    return _prefs?.getString(_keyUsername) ?? 'Habibi';
  }

  static Future<void> logout() async {
    final prefs = await _getInstance();
    await prefs.setBool(_keyIsLogin, false);
    await prefs.remove(_keyUsername);
  }
}
