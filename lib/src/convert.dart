import 'dart:convert';

import 'package:json_util/src/errors.dart';

/// Used to "revive" an object previously encoded into some JSON data.
typedef Reviver = Object? Function(Object? key, Object? value);

/// Used to encode an object not directly encodable into some JSON data.
typedef ToEncodable = Object? Function(Object? nonEncodable);

/// Parses the string and returns the resulting Json object.
///
/// The optional [reviver] function is called once for each object or list
/// property that has been parsed during decoding. The `key` argument is either
/// the integer list index for a list property, the string map key for object
/// properties, or `null` for the final result.
///
/// The default [reviver] (when not provided) is the identity function.
///
/// Throws an [ArgumentError] if [source] is null.
///
/// Throws a [JsonFormatException] is [source] does not represent any JSON data.
dynamic convertDecode(String source, {Reviver? reviver}) {
  try {
    return json.decode(source, reviver: reviver);
  } on FormatException catch (e) {
    throw JsonFormatException.fromParent(e);
  }
}

/// Converts [value] to a JSON string.
///
/// If value contains objects that are not directly encodable to a JSON
/// string (a value that is not a number, boolean, string, null, list or a map
/// with string keys), the [toEncodable] function is used to convert it to an
/// object that must be directly encodable.
///
/// If [toEncodable] is omitted, it defaults to a function that returns the
/// result of calling `.toJson()` on the unencodable object.
///
/// Throws a JsonEncodingError if [value] results impossible to encode.
String convertEncode(Object? value, {ToEncodable? toEncodable}) {
  try {
    return json.encode(value, toEncodable: toEncodable);
  } on JsonUnsupportedObjectError catch (e) {
    throw JsonEncodingError.fromUnsupportedObject(e);
  }
}
