import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';

T stringToJson<T>(String str) {
  var result = JsonMapper.deserialize<T>(str)!;
  return result;
}

String jsonToString(Object model) {
  return JsonMapper.serialize(model);
}

List<T> stringToListJson<T>(String str) {
  var result =
      (json.decode(str) as List).map((e) => stringToJson<T>(json.encode(e)));
  return result.toList();
}

// String jsonToString(Object value) {
//   var json = JsonEncoder();
//   return json.convert(value);
// }

dynamic strToJson(String value) {
  var decoder = JsonDecoder();
  return decoder.convert(value);
}

T strToObj<T>(String value) {
  var decoder = JsonDecoder();
  decoder.cast<String, T>();
  return decoder.convert(value);
}
