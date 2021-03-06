import 'package:flutter/material.dart';
import 'screens/bmi_screen.dart';
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
      routes: {
        '/': (context) => IntroScreen(),
        '/bmi': (context) => BmiScreen(),
      },
      initialRoute: '/',
    );
  }
}
