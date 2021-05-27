import 'dart:convert';
import 'package:security_app/models/Usuario.dart';
import 'package:http/http.dart' as http;

class CreateUser {
  static String _url = "securityapp-ac.herokuapp.com";
  static String _path_user = "/api/users";
  static String _path_login = "/api/auth/login";
  static String _lenguaje = "es-ES";

  static Future<dynamic> crearUsuario(Usuario user) async {
    final url = Uri.https(_url, _path_user);
    final body = json.encode(user.getMap());
    final res = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    return res;
  }

  static Future<dynamic> authUsuario(Usuario user) async {
    final url = Uri.https(_url, _path_login);
    final body =
        json.encode({"usuario": user.usuario, "password": user.password});
    final res = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    return res;
  }
}
