import 'dart:io';

void main() {
  List<double> expenses = [];
  print("Enter number of expenses: ");
  int count = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= count; i++) {
    stdout.write("Enter expense $i: ");
    double amount = double.parse(stdin.readLineSync()!);
    expenses.add(amount);
  }

  double total = expenses.reduce((a, b) => a + b);
  print("Total Expenses: \$${total.toStringAsFixed(2)}");
}
