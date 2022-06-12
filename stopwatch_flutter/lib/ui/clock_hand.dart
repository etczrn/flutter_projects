import 'package:flutter/material.dart';

class ClockHand extends StatelessWidget {
  final double rotationZAngle;
  final double handTickness;
  final double handLength;
  final Color color;
  const ClockHand({
    Key? key,
    required this.rotationZAngle,
    required this.handTickness,
    required this.handLength,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..translate(-handTickness / 2, 0.0, 0.0)
        ..rotateZ(rotationZAngle),
      child: Container(
        height: handLength,
        width: handTickness,
        color: color,
      ),
    );
  }
}
