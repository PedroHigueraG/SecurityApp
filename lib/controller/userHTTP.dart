import 'dart:convert';
import 'package:security_app/models/Usuario.dart';
import 'package:http/http.dart' as http;

class CreateUser {
  static String _url = "securityapp-ac.herokuapp.com";
  static String _pathuser = "/api/users";
  static String _pathlogin = "/api/auth/login";
  static String _pathtoken = "/api/auth/token";

  static Future<dynamic> crearUsuario(Usuario user) async {
    final url = Uri.https(_url, _pathuser);
    final body = json.encode(user.getMap());
    final res = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    return res;
  }

  static Future<dynamic> authUsuario(Usuario user) async {
    final url = Uri.https(_url, _pathlogin);
    final body =
        json.encode({"usuario": user.usuario, "password": user.password});
    final res = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    return res;
  }

  static Future<http.Response> authToken(token) async {
    final url = Uri.https(_url, _pathtoken);
    final res = await http.get(url,
        headers: {"Content-Type": "application/json", "tokenx": token});
    return res;
  }
}
