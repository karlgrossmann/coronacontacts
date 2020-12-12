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

  Widget _buildHeadingText(text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text, 
        style: TextStyle(
          fontSize: 30, 
          color: Color(0xFF0213B5), 
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _buildScanHint(){
    return Container(
        padding: EdgeInsets.all(15),
        child: Text(
          'Press the button to scan the code and leave your contact details.',
          style: TextStyle(
            color: Color(0xFFBBC2CF),
            fontSize: 19,
          ),
          textAlign: TextAlign.center,
        ),
    );
  }

  Widget _buildQRImage(){
    return Container(
      child: Image(
        height: 250,
        image: NetworkImage('https://i.ibb.co/XyVqkQN/frame-1.png'),
      )
    );
  }

  Widget _buildSaveButton() {
    return RaisedButton(
        color: Color(0xFF0099FF),
        padding: EdgeInsets.only(left: 50, right: 50, top: 15, bottom: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Text(
          'Scan',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        onPressed: _scan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Container(
            margin: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                _buildHeadingText('Scan Code'),
                SizedBox(height: 50),
                _buildScanHint(),
                SizedBox(height: 30),
                _buildQRImage(),
                SizedBox(height: 50),
                _buildSaveButton()
              ],
            )));
  }
}
