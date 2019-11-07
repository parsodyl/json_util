import 'package:json_util/src/check.dart';
import 'package:json_util/src/errors.dart';
import 'package:json_util/src/functions.dart';

void _checkPrimitiveType<T>() {
  if (!isPrimitiveType<T>()) {
    throw JsonPreparationError("type '$T' is not a JSON primitive type");
  }
}

void _checkForNullKeys(Iterable<String> keyList) {
  keyList.forEach((key) {
    if (key == null) {
      throw JsonPreparationError("null key found");
    }
  });
}

void _checkEncodableType<T>() {
  if (!isEncodableType<T>()) {
    throw JsonPreparationError("type '$T' is not a JSON encodable type");
  }
}

E _toEncodableObject<E>(dynamic value) {
  if(value == null) {
    return null;
  }
  if (!hasToJsonMethod(value)) {
    throw JsonPreparationError(
        "type '${value.runtimeType}' does not have a '.toJson()' method");
  }
  final encodable = value.toJson();
  if (encodable is! E) {
    throw JsonPreparationError("value '$encodable' is not an instance of '$E'");
  }
  return encodable;
}

Map<String, dynamic> prepareMap(Map<String, dynamic> value) {
  if (value == null) {
    return null;
  }
  _checkForNullKeys(value.keys);
  return value;
}

List<dynamic> prepareList(List<dynamic> value) {
  return value;
}

T preparePrimitiveValue<T>(T value) {
  if (value == null && (T == dynamic || T == Null)) {
    return null;
  }
  _checkPrimitiveType<T>();
  return value;
}

List<T> preparePrimitiveList<T>(List<T> value) {
  if (value == null && (T == dynamic || T == Null)) {
    return null;
  }
  if (T == dynamic && value.isEmpty) {
    return <T>[];
  }
  _checkPrimitiveType<T>();
  return value;
}

E prepareObject<N, E>(N value,
    [ObjectEncoder<N, E> encoder, skipEncoding = false]) {
  if (encoder != null) {
    _checkEncodableType<E>();
    return encoder(value);
  }
  return _toEncodableObject<E>(value);
}

List<E> prepareObjectList<N, E>(List<N> value, [ObjectEncoder<N, E> encoder]) {
  if (value == null) {
    return null;
  }
  if (encoder != null) {
    _checkEncodableType<E>();
    return value.map((e) => encoder(e)).toList(growable: false);
  }
  return value.map((e) => _toEncodableObject<E>(e)).toList(growable: false);
}
