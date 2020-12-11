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
      decoration: InputDecoration(
          labelText: null,
          fillColor: Color(0xFFEBEBEB),
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Color(0xFFEBEBEB)))),
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
      decoration: InputDecoration(
          labelText: null,
          fillColor: Color(0xFFEBEBEB),
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Color(0xFFEBEBEB)))),
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
      decoration: InputDecoration(
          labelText: null,
          fillColor: Color(0xFFEBEBEB),
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Color(0xFFEBEBEB)))),
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
      decoration: InputDecoration(
          labelText: null,
          fillColor: Color(0xFFEBEBEB),
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Color(0xFFEBEBEB)))),
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
      decoration: InputDecoration(
          labelText: null,
          fillColor: Color(0xFFEBEBEB),
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Color(0xFFEBEBEB)))),
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
      decoration: InputDecoration(
          labelText: null,
          fillColor: Color(0xFFEBEBEB),
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Color(0xFFEBEBEB)))),
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

  Widget _buildSaveButton() {
    return RaisedButton(
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
        appBar: AppBar(title: Text('Form Demo')),
        body: ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(20.0),
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildInputLabel('Full Name'),
                    _buildNameField(),
                    _buildInputLabel('E-Mail'),
                    _buildEmailField(),
                    _buildInputLabel('Phone'),
                    _buildPhoneNumberField(),
                    _buildInputLabel('Street'),
                    _buildStreetField(),
                    _buildInputLabel('City'),
                    _buildCityField(),
                    _buildInputLabel('Zipcode'),
                    _buildZipcodeField(),
                    SizedBox(height: 50),
                    _buildSaveButton(),
                  ],
                ),
              )
            ]));
  }
}
