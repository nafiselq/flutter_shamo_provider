import 'dart:convert';

import 'package:flutter_shamo_provider/data/models/user_model.dart';
import 'package:flutter_shamo_provider/utils/base_url.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  BaseUrl api = BaseUrl();

  Future<UserModel> register({name, username, email, password}) async {
    final body = {
      'name': name,
      'email': email,
      'username': username,
      'password': password,
    };
    final response = await http.post(
      Uri.parse('${api.baseUrl}/api/register'),
      body: body,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)["data"];
      UserModel user = UserModel.fromJson(data['user']);
      // ignore: prefer_interpolation_to_compose_strings
      user.token = 'Bearer ' + data["access_token"];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({email, password}) async {
    final body = {
      'email': email,
      'password': password,
    };

    print("ini body login : $body");

    final response = await http.post(
      Uri.parse('${api.baseUrl}/api/login'),
      body: body,
    );

    // print("ini response login ${response.body}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)["data"];
      print("ini data nya : $data");
      UserModel user = UserModel.fromJson(data['user']);
      // ignore: prefer_interpolation_to_compose_strings
      user.token = 'Bearer ' + data['access_token'];

      print("ini user : $user");
      return user;
    } else {
      // print("ini errorb ous:");
      throw Exception("Gagal Login");
    }
  }
}
