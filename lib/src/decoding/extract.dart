import 'package:json_util/src/errors.dart';

void _checkForBadSelectors(Iterable<Object> selectorList) {
  selectorList.forEach((s) {
    if (s == null) {
      throw JsonExtractionError('null selector found');
    }
    if (s is! int && s is! String) {
      throw JsonExtractionError("selector '$s' is neither an int nor a String");
    }
  });
}

T _castAs<T>(dynamic value) {
  if (value != null && value is! T) {
    throw JsonExtractionError("value '$value' is not an instance of '$T'");
  }
  return value as T;
}

dynamic _extractNode(Object selector, dynamic parentNode) {
  if (selector is int) {
    final list = _castAs<List<dynamic>>(parentNode);
    try {
      return list[selector];
    } on RangeError {
      final s = selector;
      throw JsonExtractionError(
          "selector '$s' not found in the current list ($list)");
    }
  }
  if (selector is String) {
    final map = _castAs<Map<String, dynamic>>(parentNode);
    if (!map.containsKey(selector)) {
      final s = selector;
      throw JsonExtractionError(
          "selector '$s' not found in the current map ($map)");
    }
    return map[selector];
  }
}

dynamic extract(List<Object> selectorList, dynamic parentNode) {
  if (selectorList == null) {
    throw JsonExtractionError('selector list is required');
  }
  if (selectorList.isEmpty) {
    return parentNode;
  }
  _checkForBadSelectors(selectorList);
  var currentNode = parentNode;
  for (final selector in selectorList) {
    currentNode = _extractNode(selector, currentNode);
  }
  return currentNode;
}
