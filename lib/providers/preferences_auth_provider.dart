import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/data/models/user_model.dart';
import '../data/preferences/auth_preferences.dart';

class PreferencesAuthProvider extends ChangeNotifier {
  AuthPreferences authPreferences;

  PreferencesAuthProvider({required this.authPreferences}) {
    getUser();
  }

  String? _token;
  String? get token => _token;

  int? _userId;
  int? get userId => _userId;

  String? _name;
  String? get name => _name;

  String? _username;
  String? get username => _username;

  String? _telephone;
  String? get telephone => _telephone;

  String? _email;
  String? get email => _email;

  String? _photo;
  String? get photo => _photo;

  void getUser() {
    _getToken();
    _getUserId();
    _getName();
    _getUsername();
    _getEmail();
    _getPhoto();
  }

  void setUser(UserModel userData) {
    print("ini user data : ${userData.toJson()}");
    authPreferences.setTokenAuth(userData.token!);
    authPreferences.setUserId(userData.id!);
    authPreferences.setName(userData.name!);
    authPreferences.setUsername(userData.username!);
    authPreferences.setEmail(userData.email!);
    authPreferences.setPhoto(userData.profilePhotoUrl!);
    getUser();
  }

  void removeUser() {
    authPreferences.removeTokenAuth();
    authPreferences.removeUserId();
    authPreferences.removeName();
    authPreferences.removeEmail();
    authPreferences.removePhoto();
    getUser();
  }

  void setToken(String token) {
    authPreferences.setTokenAuth(token);
    _getToken();
  }

  void _getToken() async {
    _token = await authPreferences.token;
    notifyListeners();
  }

  void _getUserId() async {
    _userId = await authPreferences.userId;
    notifyListeners();
  }

  void _getName() async {
    _name = await authPreferences.name;
    notifyListeners();
  }

  void _getUsername() async {
    _username = await authPreferences.username;
    notifyListeners();
  }

  void _getEmail() async {
    _email = await authPreferences.email;
    notifyListeners();
  }

  void _getPhoto() async {
    _photo = await authPreferences.photo;
    notifyListeners();
  }
}
