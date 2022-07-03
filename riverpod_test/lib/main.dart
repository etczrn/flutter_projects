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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // * 1. Add a Consumer
        child: Consumer(
          // * 2. Specify the builder and obtain a WidgetRef
          // * The Consumer's builder argument gives us a WidgetRef object
          // * that we can use to watch the value of the provider.
          // * Riverpod lets us access providers by reference, not by type.
          // * This means that we can have as many providers as we want of the same type.
          builder: (_, ref, __) {
            // * 3. Use ref.watch() to get the value of the provider
            final value = ref.watch(valueProvider);
            return Text(
              'Value: $value',
              style: Theme.of(context).textTheme.headline4,
            );
          },
        ),
      ),
    );
  }
}
