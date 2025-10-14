void main() {
  print(maxNumber(10, 25, 15));
}

num maxNumber(num a, num b, num c) {
  return (a > b && a > c) ? a : (b > c ? b : c);
}
