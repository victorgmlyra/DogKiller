import 'dart:math' as math;

import 'package:flutter/material.dart';

class Strenght extends StatefulWidget {
  final Function changeStrenght;

  Strenght(this.changeStrenght);

  @override
  _StrenghtState createState() => _StrenghtState();
}

class _StrenghtState extends State<Strenght> {
  double strenght = 200.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          height: 40.0,
        ),
        Transform.rotate(
          angle: 3 * math.pi / 2,
          child: Container(
            width: 200.0,
            child: SliderTheme(
              data: SliderThemeData(
                trackHeight: 5.0,
                activeTrackColor: Colors.teal,
                thumbColor: Colors.white,
                inactiveTrackColor: Color(0x5580CBC4),
              ),
              child: Slider(
                value: strenght,
                onChanged: (newStrenght) {
                  setState(() {
                    strenght = newStrenght;
                  });
                },
                min: 0,
                max: 255,
                onChangeEnd: widget.changeStrenght,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          'Strenght',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w200,
          ),
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
