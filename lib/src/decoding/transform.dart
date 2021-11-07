import 'package:json_util/src/errors.dart';
import 'package:json_util/src/functions.dart';
import 'package:json_util/src/misc/misc.dart';

void _checkEncodableType<E>() {
  if (!isEncodableType<E>()) {
    throw JsonTransformationError("type '$E' is not a JSON encodable type");
  }
}

T? _castAs<T>(dynamic value) {
  if (value != null && value is! T) {
    throw JsonTransformationError("value '$value' is not an instance of '$T'");
  }
  return value as T?;
}

T? transformObject<E, T>(
    dynamic value, ObjectTransformer<E?, T?> transformer, bool skipNull) {
  _checkEncodableType<E>();
  final decoded = _castAs<E>(value);
  if (decoded == null && skipNull) {
    return null;
  }
  return transformer(decoded);
}

List<T?>? transformObjectList<E, T>(
    dynamic value, ObjectTransformer<E?, T?> transformer, bool skipNull) {
  final list = _castAs<List<dynamic>>(value);
  if (list == null) {
    return null;
  }
  _checkEncodableType<E>();
  T? transformElement(dynamic e) {
    final decoded = _castAs<E>(e);
    if (decoded == null && skipNull) {
      return null;
    }
    return transformer(decoded);
  }

  return list.map(transformElement).toList(growable: false);
}
