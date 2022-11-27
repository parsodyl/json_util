import 'dart:convert';
import 'dart:typed_data';

void main() {
  final jsonRecord = Utf8Encoder().convert(jsonEncode({
    'best_final_score': 6,
    'average_final_score' : 3,
    'worst_final_score': 0,
  }));
  final rawRecord = Uint8List.fromList([6, 3, 0]);
  print('jsonRecord has size ${jsonRecord.length}');
  print('rawRecord has size ${rawRecord.length}');
}