JSON utilities for Dart.

## Usage

A simple usage example:

```dart
import 'package:json_util/json_util.dart';

main() {
  const myJson = '{"hello":"world"}';
  final decodedValue = DecodedValue.from(myJson);
  final map = decodedValue.asMap();
  final encodableValue = EncodableValue.map(map);
  final yourJson = encodableValue.encode();
  print(myJson == yourJson); // true
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/parsodyl/json_util/issues
