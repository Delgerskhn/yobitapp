import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  static String origin = 'https://yobitapi.herokuapp.com/api';
  static var headers = {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*"
  };
  static Future<Response> get(subUrl) async {
    final response =
        await http.get(Uri.parse('$origin/$subUrl'), headers: headers);
    return response;
  }

  static Future<Response> post(subUrl, body) async {
    final response = await http.post(Uri.parse('$origin/$subUrl'),
        headers: headers, body: body);
    return response;
  }

  static Future<Response> put(subUrl, body) async {
    final response = await http.put(Uri.parse('$origin/$subUrl'),
        headers: headers, body: body);
    return response;
  }

  static Future<Response> delete(subUrl, body) async {
    final response = await http.delete(Uri.parse('$origin/$subUrl'),
        headers: headers, body: body);
    return response;
  }
}
