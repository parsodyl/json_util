import 'package:json_util/src/errors.dart';
import 'package:json_util/src/misc/misc.dart';

void _checkPrimitiveType<T>() {
  if (!isPrimitiveType<T>()) {
    throw JsonCastingError("type '$T' is not a JSON primitive type");
  }
}

T? _castAs<T>(dynamic value) {
  if (value != null && value is! T) {
    throw JsonCastingError("value '$value' is not an instance of '$T'");
  }
  return value as T?;
}

Map<String, dynamic>? castAsMap(dynamic value) {
  return _castAs<Map<String, dynamic>>(value);
}

List<dynamic>? castAsList(dynamic value) {
  return _castAs<List<dynamic>>(value);
}

T? castAsPrimitiveValue<T>(dynamic value) {
  _checkPrimitiveType<T>();
  return _castAs<T>(value);
}

List<T?>? castAsPrimitiveList<T>(dynamic value) {
  _checkPrimitiveType<T>();
  final list = _castAs<List<dynamic>>(value);
  if (list == null) {
    return null;
  }
  if (list.isEmpty) {
    return <T>[];
  }
  T? castAsT(dynamic e) => _castAs<T>(e);
  final mapperList = list.map(castAsT);
  return List<T?>.of(mapperList);
}
