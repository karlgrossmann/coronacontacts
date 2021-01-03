//Bottom Navigation Bar

import 'package:coronacontacts/contactdata_screen.dart';
import 'package:coronacontacts/restaurant_screen.dart';
import 'package:coronacontacts/transmitdata_screen.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    ContactDataScreen(),
    TransmitDataScreen(),
    RestaurantScreen(),
    Text('Location'),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            icon: Icon(Icons.home),
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
            icon: Icon(Icons.add_location_outlined),
            title: Text(''),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
