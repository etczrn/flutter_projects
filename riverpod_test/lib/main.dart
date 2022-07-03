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

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterStateProvider);

    // * In this case, the callback gives us a StateController<int> argument
    // * that represents the new state of our provider,
    // * and we can use it to show a SnackBar.
    ref.listen<StateController<int>>(counterStateProvider.state,
        (previous, current) {
      // * Note: this callback executes when the provider value changes,
      // * not when the build method is called
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Value is ${current.state}'),
        ),
      );
    });

    return Scaffold(
      body: Center(
        child: Text(
          'Value: $counter',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterStateProvider.state).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
