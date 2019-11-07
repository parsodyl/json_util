import 'dart:convert';

import 'package:json_util/src/errors.dart';

typedef Reviver = Object Function(Object key, Object value);
typedef ToEncodable = Object Function(Object nonEncodable);

dynamic convertDecode(String source, {Reviver reviver}) {
  try {
    return json.decode(source, reviver: reviver);
  } on FormatException catch (e) {
    throw JsonFormatException.fromParent(e);
  }
}

String convertEncode(Object value, {ToEncodable toEncodable}) {
  try {
    return json.encode(value, toEncodable: toEncodable);
  } on JsonUnsupportedObjectError catch (e) {
    throw JsonEncodingError.fromUnsupportedObject(e);
  }
}
