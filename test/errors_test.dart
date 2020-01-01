import 'package:json_util/json_util.dart';
import 'package:test/test.dart';

void main() {
  group('JsonFormatException >>', () {
    test('std constructor', () {
      // execute
      final exception = JsonFormatException();
      // check
      expect(exception, isA<JsonFormatException>());
    });
    test('toString method', () {
      // execute
      final exception = JsonFormatException();
      final toString = exception.toString();
      // check
      expect(toString, isA<String>());
    });
  });
  group('JsonEncodingError >>', () {
    test('std constructor', () {
      // execute
      final exception = JsonEncodingError(null);
      // check
      expect(exception, isA<JsonEncodingError>());
    });
    test('toString method', () {
      // execute
      final exception = JsonEncodingError(null);
      final toString = exception.toString();
      // check
      expect(toString, isA<String>());
    });
  });
  group('JsonDecodingError >>', () {
    test('std constructor', () {
      // execute
      final exception = JsonDecodingError(null);
      // check
      expect(exception, isA<JsonDecodingError>());
    });
    test('toString method', () {
      // execute
      final exception = JsonDecodingError(null);
      final toString = exception.toString();
      // check
      expect(toString, isA<String>());
    });
  });
  group('JsonPreparationError >>', () {
    test('std constructor', () {
      // execute
      final exception = JsonPreparationError(null);
      // check
      expect(exception, isA<JsonPreparationError>());
    });
    test('toString method', () {
      // execute
      final exception = JsonPreparationError(null);
      final toString = exception.toString();
      // check
      expect(toString, isA<String>());
    });
  });
  group('JsonCheckingError >>', () {
    test('std constructor', () {
      // execute
      final exception = JsonCheckingError(null);
      // check
      expect(exception, isA<JsonCheckingError>());
    });
    test('toString method', () {
      // execute
      final exception = JsonCheckingError(null);
      final toString = exception.toString();
      // check
      expect(toString, isA<String>());
    });
  });
  group('JsonCastingError >>', () {
    test('std constructor', () {
      // execute
      final exception = JsonCastingError(null);
      // check
      expect(exception, isA<JsonCastingError>());
    });
    test('toString method', () {
      // execute
      final exception = JsonCastingError(null);
      final toString = exception.toString();
      // check
      expect(toString, isA<String>());
    });
  });
  group('JsonTransformationError >>', () {
    test('std constructor', () {
      // execute
      final exception = JsonTransformationError(null);
      // check
      expect(exception, isA<JsonTransformationError>());
    });
    test('toString method', () {
      // execute
      final exception = JsonTransformationError(null);
      final toString = exception.toString();
      // check
      expect(toString, isA<String>());
    });
  });
  group('JsonExtractionError >>', () {
    test('std constructor', () {
      // execute
      final exception = JsonExtractionError(null);
      // check
      expect(exception, isA<JsonExtractionError>());
    });
    test('toString method', () {
      // execute
      final exception = JsonExtractionError(null);
      final toString = exception.toString();
      // check
      expect(toString, isA<String>());
    });
  });
}
