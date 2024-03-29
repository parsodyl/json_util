import 'package:json_util/src/convert.dart';
import 'package:json_util/src/decoding/cast.dart';
import 'package:json_util/src/decoding/check.dart';
import 'package:json_util/src/decoding/extract.dart';
import 'package:json_util/src/decoding/transform.dart';
import 'package:json_util/src/errors.dart';
import 'package:json_util/src/functions.dart';

/// The direct result of some JSON decoding.
class DecodedValue {
  /// Private constructor for [DecodedValue].
  const DecodedValue._(dynamic value) : value = value;

  /// The actual decoded value.
  final dynamic value;

  /// Constructs a [DecodedValue] converting the given JSON-string source.
  ///
  /// Throws a [JsonFormatException] if the input is not valid JSON text.
  factory DecodedValue.from(String source) =>
      DecodedValue._(convertDecode(source));

  // IS

  /// Returns `true` if this decoded value represents a map.
  bool get isMap => checkMap(value);

  /// Returns `true` if this decoded value represents a list.
  bool get isList => checkList(value);

  /// Returns `true` if this decoded value represents a primitive value
  /// (specified by [T]).
  ///
  /// Primitive values are of the types [String], [num], [bool] or [Null].
  /// As they are subtypes of [num], [int] or [double] will be also accepted.
  ///
  /// Throws a [JsonCheckingError] if [T] does not represent a
  /// primitive type.
  bool isPrimitiveValue<T>() => checkPrimitiveValue<T>(value);

  /// Returns `true` if this decoded value represents a list of
  /// primitive values (specified by [T]).
  ///
  /// Primitive values are of the types [String], [num], [bool] or [Null].
  /// As they are subtypes of [num], [int] or [double] will be also accepted.
  ///
  /// Throws a [JsonCheckingError] if [T] could not represent a
  /// primitive type.
  bool isPrimitiveList<T>() => checkPrimitiveList<T>(value);

  /// Returns `true` if this decoded value represents a list of maps.
  ///
  /// If [includeNullValues] is set to `true`, null values are also taken
  /// into account.
  bool isMapList({bool includeNullValues = false}) =>
      checkMapList(value, includeNullValues);

  /// Returns `true` if this decoded value represents a null value.
  bool get isNull => checkNull(value);

  /// Returns `true` if this decoded value represents a null filled list.
  bool get isNullFilledList => checkNullFilledList(value);

  /// Returns `true` if this decoded value represents an empty list.
  bool get isEmptyList => checkEmptyList(value);

  /// Returns `true` if this decoded value represents an empty map.
  bool get isEmptyMap => checkEmptyMap(value);

  // CAST

  /// Returns this decoded value as `null`.
  Null asNull() => castAsNull(value);

  /// Returns this decoded value as a [Map<String, dynamic>].
  ///
  /// Throws a [JsonCastingError] if this decoded value does not represents a
  /// map.
  Map<String, dynamic> asMap() => castAsMap(value);

  /// Returns this decoded value as a [List<dynamic>].
  ///
  /// Throws a [JsonCastingError] if this decoded value does not represents a
  /// list.
  List<dynamic> asList() => castAsList(value);

  /// Returns this decoded value as a [List<Map<String, dynamic>>].
  ///
  /// Throws a [JsonCastingError] if this decoded value does not represents a
  /// list of maps or if [includeNullValues] is set to `false` and a `null`
  /// value in encountered.
  List<Map<String, dynamic>?> asMapList({bool includeNullValues = true}) =>
      castAsMapList(value, includeNullValues);

  /// Returns this decoded value as a primitive value (specified by [T]).
  ///
  /// Primitive values are of the types [String], [num], [bool] or [Null].
  /// As subtypes of [num], [int] or [double] will be also accepted.
  ///
  /// Throws a [JsonCastingError] if this decoded value does not represents a
  /// primitive value or if [T] could not represents a primitive type.
  T asPrimitiveValue<T>() => castAsPrimitiveValue<T>(value);

  /// Returns this decoded value as a list of primitive values (specified by
  /// [T]).
  ///
  /// Primitive values are of the types [String], [num], [bool] or [Null].
  /// As subtypes of [num], [int] or [double] will be also accepted.
  ///
  /// Throws a [JsonCastingError] if this decoded value does not represents a
  /// list of primitive values or if [T] could not represents a primitive type.
  List<T> asPrimitiveList<T>() => castAsPrimitiveList<T>(value);

  /// Returns this decoded value as a dart object (specified by [T]), built
  /// using [transformer]).
  ///
  /// Throws a [JsonTransformationError] if:
  /// * [E] could not represent an encodable object.
  /// * this decoded value is not an instance of [T].
  T asObject<E, T>(ObjectTransformer<E, T> transformer) =>
      transformObject<E, T>(value, transformer);

  /// Returns this decoded value as a list of dart objects (specified by [T]),
  /// built using [transformer]).
  ///
  /// Throws a [JsonTransformationError] if:
  /// * [E] could not represent an encodable object.
  /// * this decoded value is not a list.
  /// * this decoded value is not an instance of [List<T>].
  List<T> asObjectList<E, T>(ObjectTransformer<E, T> transformer) =>
      transformObjectList<E, T>(value, transformer);

  // EXTRACT

  /// Returns a new instance of [DecodedValue], which represents a subfield of
  /// this decoded value.
  ///
  /// [selectorList] must only contain integers or strings. They represents
  /// list indexes or map keys, needed to reach the target subfield.
  ///
  /// Throws a [JsonExtractionError] if [selectorList] contains bad
  /// selectors (wrong types or keys and/or indexes that are not present).
  DecodedValue extractField(List<Object> selectorList) {
    final fieldNode = extract(selectorList, value);
    return DecodedValue._(fieldNode);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DecodedValue &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'DecodedValue: $value';
  }
}
