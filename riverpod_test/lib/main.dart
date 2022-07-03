import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // * Wrap our root widget with a ProviderScope.
  // * ProviderScope is a widget that stores the state of all the providers we create.
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
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
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

final valueProvider = Provider<int>((ref) {
  return 36;
});

// * Provider itself doesn't give us any capability to change its value.
// * For that we need to create a StateProvider:
final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // * 1. watch the counterStateProvider
    final counter = ref.watch(counterStateProvider);

    return Scaffold(
      body: Center(
        child: Text(
          // * 2. use the counter value
          'Value: $counter',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      // * To verify that our code works,
      // * we can add a floatingActionButton argument to our Scaffold:
      floatingActionButton: FloatingActionButton(
        // * We should always use ref.read() rather than ref.watch()
        // * to access providers inside a callback.
        onPressed: () => ref.read(counterStateProvider.state).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
