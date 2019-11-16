import 'package:json_util/src/errors.dart';
import 'package:json_util/src/functions.dart';
import 'package:json_util/src/misc.dart';

void _checkEncodableType<E>() {
  if (!isEncodableType<E>()) {
    throw JsonTransformationError("type '$E' is not a JSON encodable type");
  }
}

T _castAs<T>(dynamic value) {
  if (value != null && value is! T) {
    throw JsonTransformationError("value '$value' is not an instance of '$T'");
  }
  return value as T;
}

T transformObject<E, T>(dynamic value, ObjectTransformer<E, T> transformer) {
  if (transformer == null) {
    throw JsonTransformationError("transforming function is required");
  }
  _checkEncodableType<E>();
  final decoded = _castAs<E>(value);
  return transformer(decoded);
}

List<T> transformObjectList<E, T>(
    dynamic value, ObjectTransformer<E, T> transformer) {
  if (transformer == null) {
    throw JsonTransformationError("transforming function is required");
  }
  final list = _castAs<List<dynamic>>(value);
  if (list == null) {
    return null;
  }
  _checkEncodableType<E>();
  transformElement(dynamic e) => transformer(_castAs<E>(e));
  return list.map(transformElement).toList(growable: false);
}
