import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // The keyword 'late' is used to indicate
  // that the variable has no value right not
  // but will be assigned a value before it is used
  // It is kind of like a contact
  late final TextEditingController _email;
  late final TextEditingController _password;

  // Two steps for state: initState and dispose
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Column(
        children: [
          // If you want to use the content of text field,
          // you need to use the `controller` property
          // that grabs the latest information from the text field.
          TextField(
            controller: _email,
          ),
          TextField(
            controller: _password,
          ),
          TextButton(onPressed: () async {}, child: const Text('Register')),
        ],
      ),
    );
  }
}
