import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../Widgets/VideoStreaming.dart';
import '../Widgets/CircularSlider.dart';
import '../Widgets/Strenght.dart';

class ComunicationPage extends StatefulWidget {
  final WebSocketChannel channel;

  ComunicationPage({@required this.channel});

  @override
  _ComunicationPageState createState() => _ComunicationPageState();
}

class _ComunicationPageState extends State<ComunicationPage> {
  bool _visible = false;

  void _changeStrenght(double value) async {
    widget.channel.sink
        .add('?strenght: &' + value.ceil().toInt().toString() + '#');
  }

  void _shoot() async {
    widget.channel.sink.add('?shoot:');
  }

  void _setServoPosition(double value, double actualValue) async {
    if (value - actualValue > 3 || value - actualValue < -3) {
      widget.channel.sink
          .add('?value: &' + value.ceil().toInt().toString() + '#');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              VideoStreaming(
                channel: widget.channel,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: CircularSlider(_setServoPosition),
                      flex: 12,
                    ),
                    Expanded(
                      child: Strenght(_changeStrenght),
                      flex: 9,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/dog.png',
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      AnimatedOpacity(
                        opacity: _visible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 200),
                        child: Image.asset(
                          'assets/shooting.png',
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 18),
                    height: 100.0,
                    width: 100.0,
                    child: FloatingActionButton(
                      backgroundColor: Colors.red[400],
                      splashColor: Color(0xff990000),
                      child: Text(
                        'Fire',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      onPressed: () {
                        _shoot();
                        setState(() {
                          _visible = !_visible;
                        });
                        // GAMBIARRA
                        for (var i = 1; i < 6; i++) {
                          Future.delayed(Duration(milliseconds: 300 * i), () {
                            setState(() {
                              _visible = !_visible;
                            });
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
