import 'package:flutter/material.dart';

class TransmitScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransmitScreenState();
  }
}

class TransmitScreenState extends State<TransmitScreen> {

  Widget _buildSaveButton() {
    return RaisedButton(
        child: Text(
          'Scan',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Scan Demo')),
        body: Container(
            margin: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_buildSaveButton()],
            )));
  }
}