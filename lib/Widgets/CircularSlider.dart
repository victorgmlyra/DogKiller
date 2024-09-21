import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CircularSlider extends StatefulWidget {
  final Function setServoPos;

  CircularSlider(this.setServoPos);

  @override
  _CircularSliderState createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  double actualValue = 90;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Align(
        alignment: Alignment.topCenter,
        heightFactor: 0.7,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: SleekCircularSlider(
            appearance: CircularSliderAppearance(
              customColors: CustomSliderColors(
                progressBarColor: Colors.teal,
                trackColor: Color(0x5580CBC4),
              ),
              angleRange: 180,
              startAngle: 180,
              size: 230,
              animationEnabled: false,
              customWidths: CustomSliderWidths(
                trackWidth: 5,
                progressBarWidth: 5,
                handlerSize: 10,
              ),
              infoProperties: InfoProperties(
                bottomLabelText: 'Angle',
                bottomLabelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w200,
                ),
                mainLabelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w200,
                ),
                modifier: (double value) {
                  final roundedValue = value.ceil().toInt().toString();
                  return '$roundedValue°';
                },
              ),
            ),
            initialValue: 90,
            max: 180,
            min: 10,
            onChange: (double value) {
              widget.setServoPos(value, actualValue);
            },
          ),
        ),
      ),
    );
  }
}
