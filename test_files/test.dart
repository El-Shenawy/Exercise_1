import 'package:test/test.dart';
import 'package:csv/csv.dart';
import 'dart:io';

import '../bin/exercise1.dart';

void main() {
  group('Process Input File', () {
    test('Test 1: Correct average quantity and popular brand', () {
      final inputFilePath = 'test_files/input_example.csv';

      final expectedAverageQuantity = {
        'shoes': 2.0,
        'forks': 0.75,
      };

      final expectedPopularBrand = {
        'shoes': 'Air',
        'forks': 'Pfitzcraft',
      };

      processInputFile(inputFilePath);

      final averageQuantityFile = File('0_input_example.csv');
      final averageQuantityContent = averageQuantityFile.readAsStringSync();
      final averageQuantityRecords =
          const CsvToListConverter().convert(averageQuantityContent);

      final popularBrandFile = File('1_input_example.csv');
      final popularBrandContent = popularBrandFile.readAsStringSync();
      final popularBrandRecords =
          const CsvToListConverter().convert(popularBrandContent);

      expect(averageQuantityRecords, expectedAverageQuantity);
      expect(popularBrandRecords, expectedPopularBrand);
    });

    test('Test 2: Empty input file', () {
      final inputFilePath = 'test_files/empty.csv';
      processInputFile(inputFilePath);

      final averageQuantityFile = File('test_files/0_empty.csv');
      final averageQuantityContent = averageQuantityFile.readAsStringSync();

      final popularBrandFile = File('test_files/1_empty.csv');
      final popularBrandContent = popularBrandFile.readAsStringSync();

      expect(averageQuantityContent, isEmpty);
      expect(popularBrandContent, isEmpty);
    });
  });
}
