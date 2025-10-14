import 'dart:io';

void main() async {
  final file = File('hello.txt');
  await file.writeAsString('YourName'); 
  print('Name written to hello.txt');
}
