import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ContactDataScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactDataScreenState();
  }
}

class ContactDataScreenState extends State<ContactDataScreen> {
  String _name;
  String _email;
  String _phoneNumber;
  String _street;
  String _city;
  String _zipcode;

  String _id;
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  /*========  BACKEND CONNECTION =========*/

  // Define an async function to initialize FlutterFire
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference customers = FirebaseFirestore.instance.collection('customers');

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _saveId(id) async {
    final SharedPreferences prefs = await _prefs;
    
    prefs.setString('customerId', id);
    print('Customers hash successfully stored.');
  }

  Future<void> addCustomer(fullName, email, phone, street, city, zipcode) {
  // Call the user's CollectionReference to add a new user
    return customers
      .add({
        'name': fullName, 
        'email': email, 
        'phone': phone,
        'street': street,
        'city': city,
        'zipcode': zipcode
      })
      .then((value) => _saveId(value.id))
      .catchError((error) => print("Failed to add customer: $error"));
  }

  /*===== BUILD ITEMS =======*/

  Widget _buildNameField() {
    return TextFormField(
      style: TextStyle(
          color: Color(0xFF1B1A22),
          fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 20.0, bottom: 20.0, right: 15.0, left: 15.0),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Color(0xFFF0EFF1)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          labelText: 'Full Name',
          labelStyle: TextStyle(
            color: Color(0xFF848286),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is required';
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      style: TextStyle(
          color: Color(0xFF1B1A22),
          fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 20.0, bottom: 20.0, right: 15.0, left: 15.0),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Color(0xFFF0EFF1)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          labelText: 'Email',
          labelStyle: TextStyle(
            color: Color(0xFF848286),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is required';
        }

        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return 'Please enter a valid email address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPhoneNumberField() {
    return TextFormField(
      style: TextStyle(
          color: Color(0xFF1B1A22),
          fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 20.0, bottom: 20.0, right: 15.0, left: 15.0),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Color(0xFFF0EFF1)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          labelText: 'Phone Number',
          labelStyle: TextStyle(
            color: Color(0xFF848286),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is required';
        }

        if (!RegExp(r"(\(?([\d \-\)\–\+\/\(]+){6,}\)?([ .\-–\/]?)([\d]+))")
            .hasMatch(value)) {
          return 'Provide a valid phone number';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  Widget _buildStreetField() {
    return TextFormField(
      style: TextStyle(
          color: Color(0xFF1B1A22),
          fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 20.0, bottom: 20.0, right: 15.0, left: 15.0),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Color(0xFFF0EFF1)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          labelText: 'Street Name',
          labelStyle: TextStyle(
            color: Color(0xFF848286),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Street is required';
        }
        return null;
      },
      onSaved: (String value) {
        _street = value;
      },
    );
  }

  Widget _buildCityField() {
    return TextFormField(
      style: TextStyle(
          color: Color(0xFF1B1A22),
          fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 20.0, bottom: 20.0, right: 15.0, left: 15.0),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Color(0xFFF0EFF1)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          labelText: 'City Name',
          labelStyle: TextStyle(
            color: Color(0xFF848286),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'City is required';
        }

        return null;
      },
      onSaved: (String value) {
        _city = value;
      },
    );
  }

  Widget _buildZipcodeField() {
    return TextFormField(
      style: TextStyle(
          color: Color(0xFF1B1A22),
          fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 20.0, bottom: 20.0, right: 15.0, left: 15.0),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Color(0xFFF0EFF1)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          labelText: 'Zip Code',
          labelStyle: TextStyle(
            color: Color(0xFF848286),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Zipcode is required';
        }

        if (!RegExp(r"^\d{5}$").hasMatch(value)) {
          return 'Provide a valid zipcode';
        }

        return null;
      },
      onSaved: (String value) {
        _zipcode = value;
      },
    );
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

  Widget _buildDataHint(){
    return Container(
        color: Color(0xFFF2F2F2),
        padding: EdgeInsets.all(15),
        child: Text(
          'These information were added during opening the account. Please check if they are correct and edit them if necessary.',
        ),
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
          'Save',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        onPressed: () {
          if (!_formKey.currentState.validate()) {
            return;
          }
          _formKey.currentState.save();
          addCustomer(_name, _email, _phoneNumber, _street, _city, _zipcode);
        });
  }

  Widget _buildLoadingSpinner() {
    return CircularProgressIndicator(
      value: null,
      backgroundColor: Colors.grey,
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
            child: ListView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(20.0),
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 30),
                        _buildHeadingText('Contact Details'),
                        SizedBox(height: 20),
                        _buildDataHint(),
                        SizedBox(height: 20),
                        _buildNameField(),
                        SizedBox(height: 20),
                        //_buildInputLabel('E-Mail'),
                        _buildEmailField(),
                        SizedBox(height: 20),
                        //_buildInputLabel('Phone'),
                        _buildPhoneNumberField(),
                        SizedBox(height: 20),
                        //_buildInputLabel('Street'),
                        _buildStreetField(),
                        SizedBox(height: 20),
                        //_buildInputLabel('City'),
                        _buildCityField(),
                        SizedBox(height: 20),
                        //_buildInputLabel('Zipcode'),
                        _buildZipcodeField(),
                        SizedBox(height: 30),
                        _buildSaveButton(),
                      ],
                    ),
                  )
                ]
              )
            );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return _buildLoadingSpinner();

      });
  }
}
