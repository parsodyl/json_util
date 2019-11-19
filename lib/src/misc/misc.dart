bool isPrimitiveType<T>() {
  return T == bool ||
      T == String ||
      T == num ||
      T == int ||
      T == double ||
      T == Null;
}

bool isListType<T>() {
  final ts = T.toString();
  return ts == 'List<dynamic>';
}

bool isMapType<T>() {
  final ts = T.toString();
  return ts == 'Map<String, dynamic>';
}

bool isEncodableType<T>() {
  return isPrimitiveType<T>() || isListType<T>() || isMapType<T>();
}

bool isNullOrDynamicType<T>() {
  return T == Null || T == dynamic;
}

bool hasToJsonMethod(dynamic value) {
  try {
    value.toJson();
  } on NoSuchMethodError {
    return false;
  }
  return true;
}
