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
              width: 200.0,
              height: 200.0,
              margin: const EdgeInsets.all(100.0),
              // padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                  color: Colors.red,
                  gradient: LinearGradient(tileMode: TileMode.clamp, colors: [
                    Colors.green,
                    Colors.blue,
                  ]),
                  // shape: BoxShape.circle,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0))),
            )
          ],
        ),
      ),
    );
  }
}
