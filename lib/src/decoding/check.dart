import 'package:json_util/src/errors.dart';
import 'package:json_util/src/misc/misc.dart';

void _checkPrimitiveType<T>() {
  if (!isPrimitiveType<T>() && !isPrimitiveNullableType<T>()) {
    throw JsonCheckingError("type '$T' is not a JSON primitive type");
  }
}

bool checkMap(dynamic value) {
  return value is Map<String, dynamic>;
}

bool checkList(dynamic value) {
  return value is List<dynamic>;
}

bool checkNull(dynamic value) {
  return value == null;
}

bool checkEmptyList(dynamic value) {
  return checkList(value) && (value as List).isEmpty;
}

bool checkEmptyMap(dynamic value) {
  return checkMap(value) && (value as Map).isEmpty;
}

bool checkPrimitiveValue<T>(dynamic value) {
  _checkPrimitiveType<T>();
  return value is T;
}

bool checkNullFilledList(dynamic value) {
  // check list
  if (!checkList(value) || (value as List).isEmpty) {
    return false;
  }
  // check content
  for (final e in value) {
    if (!checkNull(e)) {
      return false;
    }
  }
  return true;
}

bool checkPrimitiveList<T>(dynamic value) {
  _checkPrimitiveType<T>();
  // check list
  if (!checkList(value) || (value as List).isEmpty) {
    return false;
  }
  // check content
  for (final e in value) {
    if (!checkPrimitiveValue<T>(e)) {
      return false;
    }
  }
  return true;
}

bool checkMapList(dynamic value, bool includeNulls) {
  // check list
  if (!checkList(value) || (value as List).isEmpty) {
    return false;
  }
  // check content
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
