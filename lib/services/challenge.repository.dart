import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yobit/logic/models/challenge.dart';

Future<List<Challenge>> getTopChallenges() async {
  final response = await http
      .get(Uri.parse('http://localhost:3000/api/challenge'), headers: {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*"
  });

  if (response.statusCode == 200) {
    List<dynamic> res = jsonDecode(response.body);
    return res.map((e) => Challenge.fromJson(e)).toList();
  }
  throw Exception("Failed to load top challenges");
}
