import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchScreenState();
  }
}

class SearchScreenState extends State<SearchScreen> {
  Widget _buildSaveButton() {
    return RaisedButton(
        child: Text(
      'Restaurants',
      style: TextStyle(color: Colors.white, fontSize: 16),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Restaurant')),
        body: new SizedBox(
          width: 400.0,
          height: 85.0,
          child: new RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Restaurant 1'),
            color: Colors.white,
          ),
        ));
  }
}
