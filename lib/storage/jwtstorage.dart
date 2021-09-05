import 'dart:convert';

import 'package:security_app/controller/userHTTP.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JsonStorage {
  static Future<bool> saveToken(token) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("jwt", token);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> authToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("jwt");
    if (token == null) {
      return false;
    }
    final res = await CreateUser.authToken(token);
    final msg = json.decode(res.body)['msg'];
    if (msg == "auth") {
      return true;
    } else {
      return false;
    }
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("jwt");
  }

  static Future<bool> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final eliminado = await prefs.remove("jwt");
    return eliminado;
  }
}
