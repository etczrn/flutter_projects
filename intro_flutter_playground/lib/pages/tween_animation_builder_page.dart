import 'package:flutter/material.dart';

class TweenAnimationBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TweenAnimationBuilder'),
      ),
      body: Center(
        child: HSVColorSelector(),
      ),
    );
  }
}

class HSVColorSelector extends StatefulWidget {
  @override
  _HSVColorSelectorState createState() => _HSVColorSelectorState();
}

class _HSVColorSelectorState extends State<HSVColorSelector> {
  double _hue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 1500),
          width: 200,
          height: 200,
          color: HSVColor.fromAHSV(1.0, _hue, 1.0, 1.0).toColor(),
        ),
        const SizedBox(height: 48.0),
        TweenAnimationBuilder<double>(
          // * The tween parameter is used to animate
          // * between values of a specific type (e.g. double, Offset, Color).
          tween: Tween<double>(begin: 0.0, end: _hue),
          duration: Duration(microseconds: 1500),
          builder: (context, hue, child) {
            // * returns a widget using the interpolated value
            final hsvColor = HSVColor.fromAHSV(1.0, hue, 1.0, 1.0);
            return Container(
              width: 200,
              height: 200,
              color: hsvColor.toColor(),
            );
          },
        ),
        const SizedBox(
          height: 48.0,
        ),
        Container(
          height: 30.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              for (var h = 0; h <= 360; h++)
                HSVColor.fromAHSV(1.0, h.toDouble(), 1.0, 1.0).toColor()
            ], stops: [
              for (var h = 0; h <= 360; h++) h.toDouble() / 360.0
            ]),
          ),
        ),
        Slider.adaptive(
          value: _hue,
          min: 0,
          max: 360,
          onChanged: (value) => setState(() => _hue = value),
        ),
      ],
    );
  }
}
