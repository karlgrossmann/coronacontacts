import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TransmitDataScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransmitDataScreenState();
  }
}

class TransmitDataScreenState extends State<TransmitDataScreen> {
  String _id;
  String _customerId;

  /*========  BACKEND CONNECTION =========*/

  // Define an async function to initialize FlutterFire
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference visits = FirebaseFirestore.instance.collection('visits');

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> addVisit(customer, locality) async {
  // Call the user's CollectionReference to add a new user

    DocumentReference customerRef = await FirebaseFirestore.instance.doc('customers/' + customer);
    DocumentReference localityRef = await FirebaseFirestore.instance.doc('localities/' + locality);

    return visits
      .add({
        'customer': customerRef, 
        'locality': localityRef, 
        'time_entry': DateTime.now().millisecondsSinceEpoch
      })
      .then((value) => print("Visit added" ))
      .catchError((error) => print("Failed to add visit: $error"));
  }

  Future _scan() async {
    await Permission.camera.request();
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('No return from barcode scanner.');
    } else {
      _id = barcode;

      final SharedPreferences prefs = await _prefs;
      final id = prefs.getString('customerId') ?? 0;
      print('Customers hash successfully loaded.');
      _customerId = id;

      addVisit(_id, _customerId);
      print('Customer ' + _customerId + ' in locality ' + _id + ' transmitted.');
    }
  }

  /*===== BUILD ITEMS =======*/

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
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('Something went wrong');
          return null;
        }

        // Once complete, show application
        if (snapshot.connectionState == ConnectionState.done) {
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

        // Otherwise, show something whilst waiting for initialization to complete
        print('Loading ...');
        return null;
  });
}
}