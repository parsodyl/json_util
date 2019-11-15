Type-safe JSON-encoding and JSON-decoding utilities for Dart.

## Usage

A simple usage example:

```dart
import 'package:json_util/json_util.dart';

void main() {
  const myJson = '{"hello":"world"}';
  final decodedValue = DecodedValue.from(myJson);
  final map = decodedValue.asMap();
  final encodableValue = EncodableValue.map(map);
  final yourJson = encodableValue.encode();
  print(myJson == yourJson); // true
}
```

## Avalaible components:

* [EncodableValue](<https://pub.dev/documentation/json_util/latest/json_util/EncodableValue-class.html>)
* [DecodedValue](<https://pub.dev/documentation/json_util/latest/json_util/DecodedValue-class.html>)

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/parsodyl/json_util/issues
