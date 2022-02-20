import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  // static String origin = 'https://yobitapi.herokuapp.com/api';
  static String origin = 'http://localhost:3000/api';

  static getHeaders() async {
    var token = await FirebaseAuth.instance.currentUser?.getIdToken(true);
    return {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      'Authorization': 'Bearer $token',
    };
  }

  static Future<Response> get(subUrl) async {
    final response = await http.get(Uri.parse('$origin/$subUrl'),
        headers: await getHeaders());
    return response;
  }

  static Future<Response> post(subUrl, body) async {
    final response = await http.post(Uri.parse('$origin/$subUrl'),
        headers: await getHeaders(), body: body);
    return response;
  }

  static Future<Response> put(subUrl, body) async {
    final response = await http.put(Uri.parse('$origin/$subUrl'),
        headers: await getHeaders(), body: body);
    return response;
  }

  static Future<Response> delete(subUrl, body) async {
    final response = await http.delete(Uri.parse('$origin/$subUrl'),
        headers: await getHeaders(), body: body);
    return response;
  }
}
