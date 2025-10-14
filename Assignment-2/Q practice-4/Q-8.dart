import 'dart:io';

void main() {
  List<String> tasks = [];
  while (true) {
    print("\n=== TO-DO APP ===");
    print("1. Add Task");
    print("2. Remove Task");
    print("3. View Tasks");
    print("4. Exit");
    stdout.write("Choose an option: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("Enter task: ");
        String task = stdin.readLineSync()!;
        tasks.add(task);
        print("Task added!");
        break;
      case '2':
        stdout.write("Enter task to remove: ");
        String taskToRemove = stdin.readLineSync()!;
        if (tasks.remove(taskToRemove)) {
          print("Task removed!");
        } else {
          print("Task not found!");
        }
        break;
      case '3':
        print("\nYour Tasks:");
        if (tasks.isEmpty) {
          print("No tasks added yet.");
        } else {
          for (int i = 0; i < tasks.length; i++) {
            print("${i + 1}. ${tasks[i]}");
          }
        }
        break;
      case '4':
        print("Goodbye!");
        return;
      default:
        print("Invalid choice! Try again.");
    }
  }
}
