void main() {
  Map<String, dynamic> person = {
    'name': 'John',
    'address': 'New York',
    'age': 25,
    'country': 'USA'
  };

  // Update country
  person['country'] = 'Canada';

  // Print all keys and values
  person.forEach((key, value) {
    print("$key: $value");
  });
}
