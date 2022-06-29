import 'package:flutter/material.dart';
import 'package:rest_api_test/api_service.dart';
import 'package:rest_api_test/model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<User>? _users = [];

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  void _getUsers() async {
    // * Call a method to get the data from our API
    _users = await ApiService().getUsers();
    // * Delay for simulating a network call
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: _users == null || _users!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _users!.length,
              itemBuilder: (BuildContext context, int idx) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_users![idx].id.toString()),
                          Text(_users![idx].username),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_users![idx].email),
                          Text(_users![idx].website),
                        ],
                      )
                    ],
                  ),
                );
              }),
    );
  }
}
