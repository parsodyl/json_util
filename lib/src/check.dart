import 'package:json_util/src/errors.dart';
import 'package:json_util/src/misc.dart';

void _checkPrimitiveType<T>() {
  if (!isPrimitiveType<T>()) {
    throw JsonCheckingError("type '$T' is not a JSON primitive type");
  }
}

bool checkMap(dynamic value) {
  return value is Map<String, dynamic>;
}

bool checkList(dynamic value) {
  return value is List<dynamic>;
}

bool checkEmptyList(dynamic value) {
  return checkList(value) && (value as List).isEmpty;
}

bool checkEmptyMap(dynamic value) {
  return checkMap(value) && (value as Map).isEmpty;
}

bool checkPrimitiveValue<T>(dynamic value) {
  _checkPrimitiveType<T>();
  if (checkNull(value)) {
    return false;
  }
  return value is T;
}

bool checkPrimitiveList<T>(dynamic value, bool includeNulls) {
  _checkPrimitiveType<T>();
  if (checkNull(value)) {
    return false;
  }
  if (!checkList(value)) {
    return false;
  }
  if ((value as List).isEmpty) {
    return false;
  }
  for (final e in value) {
    if (checkNull(e) && includeNulls) {
      continue;
    }
    if (!checkPrimitiveValue<T>(e)) {
      return false;
    }
  }
  return true;
}

bool checkMapList(dynamic value, bool includeNulls) {
  if (checkNull(value)) {
    return false;
  }
  if (!checkList(value)) {
    return false;
  }
  if ((value as List).isEmpty) {
    return false;
  }
  for (final e in value) {
    if (checkNull(e) && includeNulls) {
      continue;
    }
    if (!checkMap(e)) {
      return false;
    }
  }
  return true;
}

bool checkNull(dynamic value) {
  return value == null;
}
