import 'package:shared_preferences/shared_preferences.dart';

class AuthPreferences {
  final Future<SharedPreferences> sharedPreferences;

  AuthPreferences({required this.sharedPreferences});

  static const AUTH_TOKEN = 'AUTH_TOKEN';
  static const USER_ID = 'USER_ID';
  static const NAME = 'NAME';
  static const USERNAME = 'USERNAME';
  static const EMAIL = 'EMAIL';
  static const PHOTO = 'PHOTO';

  Future<void> removeUser() async {
    removeTokenAuth();
    removeUserId();
    removeName();
    removeEmail();
    removePhoto();
  }

  Future<String?> get token async {
    final prefs = await sharedPreferences;
    return prefs.getString(AUTH_TOKEN) ?? null;
  }

  void setTokenAuth(String token) async {
    final prefs = await sharedPreferences;
    prefs.setString(AUTH_TOKEN, token);
  }

  void removeTokenAuth() async {
    final prefs = await sharedPreferences;
    prefs.remove(AUTH_TOKEN);
  }

  Future<int?> get userId async {
    final prefs = await sharedPreferences;
    return prefs.getInt(USER_ID) ?? null;
  }

  void setUserId(int userId) async {
    final prefs = await sharedPreferences;
    prefs.setInt(USER_ID, userId);
  }

  void removeUserId() async {
    final prefs = await sharedPreferences;
    prefs.remove(USER_ID);
  }

  Future<String?> get name async {
    final prefs = await sharedPreferences;
    return prefs.getString(NAME) ?? null;
  }

  void setName(String name) async {
    final prefs = await sharedPreferences;
    prefs.setString(NAME, name);
  }

  void removeName() async {
    final prefs = await sharedPreferences;
    prefs.remove(NAME);
  }

  Future<String?> get email async {
    final prefs = await sharedPreferences;
    return prefs.getString(EMAIL) ?? null;
  }

  void setEmail(String email) async {
    final prefs = await sharedPreferences;
    prefs.setString(EMAIL, email);
  }

  void removeEmail() async {
    final prefs = await sharedPreferences;
    prefs.remove(EMAIL);
  }

  Future<String?> get photo async {
    final prefs = await sharedPreferences;
    return prefs.getString(PHOTO) ?? null;
  }

  void setPhoto(String photo) async {
    final prefs = await sharedPreferences;
    prefs.setString(PHOTO, photo);
  }

  void removePhoto() async {
    final prefs = await sharedPreferences;
    prefs.remove(PHOTO);
  }

  Future<String?> get username async {
    final prefs = await sharedPreferences;
    return prefs.getString(USERNAME) ?? null;
  }

  void setUsername(String username) async {
    final prefs = await sharedPreferences;
    prefs.setString(USERNAME, username);
  }

  void removeUsername() async {
    final prefs = await sharedPreferences;
    prefs.remove(USERNAME);
  }
}
