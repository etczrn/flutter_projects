import 'package:flutter/material.dart';
import '../data/sp_helper.dart';
import '../data/session.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({Key? key}) : super(key: key);

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Training Sessions'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
