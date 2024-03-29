import 'package:json_util/src/errors.dart';
import 'package:json_util/src/functions.dart';
import 'package:json_util/src/misc/misc.dart';

void _checkPrimitiveType<T>() {
  if (!isPrimitiveType<T>() && !isPrimitiveNullableType<T>()) {
    throw JsonPreparationError("type '$T' is not a JSON primitive type");
  }
}

void _checkEncodableType<T>() {
  if (!isEncodableType<T>()) {
    throw JsonPreparationError("type '$T' is not a JSON encodable type");
  }
}

E _toEncodableObjectUsingToJson<E>(dynamic value) {
  if (value == null) {
    return value;
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

T preparePrimitiveValue<T>(T value) {
  _checkPrimitiveType<T>();
  return value;
}

List<T> preparePrimitiveList<T>(List<T> value) {
  if (T == dynamic && value.isEmpty) {
    return <T>[];
  }
  _checkPrimitiveType<T>();
  return value;
}

E prepareObject<N, E>(N value, [ObjectEncoder<N, E>? encoder]) {
  if (encoder != null) {
    _checkEncodableType<E>();
    return encoder(value);
  }
  return _toEncodableObjectUsingToJson<E>(value);
}

List<E> prepareObjectList<N, E>(List<N> value,
    [ObjectEncoder<N, E>? encoder]) {
  if (encoder != null) {
    _checkEncodableType<E>();
    return List<E>.of(value.map(encoder));
  }
  E toEncodable(N n) => _toEncodableObjectUsingToJson<E>(n);
  return List<E>.of(value.map(toEncodable));
}
