import 'package:bird_buddy/Login/landingPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BirdBuddy',
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}
