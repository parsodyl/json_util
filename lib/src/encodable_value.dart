import 'package:json_util/src/convert.dart';
import 'package:json_util/src/encoding/prepare.dart';
import 'package:json_util/src/errors.dart';
import 'package:json_util/src/functions.dart';

/// A candidate for direct JSON encoding.
class EncodableValue {
  /// Private constructor for [EncodableValue].
  const EncodableValue._(this._value);

  /// The actual encodable value.
  final Object _value;

  /// Creates an [EncodableValue] that is based on [map].
  ///
  /// Throws a [JsonPreparationError] if [map] contains one or more null keys.
  EncodableValue.map(Map<String, dynamic> map) : _value = prepareMap(map);

  /// Creates an [EncodableValue] that is based on [list].
  EncodableValue.list(List<dynamic> list) : _value = prepareList(list);

  /// Creates an [EncodableValue] from [value].
  ///
  /// Primitive values are of the types [String], [num], [bool] or [Null].
  /// As subtypes of [num], [int] or [double] will be also accepted.
  ///
  /// Throws a [JsonPreparationError] if [T] could not represent a
  /// primitive type.
  static EncodableValue fromPrimitiveValue<T>(T value) =>
      EncodableValue._(preparePrimitiveValue<T>(value));

  /// Creates an [EncodableValue] from [list].
  ///
  /// Primitive values are of the types [String], [num], [bool] or [Null].
  /// As subtypes of [num], [int] or [double] will be also accepted.
  ///
  /// Throws a [JsonPreparationError] if [T] could not represent a
  /// primitive type.
  static EncodableValue fromPrimitiveList<T>(List<T> list) =>
      EncodableValue._(preparePrimitiveList<T>(list));

  /// Creates an [EncodableValue] from [value].
  ///
  /// [value] is not supposed to be directly encodable. As such, [encoder] is
  /// used to convert it to an encodable object.
  ///
  /// If [encoder] is omitted, the result of calling `.toJson()` on [value]
  /// will be used.
  ///
  /// Throws a [JsonPreparationError] if:
  /// * [encoder] is provided, but [E] could not represent an encodable object.
  /// * [value] does not have a callable `.toJson()` method.
  /// * [E] does not match the `.toJson()` result type.
  static EncodableValue fromObject<N, E>(N value,
      {ObjectEncoder<N, E> encoder}) {
    return EncodableValue._(prepareObject<N, E>(value, encoder));
  }

  /// Creates an [EncodableValue] from [list].
  ///
  /// [list] is not supposed to be directly encodable. As such, [encoder] is
  /// used to convert every element of the list to an encodable object.
  ///
  /// If [encoder] is omitted, the result of calling `.toJson()` on each
  /// [list] element will be used.
  ///
  /// Throws a [JsonPreparationError] if:
  /// * [encoder] is provided, but [E] could not represent an encodable object.
  /// * [value] does not have a callable `.toJson()` method.
  /// * [E] does not match the `.toJson()` result type.
  static EncodableValue fromObjectList<N, E>(List<N> list,
      {ObjectEncoder<N, E> encoder}) {
    return EncodableValue._(prepareObjectList<N, E>(list, encoder));
  }

  /// Converts this [EncodableValue] to a JSON string.
  ///
  /// Throws a [JsonEncodingError] if any error occurs during the JSON encoding
  /// process.
  String encode() => convertEncode(_value);
}
