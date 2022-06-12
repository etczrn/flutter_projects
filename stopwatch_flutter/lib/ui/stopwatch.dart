import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text_basic.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  // * The reason we declare this variable as late is
  // * that _initialTime is non-nullable variable
  // * but it is only initialized in initState,
  // * not when it's declared.
  Duration _elapsed = Duration.zero;
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    // * Ticker automatically syncs to the screen refresh rate
    // * and makes it easier to get the elapsed time

    // * Ticker is a great solution when you want to update the UI every frame
    // * The Flutter animation framework uses tickers under the hood
    // * Do not use Ticker to redraw any part of the UI that doesn't change
    _ticker = this.createTicker((elapsed) {
      setState(() {
        _elapsed = elapsed;
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElapsedTimeText(
      elapsed: _elapsed,
    );
  }
}
