import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text_basic.dart';
import 'package:stopwatch_flutter/ui/reset_button.dart';
import 'package:stopwatch_flutter/ui/start_stop_button.dart';
import 'package:stopwatch_flutter/ui/stopwatch_renderer.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;

  bool _isRunning = false;
  Duration _previouslyElapsed = Duration.zero;
  Duration _currentlyElapsed = Duration.zero;

  Duration get _elapsed => _previouslyElapsed + _currentlyElapsed;

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
        _currentlyElapsed = elapsed;
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _toggleRunning() {
    setState(() {
      _isRunning = !_isRunning;
      if (_isRunning) {
        _ticker.start();
      } else {
        _ticker.stop();
        _previouslyElapsed += _currentlyElapsed;
        _currentlyElapsed = Duration.zero;
      }
    });
  }

  void _reset() {
    _ticker.stop();
    setState(() {
      _isRunning = false;
      _currentlyElapsed = Duration.zero;
      _previouslyElapsed = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final radius = constraints.maxWidth / 2;
      return Stack(
        children: [
          StopwatchRenderer(
            elapsed: _elapsed,
            radius: radius,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
                width: 80,
                height: 80,
                child: ResetButton(
                  onPressed: _reset,
                )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
                width: 80,
                height: 80,
                child: StartStopButton(
                  isRunning: _isRunning,
                  onPressed: _toggleRunning,
                )),
          )
        ],
      );
    });
  }
}
