import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// Build context describes where you are in the tree of widgets
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSwatch(
          //   // dark mode에서는 AppBar 색상이 바뀌지 않음
          //   // brightness: Brightness.dark,
          //   // primarySwatch: Colors.purple,
          // ).copyWith(secondary: Colors.green),
          // textTheme: const TextTheme(bodyText2: TextStyle(fontSize: 20))
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xff009688),
            secondary: const Color(0xff7c4dff),
          ),
          textTheme: const TextTheme(bodyText2: TextStyle(fontSize: 20))),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Building Layouts with Flutter'),
        ),
        body: const Center(
          child: Text(
            'Hello Flutter Layout',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.lightbulb_outline),
          onPressed: () {
            print('You rang?');
          },
        ),
        persistentFooterButtons: [
          IconButton(
            icon: const Icon(Icons.add_comment),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add_alarm),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add_location),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
