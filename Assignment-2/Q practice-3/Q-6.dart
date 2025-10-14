void main() {
  print(reverseString("Dart"));
}

String reverseString(String text) {
  return text.split('').reversed.join();
}
