void main() {
  List<String> friends = ['Alice', 'Bob', 'Anita', 'Charlie', 'Alex', 'David', 'Ava'];

  var startsWithA = friends.where((name) => name.startsWith('A')).toList();
  print("Friends starting with A: $startsWithA");
}
