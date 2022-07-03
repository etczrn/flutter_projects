import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// * In general, you should always think of StateNotifier
// * as the place where your business logic goes:
// *          read/write                                   ref.read(provider).method()
// * Service <----------> Model(extends StateNotifier) <------------------------------- Widget
// *                                                    ------------------------------>
// *                                                           ref.watch(provider)
// * When you setup things this way, your widgets can:
// * - watch the model's state and rebuild when it changes.
// * - call methods in your model classes (using ref.read(provider).someMethod()),
// * which in turn can update the state and interact with external services if needed.

class Clock extends StateNotifier<DateTime> {
  Clock() : super(DateTime.now()) {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      state = DateTime.now();
    });
  }
  late final Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) {
  return Clock();
});
