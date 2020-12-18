//Bottom Navigation Bar

import 'package:coronacontacts/searchscreen.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    Text('Home'),
    Text('Home'),
    Text('FickDICH'),
    Text('Home')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          //5 Icons
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create_outlined),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place_outlined),
            title: Text(''),
          ),
        ],
        currentIndex: _selectedIndex,
      ),
    );
  }
}
