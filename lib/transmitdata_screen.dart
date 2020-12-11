import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class TransmitDataScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransmitDataScreenState();
  }
}

class TransmitDataScreenState extends State<TransmitDataScreen> {
  String _id;

  Future _scan() async {
    await Permission.camera.request();
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('No return from barcode scanner.');
    } else {
      _id = barcode;
      print(_id);
    }
  }

  Widget _buildSaveButton() {
    return RaisedButton(
        child: Text(
          'Scan',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        onPressed: _scan);
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
