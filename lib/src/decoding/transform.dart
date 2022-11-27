import 'package:json_util/src/errors.dart';
import 'package:json_util/src/functions.dart';
import 'package:json_util/src/misc/misc.dart';

void _checkEncodableType<E>() {
  if (!isEncodableType<E>()) {
    throw JsonTransformationError("type '$E' is not a JSON encodable type");
  }
}

T _castAs<T>(dynamic value) {
  if (value is! T) {
    throw JsonTransformationError("value '$value' is not an instance of '$T'");
  }
  return value;
}

List<dynamic> _castAsList(dynamic value) {
  return _castAs<List<dynamic>>(value);
}

T transformObject<E, T>(dynamic value, ObjectTransformer<E, T> transformer) {
  _checkEncodableType<E>();
  final decoded = _castAs<E>(value);
  return transformer(decoded);
}

List<T> transformObjectList<E, T>(
    dynamic value, ObjectTransformer<E, T> transformer) {
  _checkEncodableType<E>();
  final list = _castAsList(value);
  T transformElement(dynamic e) => transformer(_castAs<E>(e));
  return List<T>.of(list.map(transformElement));
}
