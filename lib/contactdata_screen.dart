import 'package:flutter/material.dart';

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
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  Widget _buildInputLabel(text) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xFFBBC2CF)),
          ),
        ));
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
          print(_name);
          print(_email);
          print(_phoneNumber);
          print(_street);
          print(_city);
          print(_zipcode);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: ListView(
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
            ]));
  }
}