//Bottom Navigation Bar

import 'package:coronacontacts/views/contactdata_screen.dart';
import 'package:coronacontacts/views/transmitdata_screen.dart';
import 'package:coronacontacts/views/statistics_screen.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    StatisticsScreen(),
    ContactDataScreen(),
    TransmitDataScreen(),
    //Text('Home'),
    //Text('Contact'),
    Text('Search'),
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
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create_outlined),
            label: 'Edit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation),
            label: 'Send',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
