import 'dart:ui';

import 'package:flutter/material.dart';

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
      home: Scaffold(
          appBar: AppBar(title: Text('Global Fitness')),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/beach.jpg'), fit: BoxFit.cover)),
            child: Center(
                child: Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white70),
              child: Text(
                  'Commit to be fit, dare to be great \with Global Fitness',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, shadows: [
                    Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 2.0,
                        color: Colors.grey)
                  ])),
            )),
          )),
    );
  }
}
