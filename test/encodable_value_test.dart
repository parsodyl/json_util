import 'package:json_util/json_util.dart';
import 'package:json_util/src/errors.dart';
import 'package:test/test.dart';

import 'user.dart';

void main() {
  group('null inputs >>', () {
    test('from primitive value (implicit)', () {
      // execute
      final encodable = EncodableValue.fromPrimitiveValue(null);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
      expect(encodable.encode(), equals('null'));
    });
    test('from primitive value (explicit)', () {
      // execute
      final String? input = null;
      final encodable = EncodableValue.fromPrimitiveValue(input);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
      expect(encodable.encode(), equals('null'));
    });
    test('from primitive list (implicit)', () {
      // execute
      final encodable = EncodableValue.fromPrimitiveList([null]);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
      expect(encodable.encode(), equals('[null]'));
    });
    test('from primitive list (explicit)', () {
      // execute
      final List<String?> input = [null];
      final encodable = EncodableValue.fromPrimitiveList(input);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
      expect(encodable.encode(), equals('[null]'));
    });
    test('from object (implicit)', () {
      // execute
      final encodable = EncodableValue.fromObject(null);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
      expect(encodable.encode(), equals('null'));
    });
    test('from object (explicit)', () {
      // execute
      final User? input = null;
      final encodable = EncodableValue.fromObject(input);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
      expect(encodable.encode(), equals('null'));
    });
    test('from object list (implicit)', () {
      // execute
      final encodable = EncodableValue.fromObjectList([null]);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
      expect(encodable.encode(), equals('[null]'));
    });
    test('from object list (explicit)', () {
      // execute
      final List<User?> input = [null];
      final encodable = EncodableValue.fromObjectList(input);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
      expect(encodable.encode(), equals('[null]'));
    });
  });
  group('empty lists >>', () {
    test('list constructor', () {
      // execute
      final encodable = EncodableValue.list([]);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
      expect(encodable.encode(), equals('[]'));
    });
    test('from primitive list (dynamic)', () {
      // execute
      final encodable = EncodableValue.fromPrimitiveList<dynamic>([]);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
      expect(encodable.encode(), equals('[]'));
    });
    test('from primitive list (inferred)', () {
      // prepare input
      final aNumList = <num>[];
      // execute
      final encodable = EncodableValue.fromPrimitiveList(aNumList);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
      expect(encodable.encode(), equals('[]'));
    });
    test('from primitive list (explicit)', () {
      // execute
      final encodable = EncodableValue.fromPrimitiveList<num>([]);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
      expect(encodable.encode(), equals('[]'));
    });
    test('from primitive list (type denied)', () {
      // prepare input
      final aSetList = <Set>[];
      // execute
      EncodableValue testCall() => EncodableValue.fromPrimitiveList(aSetList);
      // check
      expect(testCall, throwsA(TypeMatcher<JsonPreparationError>()));
    });
    test('from object list (implicit)', () {
      // execute
      final encodable = EncodableValue.fromObjectList([]);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
      expect(encodable.encode(), equals('[]'));
    });
    test('from object list (inferred)', () {
      // prepare input
      final aUserList = <User>[];
      // execute
      final encodable = EncodableValue.fromObjectList(aUserList);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
      expect(encodable.encode(), equals('[]'));
    });
    test('from object list (explicit)', () {
      // execute
      final encodable =
          EncodableValue.fromObjectList<User, Map<String, dynamic>>([]);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
      expect(encodable.encode(), equals('[]'));
    });
  });
  group('map constructor >>', () {
    test('standard usage', () {
      // prepare input
      final someData = {'pi': 3.14};
      // execute
      final encodable = EncodableValue.map(someData);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
  });
  group('list constructor >>', () {
    test('standard usage', () {
      // prepare input
      final someData = ['pi', 3.14];
      // execute
      final encodable = EncodableValue.list(someData);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
  });
  group('from primitive value >>', () {
    test('standard usage (string)', () {
      // prepare input
      final someData = 'hello!';
      // execute
      final encodable = EncodableValue.fromPrimitiveValue(someData);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('standard usage (int)', () {
      // prepare input
      final someData = 42;
      // execute
      final encodable = EncodableValue.fromPrimitiveValue(someData);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('standard usage (double)', () {
      // prepare input
      final someData = 3.14;
      // execute
      final encodable = EncodableValue.fromPrimitiveValue(someData);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('standard usage (bool)', () {
      // prepare input
      final someData = false;
      // execute
      final encodable = EncodableValue.fromPrimitiveValue(someData);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('explicit type (num)', () {
      // prepare input
      final someData = 3.14;
      // execute
      final encodable = EncodableValue.fromPrimitiveValue<num>(someData);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('explicit type (Null)', () {
      // prepare input
      final someData = null;
      // execute
      final encodable = EncodableValue.fromPrimitiveValue<Null>(someData);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('check primitive type', () {
      // prepare input
      final someData = {};
      // execute
      EncodableValue testCall() => EncodableValue.fromPrimitiveValue(someData);
      // check
      expect(testCall, throwsA(TypeMatcher<JsonPreparationError>()));
    });
  });
  group('from primitive list >>', () {
    test('standard usage (string)', () {
      // prepare input
      final someData = ['h', 'e', 'l', 'l', 'o', '!'];
      // execute
      final encodable = EncodableValue.fromPrimitiveList(someData);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('standard usage (int)', () {
      // prepare input
      final someData = [1, 2, 3, 4, 5];
      // execute
      final encodable = EncodableValue.fromPrimitiveList(someData);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('standard usage (double)', () {
      // prepare input
      final someData = [1.0, 2.0, 3.0, 4.0, 5.0];
      // execute
      final encodable = EncodableValue.fromPrimitiveList(someData);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('standard usage (bool)', () {
      // prepare input
      final someData = [true, false, false, true, true];
      // execute
      final encodable = EncodableValue.fromPrimitiveList(someData);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('explicit type (num)', () {
      // prepare input
      final someData = [3.14, 42, 3.14, 42];
      // execute
      final encodable = EncodableValue.fromPrimitiveList<num>(someData);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('check primitive type', () {
      // prepare input
      final someData = [{}, {}, {}];
      // execute
      EncodableValue testCall() => EncodableValue.fromPrimitiveList(someData);
      // check
      expect(testCall, throwsA(TypeMatcher<JsonPreparationError>()));
    });
    test('null filled (implicit)', () {
      // execute
      final encodable = EncodableValue.fromPrimitiveList([null, null, null]);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('empty (implicit)', () {
      // execute
      final encodable = EncodableValue.fromPrimitiveList([]);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
  });
  group('from object >>', () {
    test('standard usage (w/ toJson())', () {
      // prepare input
      final someData = User(
          id: 1,
          name: 'Leanne Graham',
          username: 'Bret',
          email: 'Sincere@april.biz');
      // execute
      final encodable = EncodableValue.fromObject(someData);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('standard usage (w/ encoder #1)', () {
      // prepare input
      final someData = User(
          id: 1,
          name: 'Leanne Graham',
          username: 'Bret',
          email: 'Sincere@april.biz');
      // execute
      final encodable = EncodableValue.fromObject<User, String?>(someData,
          encoder: (User user) => user.username);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('standard usage (w/ encoder #2)', () {
      // prepare input
      final someData = User(
          id: 1,
          name: 'Leanne Graham',
          username: 'Bret',
          email: 'Sincere@april.biz');
      // execute
      final encodable = EncodableValue.fromObject(someData,
          encoder: (User user) => user.toJson());
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('explicit types (w/ toJson())', () {
      // prepare input
      final someData = User(
          id: 1,
          name: 'Leanne Graham',
          username: 'Bret',
          email: 'Sincere@april.biz');
      // execute
      final encodable =
          EncodableValue.fromObject<User, Map<String, dynamic>>(someData);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('explicit types (w/ encoder)', () {
      // prepare input
      final someData = User(
          id: 1,
          name: 'Leanne Graham',
          username: 'Bret',
          email: 'Sincere@april.biz');
      // execute
      final encodable = EncodableValue.fromObject<User, String?>(someData,
          encoder: (user) => user.username);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('check encodable type (w/ toJson())', () {
      // prepare input
      final someData = User(
          id: 1,
          name: 'Leanne Graham',
          username: 'Bret',
          email: 'Sincere@april.biz');
      // execute
      EncodableValue testCall() =>
          EncodableValue.fromObject<User, String>(someData);
      // check
      expect(testCall, throwsA(TypeMatcher<JsonPreparationError>()));
    });
    test('check encodable type (w/ encoder)', () {
      // prepare input
      final someData = User(
          id: 1,
          name: 'Leanne Graham',
          username: 'Bret',
          email: 'Sincere@april.biz');
      // execute
      dynamic testCall() => EncodableValue.fromObject(someData,
          encoder: (User user) => {user.username, user.email});
      // check
      expect(testCall, throwsA(TypeMatcher<JsonPreparationError>()));
    });
    test('check toJson()', () {
      // prepare input
      final someData = {42};
      // execute
      EncodableValue testCall() => EncodableValue.fromObject(someData);
      // check
      expect(testCall, throwsA(TypeMatcher<JsonPreparationError>()));
    });
  });
  group('from object list >>', () {
    test('standard usage (w/ toJson())', () {
      // prepare input
      final someData = [
        User(
            id: 1,
            name: 'Leanne Graham',
            username: 'Bret',
            email: 'Sincere@april.biz')
      ];
      // execute
      final encodable = EncodableValue.fromObjectList(someData);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('standard usage (w/ encoder #1)', () {
      // prepare input
      final someData = [
        User(
            id: 1,
            name: 'Leanne Graham',
            username: 'Bret',
            email: 'Sincere@april.biz')
      ];
      // execute
      final encodable = EncodableValue.fromObjectList(someData,
          encoder: (User user) => user.username);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('standard usage (w/ encoder #2)', () {
      // prepare input
      final someData = [
        User(
            id: 1,
            name: 'Leanne Graham',
            username: 'Bret',
            email: 'Sincere@april.biz'),
        null,
      ];
      // execute
      final encodable = EncodableValue.fromObjectList(someData,
          encoder: (User? user) => user?.toJson());
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('explicit types (w/ toJson())', () {
      // prepare input
      final someData = [
        User(
            id: 1,
            name: 'Leanne Graham',
            username: 'Bret',
            email: 'Sincere@april.biz')
      ];
      // execute
      final encodable =
          EncodableValue.fromObjectList<User, Map<String, dynamic>>(someData);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('explicit types (w/ encoder)', () {
      // prepare input
      final someData = [
        User(
            id: 1,
            name: 'Leanne Graham',
            username: 'Bret',
            email: 'Sincere@april.biz')
      ];
      // execute
      final encodable = EncodableValue.fromObjectList<User, String?>(someData,
          encoder: (User user) => user.username);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('check encodable type (w/ toJson())', () {
      // prepare input
      final someData = [
        User(
            id: 1,
            name: 'Leanne Graham',
            username: 'Bret',
            email: 'Sincere@april.biz'),
        null,
      ];
      // execute
      EncodableValue testCall() =>
          EncodableValue.fromObjectList<User?, String>(someData);
      // check
      expect(testCall, throwsA(TypeMatcher<JsonPreparationError>()));
    });
    test('check encodable type (w/ encoder)', () {
      // prepare input
      final someData = [
        User(
            id: 1,
            name: 'Leanne Graham',
            username: 'Bret',
            email: 'Sincere@april.biz')
      ];
      // execute
      EncodableValue testCall() => EncodableValue.fromObjectList(someData,
          encoder: (User user) => {user.username, user.email});
      // check
      expect(testCall, throwsA(TypeMatcher<JsonPreparationError>()));
    });
    test('check toJson()', () {
      // prepare input
      final someData = [
        {42}
      ];
      // execute
      EncodableValue testCall() => EncodableValue.fromObjectList(someData);
      // check
      expect(testCall, throwsA(TypeMatcher<JsonPreparationError>()));
    });
    test('null filled (implicit)', () {
      // execute
      final encodable = EncodableValue.fromObjectList([null, null, null]);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('null filled (inferred)', () {
      // prepare input
      final someData = <User?>[null, null, null];
      // execute
      final encodable = EncodableValue.fromObjectList(someData);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('null filled (explicit)', () {
      // execute
      final encodable =
          EncodableValue.fromObjectList<User?, Map<String, dynamic>?>(
              [null, null, null]);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
    test('empty (implicit)', () {
      // execute
      final encodable = EncodableValue.fromObjectList([]);
      // check
      expect(encodable, isA<EncodableValue>());
      expect(encodable, isNotNull);
    });
  });
}
