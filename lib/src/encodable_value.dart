import 'package:json_util/src/convert.dart';
import 'package:json_util/src/functions.dart';
import 'package:json_util/src/prepare.dart';

class EncodableValue {
  final Object _value;

  const EncodableValue._(this._value);

  EncodableValue.map(Map<String, dynamic> map) : _value = prepareMap(map);

  EncodableValue.list(List<dynamic> list) : _value = prepareList(list);

  static EncodableValue fromPrimitiveValue<T>(T value) =>
      EncodableValue._(preparePrimitiveValue<T>(value));

  static EncodableValue fromPrimitiveList<T>(List<T> list) =>
      EncodableValue._(preparePrimitiveList<T>(list));

  static EncodableValue fromObject<N, E>(N value,
      {ObjectEncoder<N, E> encoder}) {
    return EncodableValue._(prepareObject<N, E>(value, encoder));
  }

  static EncodableValue fromObjectList<N, E>(List<N> list,
      {ObjectEncoder<N, E> encoder}) {
    return EncodableValue._(prepareObjectList<N, E>(list, encoder));
  }

  String encode() => convertEncode(_value);
}
