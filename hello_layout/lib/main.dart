import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// Build context describes where you are in the tree of widgets
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Building Layouts with Flutter'),
        ),
        body: Center(
          child: Text(
            'Hello Flutter Layout',
            style: TextStyle(fontSize: 24),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.lightbulb_outline),
          onPressed: () {
            print('You rang?');
          },
        ),
        persistentFooterButtons: [
          IconButton(
            icon: Icon(Icons.add_comment),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add_alarm),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add_location),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
