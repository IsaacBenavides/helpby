import 'package:shared_preferences/shared_preferences.dart';

class LocalDataRepository {
  // Using the sharedpreferences library, the token is stored in the device's storage to later know if the user is already logged in or not.
  // it can also be used to store any information you want. It is just creating a set method and a get method
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs;

  LocalDataRepository._();

  static final LocalDataRepository instance = LocalDataRepository._();

  Future<String> getTokenStorage() async {
    prefs = await _prefs;
    String token = await prefs.getString("token");
    return token;
  }

  setTokenStorage(String token) async {
    prefs = await _prefs;
    await prefs.setString("token", token);
  }
}
