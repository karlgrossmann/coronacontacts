import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchScreenState();
  }
}

class SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: null, //count restaurants
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Container(
                child: ListTile(
                  onTap: () {}, //definition what happens when click on it
                  title: Text('Da Vino'), //restaurants name
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('Pfad'), //image path
                  ),
                ),
              ),
            );
          }),
    );
  }
}
