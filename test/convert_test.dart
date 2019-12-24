import 'package:json_util/json_util.dart';
import 'package:test/test.dart';

import 'user.dart';

void main() {
  group('decode >>', () {
    test('success (std)', () {
      // prepare input
      final source = '"hello!"';
      // execute
      final decoded = convertDecode(source);
      // check
      expect(decoded, isNotNull);
      expect(decoded, isA<String>());
    });
    test('success (w/ reviver)', () {
      // prepare input
      final source = '{"user":{"id":1,"name":"Leanne Graham","username":"Bret",'
          '"email":"sincere@april.biz"}}';
      // execute
      final decoded = convertDecode(source, reviver: (key, value) {
        if (key == 'user') {
          return User.fromJson(value);
        }
        return value;
      });
      // check
      expect(decoded, isNotNull);
      expect(decoded, isA<Map>());
      expect(decoded['user'], isA<User>());
    });
    test('fail (source is null)', () {
      // prepare input
      final source = null;
      // execute
      testCall() => convertDecode(source);
      // check
      expect(testCall, throwsA(TypeMatcher<ArgumentError>()));
    });
    test('fail (source is bad)', () {
      // prepare input
      final source = '[42';
      // execute
      testCall() => convertDecode(source);
      // check
      expect(testCall, throwsA(TypeMatcher<JsonFormatException>()));
    });
  });
  group('encode >>', () {
    test('success (std)', () {
      // prepare input
      final object = 'hello!';
      // execute
      final encoded = convertEncode(object);
      // check
      expect(encoded, isNotNull);
      expect(encoded, isA<String>());
    });
    test('success (w/ toEncodable)', () {
      // prepare input
      final object = {
        'user': User(
            id: 1,
            name: 'Leanne Graham',
            username: 'Bret',
            email: 'sincere@april.biz'),
      };
      // execute
      final encoded = convertEncode(object, toEncodable: (value) {
        if (value is User) {
          return value.toJson();
        }
        return value;
      });
      // check
      expect(encoded, isNotNull);
      expect(encoded, isA<String>());
    });
    test('fail (type not supported)', () {
      // prepare input
      final object = Set.of(['h', 'e', 'l', 'l', 'o', '!']);
      // execute
      testCall() => convertEncode(object);
      // check
      expect(testCall, throwsA(TypeMatcher<JsonEncodingError>()));
    });
  });
}
