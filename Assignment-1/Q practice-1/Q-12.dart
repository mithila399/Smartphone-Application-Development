void main() {
  double distance = 25; // km
  double speed = 40;    // km/h
  double timeInHours = distance / speed;
  double timeInMinutes = timeInHours * 60;
  print('Time to reach office: $timeInMinutes minutes');
}
