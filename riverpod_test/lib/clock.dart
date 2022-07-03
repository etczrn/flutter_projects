import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// * This class sets the initial state in the constructor
// * (by calling super(DateTime.now())),
// * and updates the state every second using a periodic timer.
class Clock extends StateNotifier<DateTime> {
  // * 1. initialize with current time
  Clock() : super(DateTime.now()) {
    // * 2. create a timer that fires every second
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      // * 3. update the state with the current time
      state = DateTime.now();
    });
  }
  late final Timer _timer;

  // * 4. cancel the timer when finished
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

// * Once we have Clock class, we can create a new provider:
final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) {
  return Clock();
});
