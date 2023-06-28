import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/data/models/user_model.dart';
import 'package:flutter_shamo_provider/services/AuthServices.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  set user(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  AuthServices authServices = AuthServices();

  Future<bool> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await authServices.register(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> login({
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await authServices.login(
        email: email,
        password: password,
      );
      _user = user;
      return true;
    } catch (e) {
      print("ini error $e");
      return false;
    }
  }
}
