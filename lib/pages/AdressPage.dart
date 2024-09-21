import 'package:flutter/material.dart';

class AdressPage extends StatefulWidget {
  final Function setIP;

  AdressPage(this.setIP);

  @override
  _AdressPageState createState() => _AdressPageState();
}

class _AdressPageState extends State<AdressPage> {
  String _ip = '192.168.15.8';  //'192.168.137.41';

  Widget _buildIPTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.desktop_windows),
          labelText: 'IP Adress',
          filled: true,
          fillColor: Colors.white12,
          labelStyle: TextStyle(color: Colors.white)),
      onChanged: (String ip) {
        setState(() {
          _ip = ip;
        });
      },
    );
  }

  void _submitIP() {
    if (_ip != '') { // Uncomment in final version
      print(_ip);
      widget.setIP(_ip);
      Navigator.pushNamed(context, '/com');
    }
  }

  @override
  Widget build(BuildContext context) {
    final targetWidth = MediaQuery.of(context).size.width > 500.0 ? 450.0 : MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Killer Dog'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: targetWidth,
            child: Column(
              children: <Widget>[
                SizedBox(height: 5,),
                _buildIPTextField(),
                SizedBox(
                  height: 30.0,
                ),
                RaisedButton(
                  child: Text('Enter'),
                  onPressed: _submitIP,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
