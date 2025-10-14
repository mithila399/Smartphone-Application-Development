import 'dart:io';

void main() async {
  final sourceFile = File('hello.txt');
  final copyFile = await sourceFile.copy('hello_copy.txt');
  print('File copied to ${copyFile.path}');
}
