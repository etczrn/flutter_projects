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
                // child: const Text('Hello container'),
                width: 300.0,
                height: 200.0,
                // child: FlutterLogo(),
                margin: const EdgeInsets.all(50.0),
                // padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.pink.shade50,
                      Colors.pink.shade100,
                    ]),
                    image: const DecorationImage(
                      image: NetworkImage('https://bit.ly/3MLFXl4'),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle))
          ],
        ),
      ),
    );
  }
}
