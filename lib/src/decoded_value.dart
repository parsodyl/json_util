import 'package:json_util/src/cast.dart';
import 'package:json_util/src/check.dart';
import 'package:json_util/src/convert.dart';
import 'package:json_util/src/errors.dart';
import 'package:json_util/src/extract.dart';
import 'package:json_util/src/functions.dart';
import 'package:json_util/src/transform.dart';

class DecodedValue {
  /// Private constructor for [DecodedValue].
  const DecodedValue._(dynamic value) : _value = value;

  /// The actual decoded value.
  final dynamic _value;

  /// Constructs a [DecodedValue] converting the given JSON-string source.
  ///
  /// Throws a [JsonFormatException] if the input is not valid JSON text.
  factory DecodedValue.from(String source) =>
      DecodedValue._(convertDecode(source));

  // IS

  /// Returns `true` if this decoded value represents a map.
  bool get isMap => checkMap(_value);

  /// Returns `true` if this decoded value represents a list.
  bool get isList => checkList(_value);

  /// Returns `true` if this decoded value represents a primitive value
  /// (specified by [T]).
  ///
  /// Primitive values are of the types [String], [num], [bool] or [Null].
  /// As subtypes of [num], [int] or [double] will be also accepted.
  ///
  /// Throws a [JsonCheckingError] if [T] could not represent a
  /// primitive type.
  bool isPrimitiveValue<T>() => checkPrimitiveValue<T>(_value);

  /// Returns `true` if this decoded value represents a list of
  /// primitive values (specified by [T]).
  ///
  /// Primitive values are of the types [String], [num], [bool] or [Null].
  /// As subtypes of [num], [int] or [double] will be also accepted.
  ///
  /// If [includeNullValues] is set to `true`, null values are also taken
  /// into account.
  ///
  /// Throws a [JsonCheckingError] if [T] could not represent a
  /// primitive type.
  bool isPrimitiveList<T>({bool includeNullValues = false}) =>
      checkPrimitiveList<T>(_value, includeNullValues);

  /// Returns `true` if this decoded value represents a list of maps.
  ///
  /// If [includeNullValues] is set to `true`, null values are also taken
  /// into account.
  bool isMapList({bool includeNullValues = false}) =>
      checkMapList(_value, includeNullValues);

  /// Returns `true` if this decoded value represents a null value.
  bool get isNull => checkNull(_value);

  /// Returns `true` if this decoded value represents an empty list.
  bool get isEmptyList => checkEmptyList(_value);

  /// Returns `true` if this decoded value represents an empty map.
  bool get isEmptyMap => checkEmptyMap(_value);

  // CAST

  /// Returns this decoded value as a [Map]<[String], [dynamic]>.
  ///
  /// Throws a [JsonCastingError] if this decoded value does not represents a
  /// map.
  Map<String, dynamic> asMap() => castAsMap(_value);

  /// Returns this decoded value as a [List]<[dynamic]>.
  ///
  /// Throws a [JsonCastingError] if this decoded value does not represents a
  /// list.
  List<dynamic> asList() => castAsList(_value);

  /// Returns this decoded value as a primitive value (specified by [T]).
  ///
  /// Primitive values are of the types [String], [num], [bool] or [Null].
  /// As subtypes of [num], [int] or [double] will be also accepted.
  ///
  /// Throws a [JsonCastingError] if this decoded value does not represents a
  /// primitive value or if [T] could not represents a primitive type.
  T asPrimitiveValue<T>() => castAsPrimitiveValue<T>(_value);

  /// Returns this decoded value as a list of primitive values (specified by
  /// [T]).
  ///
  /// Primitive values are of the types [String], [num], [bool] or [Null].
  /// As subtypes of [num], [int] or [double] will be also accepted.
  ///
  /// Throws a [JsonCastingError] if this decoded value does not represents a
  /// primitive value or if [T] could not represents a primitive type.
  List<T> asPrimitiveList<T>() => castAsPrimitiveList<T>(_value);

  /// Returns this decoded value as a dart object (specified by [T]), built
  /// using [transformer]).
  ///
  /// Throws a [JsonTransformationError] if:
  /// * [transformer] is null.
  /// * [E] could not represent an encodable object.
  /// * this decoded value is not an instance of [T].
  T asObject<E, T>(ObjectTransformer<E, T> transformer) =>
      transformObject<E, T>(_value, transformer);

  /// Returns this decoded value as a list of dart objects (specified by [T]),
  /// built using [transformer]).
  ///
  /// Throws a [JsonTransformationError] if:
  /// * [transformer] is null.
  /// * [E] could not represent an encodable object.
  /// * this decoded value is not an instance of [T].
  List<T> asObjectList<E, T>(ObjectTransformer<E, T> transformer) =>
      transformObjectList<E, T>(_value, transformer);

  // EXTRACT

  /// Returns a new instance of [DecodedValue], which represents a subfield of
  /// this decoded value.
  DecodedValue extractField(List<Object> selectorList) {
    final fieldNode = extract(selectorList, _value);
    return DecodedValue._(fieldNode);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DecodedValue &&
          runtimeType == other.runtimeType &&
          _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}
