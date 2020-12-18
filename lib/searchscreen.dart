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
            //
            return Card(
              child: ListTile(
                onTap: () {},
                title: Text('Da Vino'), //restaurants name
              ),
            );
          }),
    );
  }
}
