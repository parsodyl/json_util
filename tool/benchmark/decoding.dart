import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:json_util/json_util.dart';

class DecodingBenchmark extends BenchmarkBase {
  const DecodingBenchmark() : super('Decoding');

  static const String kJsonString = '{"key0":{"key0":{"key0":"value0"},'
      '"key1":[0,1,2,3,4,5],"key2":666.666,"key3":42,"key4":false}}';

  static void main() {
    const DecodingBenchmark().report();
  }

  // The benchmark code.
  @override
  void run() {
    final decodedValue = DecodedValue.from(kJsonString);
    final map = decodedValue.asMap()!;
    map.length;
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
  DecodingBenchmark.main();
}
