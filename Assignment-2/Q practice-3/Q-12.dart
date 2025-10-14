void main() {
  print(calculateArea(5, 3));
  print(calculateArea()); // uses default 1x1
}

num calculateArea([num length = 1, num width = 1]) {
  return length * width;
}
