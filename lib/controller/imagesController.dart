
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ImagesController{
  static String _url = dotenv.env['API_URL'];
  static String _pathimages = "/api/images";

  static Future<List<dynamic>> getImages(token) async {
    final url = Uri.https(_url, _pathimages);
    final res = await http.get(url,
        headers: {"Content-Type": "application/json", "tokenx": token});
    return json.decode(res.body);
  }
}