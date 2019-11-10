bool isPrimitiveType<T>() {
  return T == bool ||
      T == String ||
      T == num ||
      T == int ||
      T == double ||
      T == Null;
}

bool isEncodableType<T>() {
  return isPrimitiveType<T>() ||
      T is List<dynamic> ||
      T is Map<String, dynamic>;
}

bool hasToJsonMethod(dynamic value) {
  try {
    value.toJson();
  } on NoSuchMethodError catch (_) {
    return false;
  }
  return true;
}

bool isNullOrDynamicType<T>() {
  return T == Null || T == dynamic;
}
