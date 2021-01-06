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

  _addVisit(customer, locality) async {
    _storeVisit(locality);

    DocumentReference customerRef = await FirebaseFirestore.instance.doc('customers/' + customer);
    DocumentReference localityRef = await FirebaseFirestore.instance.doc('localities/' + locality);

    return visits
      .add({
        'customer': customerRef, 
        'locality': localityRef, 
        'time_entry': DateTime.now().millisecondsSinceEpoch
      })
      .then((value) => _showSuccess())
      .catchError((error) => _showFailure("Failed to add visit: $error"));
  }

  Future<void> addVisit(customer, locality) async {
  // Call the user's CollectionReference to add a new user

    final SharedPreferences prefs = await _prefs;
    final localityId = prefs.getString('localityId') ?? 0;
    final lastVisitTime = prefs.getInt('lastVisitTime') ?? 0;

    if (localityId != locality) {
      _addVisit(customer, locality);
    } else if ((lastVisitTime + 3600000) <= DateTime.now().millisecondsSinceEpoch) {
      _addVisit(customer, locality);
    } else {
      _showFailure('Please wait an hour to scan the same code again.');
    }
  }

  Future<void> _storeVisit(locality) async {
    final SharedPreferences prefs = await _prefs;
    
    prefs.setString('localityId', locality);
    prefs.setInt('lastVisitTime', DateTime.now().millisecondsSinceEpoch);
  }

  Future _scan() async {
    await Permission.camera.request();
    String barcode = await scanner.scan();
    if (barcode == null) {
      _showFailure('There was an error with scanning.');
    } else {
      _id = barcode;

      final SharedPreferences prefs = await _prefs;
      final id = prefs.getString('customerId') ?? 0;
      if (id == 0) {
        _showFailure('Please leave your details first.');
      } else {
        _customerId = id;

        addVisit(_customerId, _id);
      }
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
        image: AssetImage('assets/qrcode.png')),
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

  Widget _buildLoadingSpinner() {
    return CircularProgressIndicator(
      value: null,
      backgroundColor: Colors.grey,
    );
  }

  Future _showSuccess() async {
    await Scaffold.of(context).showSnackBar(
      SnackBar(content: Text('Visit successfully stored!'),)
    );
  }

    Future _showFailure(description) async {
    await Scaffold.of(context).showSnackBar(
      SnackBar(content: Text(description),)
    );
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
          return Container(
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
            ));
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return _buildLoadingSpinner();
  });
}
}