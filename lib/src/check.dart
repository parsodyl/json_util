bool isPrimitiveType<T>() {
  final ts = T.toString();
  return ts == 'bool' ||
      ts == 'String' ||
      ts == 'num' ||
      ts == 'int' ||
      ts == 'double' ||
      ts == 'Null';
}

bool isPrimitiveListType<D>() {
  final ts = D.toString();
  return ts == 'List<bool>' ||
      ts == 'List<String>' ||
      ts == 'List<num>' ||
      ts == 'List<int>' ||
      ts == 'List<double>' ||
      ts == 'List<Null>';
}

bool isPrimitiveTypeNew<T>() {
  return T == bool ||
      T == String ||
      T == num ||
      T == int ||
      T == double ||
      T == Null;
}

bool isMap(dynamic node) {
  return node is Map<String, dynamic>;
}

bool isList(dynamic node) {
  return node is List<dynamic>;
}

bool isPrimitiveValue(dynamic node) {
  return node is bool || node is String || node is num;
}

bool isPrimitiveList(dynamic node) {
  if (!isList(node)) {
    return false;
  }
  for (final e in node) {
    if (!isPrimitiveValue(e)) {
      return false;
    }
  }
  return true;
}

bool isMapList(dynamic node) {
  if (!isList(node)) {
    return false;
  }
  for (final e in node) {
    if (!isMap(e)) {
      return false;
    }
  }
  return true;
}

bool isNull(dynamic node) {
  return node == null;
}

bool isT<T>(dynamic node) {
  return node is T;
}

bool hasToJsonMethod(dynamic node) {
  try {
    node.toJson();
  } on NoSuchMethodError catch (_) {
    return false;
  }
  return true;
}

bool isEncodableType<T>() {
  return isPrimitiveType<T>() ||
      T is List<dynamic> ||
      T is Map<String, dynamic>;
}
