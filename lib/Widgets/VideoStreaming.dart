import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class VideoStreaming extends StatefulWidget {
  final WebSocketChannel channel;

  VideoStreaming({@required this.channel});

  @override
  _VideoStreamingState createState() => _VideoStreamingState();
}

class _VideoStreamingState extends State<VideoStreaming> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 4.0),
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.black,
      ),
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 240.0,
      width: 320.0,
      child: StreamBuilder(
        stream: widget.channel.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          } else {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.memory(
                snapshot.data,
                gaplessPlayback: true,
              ),
            );
          }
        },
      ),
    );
  }
}
