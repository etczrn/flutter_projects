import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/clock_hand.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';

class StopwatchRenderer extends StatelessWidget {
  final Duration elapsed;
  final double radius;
  const StopwatchRenderer({
    Key? key,
    required this.elapsed,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.orange),
              borderRadius: BorderRadius.circular(radius)),
        ),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
              handLength: radius,
              rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
              handTickness: 2,
              color: Colors.orange),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeText(
            elapsed: elapsed,
          ),
        ),
      ],
    );
  }
}
