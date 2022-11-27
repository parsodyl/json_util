import 'package:json_util/json_util.dart';

void main() {
  const myJson = '{"hello":"world"}';
  final decodedValue = DecodedValue.from(myJson);
  final map = decodedValue.asMap();
  final encodableValue = EncodableValue.map(map);
  final yourJson = encodableValue.encode();
  print(myJson == yourJson); // true
}
