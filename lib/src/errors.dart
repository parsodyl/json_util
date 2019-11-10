import 'dart:convert';
import 'dart:core';

/// Exception thrown when a string does not have the
/// expected JSON format and cannot be parsed.
class JsonFormatException extends FormatException {
  /// Default constructor.
  JsonFormatException([String message = "", String source, int offset])
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
    return 'JsonEncodingError: cause: $cause';
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

/// Error thrown during a JSON casting operation.
class JsonCastingError extends CastError {
  /// The cause of this error.
  final dynamic cause;

  /// Default constructor.
  JsonCastingError(this.cause);

  @override
  String toString() {
    return 'JsonCastingError: cause: $cause';
  }
}

/// Error thrown during a JSON extraction operation.
class JsonExtractionError extends Error {
  /// The cause of this error.
  final dynamic cause;

  /// Default constructor.
  JsonExtractionError(this.cause);

  @override
  String toString() {
    return 'JsonExtractionError: cause: $cause';
  }
}

/// Error thrown during a JSON preparation operation.
class JsonPreparationError extends Error {
  /// The cause of this error.
  final dynamic cause;

  /// Default constructor.
  JsonPreparationError(this.cause);

  @override
  String toString() {
    return 'JsonPreparationError: cause: $cause';
  }
}

/// Error thrown during a JSON checking operation.
class JsonCheckingError extends Error {
  /// The cause of this error.
  final dynamic cause;

  /// Default constructor.
  JsonCheckingError(this.cause);

  @override
  String toString() {
    return 'JsonCheckingError: cause: $cause';
  }
}
