import 'package:flutter/material.dart';
import 'package:coronacontacts/nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Bottom Nav Bar', home: Nav());
  }
}
