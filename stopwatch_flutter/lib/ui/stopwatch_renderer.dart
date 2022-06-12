import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/elapsed_time_text.dart';

class StopwatchRenderer extends StatelessWidget {
  final Duration elapsed;
  const StopwatchRenderer({Key? key, required this.elapsed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.indigo,
        ),
        ElapsedTimeText(
          elapsed: elapsed,
        ),
      ],
    );
  }
}
