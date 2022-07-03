import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_test/clock.dart';

void main() {
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

// * If we're working with FutureProvider or StreamProvider,
// * we'll want to dispose of any listeners when our provider is no longer in use.
// * This is easily done by adding an .autoDispose modifier to our provider:
final futureProvider = FutureProvider.autoDispose<int>((ref) {
  return Future.value(36);
});

final streamProvider = StreamProvider.autoDispose<int>((ref) {
  // return Stream.fromIterable([36, 72]);
  return Stream.periodic(const Duration(seconds: 1), (i) => 36 + i);
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // * When we watch a FutureProvider or StreamProvider we get an AsyncValue<T>,
    // * a class used to safely manipulate asynchronous data.
    final streamAsyncValue = ref.watch(streamProvider);
    // final futureAsyncValue = ref.watch(futureProvider); // same syntax

    return Scaffold(
      body: Center(
        // * And then we can use the when() method to map the
        // * data, loading, and error states to different widgets:
        child: streamAsyncValue.when(
          data: (data) => Text('Value: $data'),
          error: (error, stack) => Text('Error: $error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
