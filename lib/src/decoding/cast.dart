import 'package:json_util/src/errors.dart';
import 'package:json_util/src/misc/misc.dart';

void _checkNull(dynamic value) {
  if (value != null) {
    throw JsonCastingError("value '$value' is not null");
  }
}

void _checkPrimitiveType<T>() {
  if (!isPrimitiveType<T>() && !isPrimitiveNullableType<T>()) {
    throw JsonCastingError("type '$T' is not a JSON primitive type");
  }
}

T _castAs<T>(dynamic value) {
  if (value is! T) {
    throw JsonCastingError("value '$value' is not an instance of '$T'");
  }
  return value;
}

List<T> _castAsListOf<T>(dynamic value) {
  final list = _castAs<List<dynamic>>(value);
  if (list.isEmpty) {
    return <T>[];
  }
  T castAsT(dynamic e) => _castAs<T>(e);
  return List<T>.of(list.map(castAsT));
}

Null castAsNull(dynamic value) {
  _checkNull(value);
  return null;
}

Map<String, dynamic> castAsMap(dynamic value) {
  return _castAs<Map<String, dynamic>>(value);
}

List<dynamic> castAsList(dynamic value) {
  return _castAs<List<dynamic>>(value);
}

List<Map<String, dynamic>?> castAsMapList(dynamic value, bool includeNullValues) {
  if (includeNullValues) {
    return _castAsListOf<Map<String, dynamic>?>(value);
  } else {
    return _castAsListOf<Map<String, dynamic>>(value);
  }
}

T castAsPrimitiveValue<T>(dynamic value) {
  _checkPrimitiveType<T>();
  return _castAs<T>(value);
}

List<T> castAsPrimitiveList<T>(dynamic value) {
  _checkPrimitiveType<T>();
  return _castAsListOf<T>(value);
}
