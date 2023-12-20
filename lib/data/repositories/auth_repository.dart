import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  static const String _keyUsername = 'username';
  static const String _keyPassword = 'password';

  late SharedPreferences _prefs;

  AuthRepository(this._prefs);

  Future<void> saveUserInfo(String username, String password) async {
    await _prefs.setString(_keyUsername, username);
    await _prefs.setString(_keyPassword, password);
  }

  Future<Map<String, String>> loadUserInfo() async {
    final username = _prefs.getString(_keyUsername) ?? '';
    final password = _prefs.getString(_keyPassword) ?? '';

    return {'username': username, 'password': password};
  }

  Future<void> removeUserInfo() async {
    await _prefs.remove(_keyUsername);
    await _prefs.remove(_keyPassword);
  }
}
