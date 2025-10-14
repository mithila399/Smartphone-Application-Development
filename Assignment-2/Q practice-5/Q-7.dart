import 'dart:io';

void main() async {
  final file = File('students.csv');

  // Write CSV data
  List<List<String>> students = [
    ['Name', 'Age', 'Address'],
    ['Alice', '20', 'New York'],
    ['Bob', '22', 'California'],
    ['Charlie', '21', 'Texas']
  ];

  String csvData = students.map((row) => row.join(',')).join('\n');
  await file.writeAsString(csvData);
  print('students.csv created successfully');

  // Read CSV data
  String contents = await file.readAsString();
  print('\nReading data from students.csv:\n');
  print(contents);
}
