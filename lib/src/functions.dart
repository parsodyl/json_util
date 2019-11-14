/// A function that creates an object of the type [E] starting from one of the
/// type [N].
typedef ObjectEncoder<N, E> = E Function(N nonEncodableObject);

/// A function that creates an object of the type [T] starting from one of the
/// type [E].
typedef ObjectTransformer<E, T> = T Function(E encodedObject);
