import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your app name',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Your Title here'),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.orange,
              // child: const Text('Hello container'),
              width: 100.0,
              height: 100.0,
            )
          ],
        ),
      ),
    );
  }
}
