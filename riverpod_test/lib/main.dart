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

// * 1. Widget class now extends [ConsumerWidget]
class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // * 2. build() method has an extra [WidgetRef] argument
  Widget build(BuildContext context, WidgetRef ref) {
    // * 3. use ref.watch() to get the value of the provider
    final value = ref.watch(valueProvider);
    return Scaffold(
      body: Center(
        child: Text(
          '$value',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
