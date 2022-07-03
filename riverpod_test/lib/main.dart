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

// * 1. Extend [ConsumerStatefulWidget]
class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// * 2. Extend [ConsumerState]
class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // * If we need to read the provider value
    // * in any of the other widget life-cycle methods, we can use ref.read().

    // * 3. use ref.read() in the widget life-cycle methods
    final value = ref.read(valueProvider);
  }

  @override
  Widget build(BuildContext context) {
    // * Note how the build() method only gives us a BuildContext
    // * when we subclass from ConsumerState, but we can still access the ref object.
    // * This is because ConsumerState declares WidgetRef as a property,
    // * much like the Flutter State class declares BuildContext as a property
    // * that can be accessed directly inside all the widget life-cycle methods.

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
