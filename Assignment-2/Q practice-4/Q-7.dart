void main() {
  Map<String, String> contacts = {
    'John': '12345',
    'Emma': '67890',
    'Alex': '54321',
    'Bob': '98765'
  };

  var keysLength4 = contacts.keys.where((key) => key.length == 4).toList();
  print("Keys with length 4: $keysLength4");
}
