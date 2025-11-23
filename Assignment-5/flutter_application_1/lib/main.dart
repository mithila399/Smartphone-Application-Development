import 'package:flutter/material.dart';
import 'package:flutter_application_1/Homepage/Homepage.dart';  
// ↑ replace flutter_application_1 with your project name from pubspec.yaml

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}