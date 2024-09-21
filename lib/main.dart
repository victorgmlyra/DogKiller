import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

import './pages/comunication.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String webSocket = 'ws://34.95.213.249:65080';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Killer',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        accentColor: Colors.lime,
        buttonColor: Colors.teal,
      ),
      routes: {
        '/': (BuildContext context) => ComunicationPage(
              channel: IOWebSocketChannel.connect(webSocket),
            ),
      },
      onUnknownRoute: (RouteSettings settings) {
        // if onGenerateRoute failed run an unknown page
        return MaterialPageRoute(
          builder: (BuildContext context) => ComunicationPage(
            channel: IOWebSocketChannel.connect(webSocket),
          ),
        );
      },
    );
  }
}
