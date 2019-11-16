import 'package:json_util/json_util.dart';
import 'package:test/test.dart';

import 'user.dart';

void main() {
  group('is predicates >>', () {
    test('map (true)', () {
      // prepare input
      final source = '{"pi": 3.14}';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isMap;
      // check
      expect(isResult, isTrue);
    });
    test('map (false)', () {
      // prepare input
      final source = '["pi", 3.14]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isMap;
      // check
      expect(isResult, isFalse);
    });
    test('list (true)', () {
      // prepare input
      final source = '["pi", 3.14]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isList;
      // check
      expect(isResult, isTrue);
    });
    test('list (false)', () {
      // prepare input
      final source = '{"pi": 3.14}';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isList;
      // check
      expect(isResult, isFalse);
    });
    test('string (true)', () {
      // prepare input
      final source = '"hello!"';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveValue<String>();
      // check
      expect(isResult, isTrue);
    });
    test('string (false)', () {
      // prepare input
      final source = 'false';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveValue<String>();
      // check
      expect(isResult, isFalse);
    });
    test('num (true)', () {
      // prepare input
      final source = '3.14';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveValue<num>();
      // check
      expect(isResult, isTrue);
    });
    test('num (false)', () {
      // prepare input
      final source = 'false';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveValue<num>();
      // check
      expect(isResult, isFalse);
    });
    test('int (true)', () {
      // prepare input
      final source = '42';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveValue<int>();
      // check
      expect(isResult, isTrue);
    });
    test('int (false)', () {
      // prepare input
      final source = '3.14';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveValue<int>();
      // check
      expect(isResult, isFalse);
    });
    test('double (true)', () {
      // prepare input
      final source = '3.14';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveValue<double>();
      // check
      expect(isResult, isTrue);
    });
    test('double (false)', () {
      // prepare input
      final source = '42';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveValue<double>();
      // check
      expect(isResult, isFalse);
    }, onPlatform: {
      'browser': [Skip("TODO: this fails on browser")],
    });
    test('bool (true)', () {
      // prepare input
      final source = 'true';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveValue<bool>();
      // check
      expect(isResult, isTrue);
    });
    test('bool (false)', () {
      // prepare input
      final source = 'null';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveValue<bool>();
      // check
      expect(isResult, isFalse);
    });
    test('null (true)', () {
      // prepare input
      final source = 'null';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isNull;
      // check
      expect(isResult, isTrue);
    });
    test('null (false)', () {
      // prepare input
      final source = 'false';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isNull;
      // check
      expect(isResult, isFalse);
    });
    test('primitive list (null filled #1)', () {
      // prepare input
      final source = '[null, null, null]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveList<String>();
      // check
      expect(isResult, isFalse);
    });
    test('primitive list (null filled #2)', () {
      // prepare input
      final source = '[null, null, null]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveList<String>(includeNullValues: true);
      // check
      expect(isResult, isTrue);
    });
    test('primitive list (null partially filled #1)', () {
      // prepare input
      final source = '["hello", null, null]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveList<String>();
      // check
      expect(isResult, isFalse);
    });
    test('primitive list (null partially filled #2)', () {
      // prepare input
      final source = '["hello", null, null]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveList<String>(includeNullValues: true);
      // check
      expect(isResult, isTrue);
    });
    test('primitive list (void)', () {
      // prepare input
      final source = '[]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveList<String>();
      // check
      expect(isResult, isFalse);
    });
    test('string list (true)', () {
      // prepare input
      final source = '["h", "e", "l", "l", "o"]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveList<String>();
      // check
      expect(isResult, isTrue);
    });
    test('string list (false)', () {
      // prepare input
      final source = '[true, false]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveList<String>();
      // check
      expect(isResult, isFalse);
    });
    test('num list (true)', () {
      // prepare input
      final source = '[3.14, 42]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveList<num>();
      // check
      expect(isResult, isTrue);
    });
    test('num list (false)', () {
      // prepare input
      final source = '[true, false]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveList<num>();
      // check
      expect(isResult, isFalse);
    });
    test('int list (true)', () {
      // prepare input
      final source = '[3, 42]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveList<int>();
      // check
      expect(isResult, isTrue);
    });
    test('int list (false)', () {
      // prepare input
      final source = '[3.14, 42]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveList<int>();
      // check
      expect(isResult, isFalse);
    });
    test('double list (true)', () {
      // prepare input
      final source = '[3.14, 14.3]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveList<double>();
      // check
      expect(isResult, isTrue);
    });
    test('double list (false)', () {
      // prepare input
      final source = '[3.14, 42]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveList<double>();
      // check
      expect(isResult, isFalse);
    }, onPlatform: {
      'browser': [Skip("TODO: this fails on browser")],
    });
    test('bool list (true)', () {
      // prepare input
      final source = '[true, false]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveList<bool>();
      // check
      expect(isResult, isTrue);
    });
    test('bool list (false)', () {
      // prepare input
      final source = '[1, 2, 3]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isPrimitiveList<bool>();
      // check
      expect(isResult, isFalse);
    });
    test('map list (null filled #1)', () {
      // prepare input
      final source = '[null, null, null]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isMapList();
      // check
      expect(isResult, isFalse);
    });
    test('map list (null filled #2)', () {
      // prepare input
      final source = '[null, null, null]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isMapList(includeNullValues: true);
      // check
      expect(isResult, isTrue);
    });
    test('map list (null partially filled #1)', () {
      // prepare input
      final source = '[{"pi": 3.14}, null, null]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isMapList();
      // check
      expect(isResult, isFalse);
    });
    test('map list (null partially filled #2)', () {
      // prepare input
      final source = '[{"pi": 3.14}, null, null]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isMapList(includeNullValues: true);
      // check
      expect(isResult, isTrue);
    });
    test('map list (true)', () {
      // prepare input
      final source = '[{"pi": 3.14}]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isMapList();
      // check
      expect(isResult, isTrue);
    });
    test('map list (false)', () {
      // prepare input
      final source = '[1, 2, 3]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isMapList();
      // check
      expect(isResult, isFalse);
    });
    test('empty list (true)', () {
      // prepare input
      final source = '[]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isEmptyList;
      // check
      expect(isResult, isTrue);
    });
    test('empty list (false)', () {
      // prepare input
      final source = '[null]';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isEmptyList;
      // check
      expect(isResult, isFalse);
    });
    test('empty map (true)', () {
      // prepare input
      final source = '{}';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isEmptyMap;
      // check
      expect(isResult, isTrue);
    });
    test('empty map (false)', () {
      // prepare input
      final source = '{"key":"value"}';
      final decoded = DecodedValue.from(source);
      // execute
      final isResult = decoded.isEmptyMap;
      // check
      expect(isResult, isFalse);
    });
  });

  group('cast as map >>', () {
    test('success (std)', () {
      // prepare input
      final source = '{"pi": 3.14}';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asMap();
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<Map<String, dynamic>>());
    });
    test('success (null)', () {
      // prepare input
      final source = 'null';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asMap();
      // check
      expect(castResult, isNull);
    });
    test('success (empty)', () {
      // prepare input
      final source = '{}';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asMap();
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<Map<String, dynamic>>());
      expect(castResult, isEmpty);
    });
    test('fail (not a map)', () {
      // prepare input
      final source = '["pi", 3.14]';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asMap();
      // check
      expect(testCall, throwsA(TypeMatcher<JsonCastingError>()));
    });
  });
  group('cast as list >>', () {
    test('success (std)', () {
      // prepare input
      final source = '["pi", 3.14]';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asList();
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<List<dynamic>>());
    });
    test('success (null)', () {
      // prepare input
      final source = 'null';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asList();
      // check
      expect(castResult, isNull);
    });
    test('success (empty)', () {
      // prepare input
      final source = '[]';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asList();
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<List<dynamic>>());
      expect(castResult, isEmpty);
    });
    test('fail (not a list)', () {
      // prepare input
      final source = '{"pi": 3.14}';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asList();
      // check
      expect(testCall, throwsA(TypeMatcher<JsonCastingError>()));
    });
  });
  group('cast as primitive value >>', () {
    test('success (null)', () {
      // prepare input
      final source = 'null';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asPrimitiveValue<String>();
      // check
      expect(castResult, isNull);
    });
    test('fail (type not specified)', () {
      // prepare input
      final source = '42';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asPrimitiveValue();
      // check
      expect(testCall, throwsA(TypeMatcher<JsonCastingError>()));
    });
    test('fail (wrong type)', () {
      // prepare input
      final source = '42';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asPrimitiveValue<String>();
      // check
      expect(testCall, throwsA(TypeMatcher<JsonCastingError>()));
    });
    test('fail (not a primitive type)', () {
      // prepare input
      final source = '42';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asPrimitiveValue<Set>();
      // check
      expect(testCall, throwsA(TypeMatcher<JsonCastingError>()));
    });
    test('fail (not a primitive value)', () {
      // prepare input
      final source = '[42]';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asPrimitiveValue<num>();
      // check
      expect(testCall, throwsA(TypeMatcher<JsonCastingError>()));
    });
    test('success (String)', () {
      // prepare input
      final source = '"Hello!"';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asPrimitiveValue<String>();
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<String>());
    });
    test('success (num)', () {
      // prepare input
      final source = '3.14';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asPrimitiveValue<num>();
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<num>());
    });
    test('success (int)', () {
      // prepare input
      final source = '42';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asPrimitiveValue<int>();
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<int>());
    });
    test('fail (not an int)', () {
      // prepare input
      final source = '42.0';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asPrimitiveValue<int>();
      // check
      expect(testCall, throwsA(TypeMatcher<JsonCastingError>()));
    }, onPlatform: {
      'browser': [Skip("TODO: this fails on browser")],
    });
    test('success (double)', () {
      // prepare input
      final source = '3.14';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asPrimitiveValue<double>();
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<double>());
    });
    test('success (bool)', () {
      // prepare input
      final source = 'false';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asPrimitiveValue<bool>();
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<bool>());
    });
  });
  group('cast as primitive list >>', () {
    test('success (null)', () {
      // prepare input
      final source = 'null';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asPrimitiveList<String>();
      // check
      expect(castResult, isNull);
    });
    test('success (empty)', () {
      // prepare input
      final source = '[]';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asPrimitiveList<String>();
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<List<String>>());
      expect(castResult, isEmpty);
    });
    test('fail (type not specified)', () {
      // prepare input
      final source = '[42]';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asPrimitiveList();
      // check
      expect(testCall, throwsA(TypeMatcher<JsonCastingError>()));
    });
    test('fail (not a list)', () {
      // prepare input
      final source = '42';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asPrimitiveList<num>();
      // check
      expect(testCall, throwsA(TypeMatcher<JsonCastingError>()));
    });
    test('fail (wrong type)', () {
      // prepare input
      final source = '[42]';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asPrimitiveList<String>();
      // check
      expect(testCall, throwsA(TypeMatcher<JsonCastingError>()));
    });
    test('fail (not a primitive type)', () {
      // prepare input
      final source = '[42]';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asPrimitiveList<Set>();
      // check
      expect(testCall, throwsA(TypeMatcher<JsonCastingError>()));
    });
    test('success (null filled)', () {
      // prepare input
      final source = '[null, null, null]';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asPrimitiveList<String>();
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<List<String>>());
    });
    test('success (null partially filled)', () {
      // prepare input
      final source = '["hello", null, null]';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asPrimitiveList<String>();
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<List<String>>());
    });
    test('success (String)', () {
      // prepare input
      final source = '["hello", "world"]';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asPrimitiveList<String>();
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<List<String>>());
    });
    test('success (num)', () {
      // prepare input
      final source = '[42, 3.14]';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asPrimitiveList<num>();
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<List<num>>());
    });
    test('success (int)', () {
      // prepare input
      final source = '[1, 2, 3]';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asPrimitiveList<int>();
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<List<int>>());
    });
    test('fail (not an int)', () {
      // prepare input
      final source = '[1, 2, 3.0]';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asPrimitiveValue<int>();
      // check
      expect(testCall, throwsA(TypeMatcher<JsonCastingError>()));
    });
    test('success (double)', () {
      // prepare input
      final source = '[1.0, 2.0, 3.0]';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asPrimitiveList<double>();
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<List<double>>());
    });
    test('success (bool)', () {
      // prepare input
      final source = '[false, true, false]';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asPrimitiveList<bool>();
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<List<bool>>());
    });
  });
  group('cast as object >>', () {
    test('success (null)', () {
      // prepare input
      final source = 'null';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asObject((String value) => value);
      // check
      expect(castResult, isNull);
    });
    test('fail (transformer is null)', () {
      // prepare input
      final source = '42';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asObject(null);
      // check
      expect(testCall, throwsA(TypeMatcher<JsonTransformationError>()));
    });
    test('fail (type not specified)', () {
      // prepare input
      final source = '42';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asObject((value) => value);
      // check
      expect(testCall, throwsA(TypeMatcher<JsonTransformationError>()));
    });
    test('fail (wrong type)', () {
      // prepare input
      final source = '42.0';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asObject<int, String>((value) => '$value');
      // check
      expect(testCall, throwsA(TypeMatcher<JsonTransformationError>()));
    });
    test('check encodable type #1 (wrong type - Set<String>)', () {
      // prepare input
      final source = '["h", "e", "l", "l", "o"]';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded
          .asObject<Set<String>, String>((set) => set.reduce((a, b) => a + b));
      // check
      expect(testCall, throwsA(TypeMatcher<JsonTransformationError>()));
    });
    test('check encodable type #2 (right type - List<dynamic>)', () {
      // prepare input
      final source = '["h", "e", "l", "l", "o"]';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asObject<List<dynamic>, String>(
          (list) => list.reduce((a, b) => a + b));
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<String>());
    });
    test('success (User - implicit type)', () {
      // prepare input
      final source = '{"id":1,"name":"Leanne Graham","username":"Bret",'
          '"email":"sincere@april.biz"}';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asObject(User.fromJson);
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<User>());
    });
    test('success (User - explicit type)', () {
      // prepare input
      final source = '{"id":1,"name":"Leanne Graham","username":"Bret",'
          '"email":"sincere@april.biz"}';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asObject<Map<String, dynamic>, User>(
        (m) => User(
          id: m['id'],
          name: m['name'],
          username: m['username'],
          email: m['email'],
        ),
      );
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<User>());
    });
  });
  group('cast as object list >>', () {
    test('success (null)', () {
      // prepare input
      final source = 'null';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asObjectList((String value) => value);
      // check
      expect(castResult, isNull);
    });
    test('success (empty)', () {
      // prepare input
      final source = '[]';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asObjectList((String value) => value);
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<List<String>>());
      expect(castResult, isEmpty);
    });
    test('fail (transformer is null)', () {
      // prepare input
      final source = '[42]';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asObjectList(null);
      // check
      expect(testCall, throwsA(TypeMatcher<JsonTransformationError>()));
    });
    test('fail (type not specified)', () {
      // prepare input
      final source = '[42]';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asObjectList((value) => value);
      // check
      expect(testCall, throwsA(TypeMatcher<JsonTransformationError>()));
    });
    test('fail (not a list)', () {
      // prepare input
      final source = '"hello!"';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asObjectList((String value) => value);
      // check
      expect(testCall, throwsA(TypeMatcher<JsonTransformationError>()));
    });
    test('fail (wrong type)', () {
      // prepare input
      final source = '[42.0]';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asObjectList<int, String>((value) => '$value');
      // check
      expect(testCall, throwsA(TypeMatcher<JsonTransformationError>()));
    });
    test('check encodable type #1 (wrong type - Set<String>)', () {
      // prepare input
      final source = '["h", "e", "l", "l", "o"]';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.asObjectList<Set<String>, String>(
          (set) => set.reduce((a, b) => a + b));
      // check
      expect(testCall, throwsA(TypeMatcher<JsonTransformationError>()));
    });
    test('check encodable type #2 (right type - List<String>)', () {
      // prepare input
      final source = '[["h"], ["e"], ["l"], ["l"], ["o"]]';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asObjectList<List<dynamic>, String>(
          (list) => list.isNotEmpty ? list[0].toUpperCase() : "");
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<List<String>>());
    });
    test('success (User - implicit type)', () {
      // prepare input
      final source = '[{"id":1,"name":"Leanne Graham","username":"Bret",'
          '"email":"sincere@april.biz"}]';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asObjectList(User.fromJson);
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<List<User>>());
    });
    test('success (User - explicit type)', () {
      // prepare input
      final source = '[{"id":1,"name":"Leanne Graham","username":"Bret",'
          '"email":"sincere@april.biz"}]';
      final decoded = DecodedValue.from(source);
      // execute
      final castResult = decoded.asObjectList<Map<String, dynamic>, User>(
        (m) => User(
          id: m['id'],
          name: m['name'],
          username: m['username'],
          email: m['email'],
        ),
      );
      // check
      expect(castResult, isNotNull);
      expect(castResult, isA<List<User>>());
    });
  });
  group('extract >>', () {
    test('success (std - one level)', () {
      // prepare input
      final source = '[{"pi": 3.14}]';
      final decoded = DecodedValue.from(source);
      // execute
      final extractResult = decoded.extractField([0]);
      // check
      expect(extractResult, isNotNull);
      expect(extractResult, isA<DecodedValue>());
    });
    test('success (std - two levels)', () {
      // prepare input
      final source = '[{"constants": {"pi": 3.14}}]';
      final decoded = DecodedValue.from(source);
      // execute
      final extractResult = decoded.extractField([0, 'constants']);
      // check
      expect(extractResult, isNotNull);
      expect(extractResult, isA<DecodedValue>());
    });
    test('success (null)', () {
      // prepare input
      final source = '[null]';
      final decoded = DecodedValue.from(source);
      // execute
      final extractResult = decoded.extractField([0]);
      // check
      expect(extractResult, isNotNull);
      expect(extractResult, isA<DecodedValue>());
    });
    test('success (no selectors)', () {
      // prepare input
      final source = '{"pi": 3.14}';
      final decoded = DecodedValue.from(source);
      // execute
      final extractResult = decoded.extractField([]);
      // check
      expect(extractResult, isNotNull);
      expect(extractResult, isA<DecodedValue>());
      expect(extractResult, equals(decoded));
    });
    test('fail (selector list is null)', () {
      // prepare input
      final source = '[{"pi": 3.14}]';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.extractField(null);
      // check
      expect(testCall, throwsA(TypeMatcher<JsonExtractionError>()));
    });
    test('fail (wrong selector - bad list index)', () {
      // prepare input
      final source = '[{"pi": 3.14}]';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.extractField([1]);
      // check
      expect(testCall, throwsA(TypeMatcher<JsonExtractionError>()));
    });
    test('fail (wrong selector - bad map key)', () {
      // prepare input
      final source = '[{"pi": 3.14}]';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.extractField([0, 'pie']);
      // check
      expect(testCall, throwsA(TypeMatcher<JsonExtractionError>()));
    });
    test('fail (wrong selector - too deep)', () {
      // prepare input
      final source = '[{"pi": 3.14}]';
      final decoded = DecodedValue.from(source);
      // execute
      testCall() => decoded.extractField([0, 'pi', 'value']);
      // check
      expect(testCall, throwsA(TypeMatcher<JsonExtractionError>()));
    });
  });
}
