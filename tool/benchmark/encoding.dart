import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:json_util/json_util.dart';

class EncodingBenchmark extends BenchmarkBase {
  const EncodingBenchmark() : super('Encoding');

  static void main() {
    const EncodingBenchmark().report();
  }

  // The benchmark code.
  @override
  void run() {
    final map = {
      'key0': {
        'key0': {'key0': 'value0'},
        'key1': [0, 1, 2, 3, 4, 5],
        'key2': 666.666,
        'key3': 42,
        'key4': false,
      },
    };
    final encodableValue = EncodableValue.map(map);
    final jsonString = encodableValue.encode();
    jsonString.length;
  }

  // Not measured setup code executed prior to the benchmark runs.
  @override
  void setup() {}

  // Not measures teardown code executed after the benchmark runs.
  @override
  void teardown() {}
}

void main() {
  // Run
  EncodingBenchmark.main();
}
