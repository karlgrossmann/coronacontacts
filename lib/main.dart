import 'package:flutter/material.dart';
import 'package:coronacontacts/nav.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Corona Contacts App', home: Nav());
  }
}
