import 'dart:io';

/// Entry point of the program.
void main() {
  final inputFileName = stdin.readLineSync()!.trim();
  processInputFile(inputFileName);
}

/// Processes the input file and generates the output files.
///
/// Arguments:
/// - inputFileName: The name of the input file.
void processInputFile(String inputFileName) {
  // Initialize data structures.
  final productQuantity = <String, int>{};
  final productBrandCount = <String, Map<String, int>>{};

  // Read input file.
  final inputFile = File(inputFileName);
  final lines = inputFile.readAsLinesSync();

  // Compute total quantity and brand count for each product.
  for (var i = 1; i < lines.length; i++) {
    final row = lines[i].split(',');

    final product = row[2].trim();
    final quantity = int.parse(row[3].trim());
    final brand = row[4].trim();

    productQuantity[product] = (productQuantity[product] ?? 0) + quantity;
    productBrandCount[product] ??= {};

    productBrandCount[product]![brand] =
        (productBrandCount[product]![brand] ?? 0) + 1;
  }

  // Compute average quantity and most popular brand for each product.
  final averages = <String, double>{};
  final popularBrands = <String, String>{};
  final totalOrders = lines.length - 1;

  for (var product in productQuantity.keys) {
    final quantity = productQuantity[product]!;
    averages[product] = quantity / totalOrders;

    final brands = productBrandCount[product]!;
    final popularBrand =
        brands.entries.reduce((a, b) => a.value > b.value ? a : b).key;
    popularBrands[product] = popularBrand;
  }

  // Write output files.
  writeCsvFile('0_$inputFileName', ['Product Name', 'Average Quantity'],
      averages.entries);
  writeCsvFile('1_$inputFileName', ['Product Name', 'Most Popular Brand'],
      popularBrands.entries);
}

/// Writes data to a CSV file.
///
/// Arguments:
/// - fileName: The name of the output file.
/// - header: The list of column headers.
/// - data: The list of data entries.
void writeCsvFile(String fileName, List<String> header,
    Iterable<MapEntry<String, dynamic>> data) {
  final file = File(fileName);
  final csvSink = file.openWrite();

  // Write header row.
  csvSink.writeln(header.join(','));

  // Write data rows.
  for (var entry in data) {
    final row = [entry.key, entry.value].map((value) => '"$value"').join(',');
    csvSink.writeln(row);
  }

  // Close file.
  csvSink.close();
}
