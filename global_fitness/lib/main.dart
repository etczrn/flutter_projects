import 'package:flutter/material.dart';
import 'screens/intro_screen.dart';

// entry point
void main() {
  runApp(GlobalApp());
}

class GlobalApp extends StatelessWidget {
  const GlobalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // implicit new keyword
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: IntroScreen(),
    );
  }
}
