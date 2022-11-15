import 'package:shared_preferences/shared_preferences.dart';
import 'package:sia_fect/core/const/strings.dart';

class AuthServices {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String?> getToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(Strings.userToken);
  }

  Future saveToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    String userToken = token;
    await prefs.setString(Strings.userToken, userToken);
    return;
  }

  Future logOut() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.clear();
    return;
  }

  Future getUserData() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('user');
  }

  Future saveUserData(String user) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString("user", user);
    return;
  }
}
