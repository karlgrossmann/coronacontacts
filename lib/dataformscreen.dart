import 'package:flutter/material.dart';

class DataFormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DataFormScreenState();
  }
}

class DataFormScreenState extends State<DataFormScreen> {

  Widget _buildSaveButton() {
    return RaisedButton(
        child: Text(
          'Save Form',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Form Demo')),
        body: Container(
            margin: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_buildSaveButton()],
            )));
  }
}