import 'dart:convert';
import 'dart:core';

/// Exception thrown when a string does not have the
/// expected JSON format and cannot be parsed.
class JsonFormatException extends FormatException {
  /// Default constructor.
  JsonFormatException([String message = '', String source, int offset])
      : super(message, source, offset);

  /// Constructs a [JsonFormatException] starting from a parent [FormatException].
  JsonFormatException.fromParent(FormatException parent)
      : super(parent.message, parent.source, parent.offset);

  @override
  String toString() {
    return 'Json${super.toString()}';
  }
}

/// Error thrown during a JSON encoding operation.
class JsonEncodingError extends Error {
  /// The cause of this error.
  final dynamic cause;

  /// Default constructor.
  JsonEncodingError(this.cause);

  /// Constructs a [JsonEncodingError] starting from an instance
  /// of [JsonUnsupportedObjectError].
  JsonEncodingError.fromUnsupportedObject(JsonUnsupportedObjectError error)
      : cause = error;

  @override
  String toString() {
    return 'JsonEncodingError: $cause';
  }
}

/// Error thrown during a JSON decoding operation.
class JsonDecodingError extends Error {
  /// The cause of this error.
  final dynamic cause;

  /// Default constructor.
  JsonDecodingError(this.cause);

  @override
  String toString() {
    return 'JsonDecodingError: cause: $cause';
  }
}

/// Signature for a generic error thrown by EncodableValue.
abstract class EncodableValueError extends Error {
  /// The cause of this error.
  dynamic get cause;
}

/// Error thrown during a JSON preparation operation.
class JsonPreparationError extends Error implements EncodableValueError {
  @override
  final dynamic cause;

  /// Default constructor.
  JsonPreparationError(this.cause);

  @override
  String toString() {
    return 'JsonPreparationError: $cause';
  }
}

/// Signature for a generic error thrown by DecodedValue.
abstract class DecodedValueError extends Error {
  /// The cause of this error.
  dynamic get cause;
}

/// Error thrown during a JSON checking operation.
class JsonCheckingError extends Error implements DecodedValueError {
  @override
  final dynamic cause;

  /// Default constructor.
  JsonCheckingError(this.cause);

  @override
  String toString() {
    return 'JsonCheckingError: $cause';
  }
}

/// Error thrown during a JSON casting operation.
class JsonCastingError extends CastError implements DecodedValueError {
  @override
  final dynamic cause;

  /// Default constructor.
  JsonCastingError(this.cause);

  @override
  String toString() {
    return 'JsonCastingError: $cause';
  }
}

/// Error thrown during a JSON transformation operation.
class JsonTransformationError extends Error implements DecodedValueError {
  @override
  final dynamic cause;

  /// Default constructor.
  JsonTransformationError(this.cause);

  @override
  String toString() {
    return 'JsonTransformationError: $cause';
  }
}

/// Error thrown during a JSON extraction operation.
class JsonExtractionError extends Error implements DecodedValueError {
  @override
  final dynamic cause;

  /// Default constructor.
  JsonExtractionError(this.cause);

  @override
  String toString() {
    return 'JsonExtractionError: $cause';
  }
}
