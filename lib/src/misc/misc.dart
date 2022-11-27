Type _getType<T>() => T;

bool _isNullableType<T>() {
  return null is T;
}

bool _isMapType<T>() {
  final ts = T.toString();
  return ts == 'Map<String, dynamic>';
}

bool _isListType<T>() {
  final ts = T.toString();
  return ts == 'List<dynamic>';
}

bool isEncodableType<T>() {
  return _isNullableType<T>() ||
      isPrimitiveType<T>() ||
      _isListType<T>() ||
      _isMapType<T>();
}

bool isPrimitiveType<T>() {
  return T == bool ||
      T == String ||
      T == num ||
      T == int ||
      T == double ||
      T == Null;
}

bool isPrimitiveNullableType<T>() {
  return T == _getType<bool?>() ||
      T == _getType<String?>() ||
      T == _getType<num?>() ||
      T == _getType<int?>() ||
      T == _getType<double?>() ||
      T == _getType<Null>();
}

bool hasToJsonMethod(dynamic value) {
  try {
    value.toJson();
  } on NoSuchMethodError {
    return false;
  }
  return true;
}
