import 'dart:io';

void main() async {
  final file = File('hello.txt');
  await file.writeAsString('\nFriendName', mode: FileMode.append); // Replace with your friend's name
  print('Friend’s name appended to hello.txt');
}
