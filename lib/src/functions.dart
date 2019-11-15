import 'package:json_util/src/decoded_value.dart';
import 'package:json_util/src/encodable_value.dart';

/// A function that creates an object of the type [E] starting from one of the
/// type [N].
///
/// This is used by [EncodableValue] and [E] typically represents a
/// JSON-encodable type.
typedef ObjectEncoder<N, E> = E Function(N nonEncodableObject);

/// A function that creates an object of the type [T] starting from one of the
/// type [E].
///
/// This is used by [DecodedValue] and [E] typically represents a
/// JSON-encodable type.
typedef ObjectTransformer<E, T> = T Function(E encodedObject);
