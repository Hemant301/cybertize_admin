import 'dart:io';

import 'package:cybertize_admin/add_enquary.dart';
import 'package:flutter/material.dart';

import 'all_enquies.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

int selectedIndex = 0;

class _NavState extends State<Nav> {
  final List<Widget> _widgetOptions = <Widget>[
    const AllEnquiry(),
    const AddEnquiry(),
  ];

  void _onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future<bool> _onBack() {
    return check();
  }

  check() {
    if (selectedIndex != 0) {
      setState(() {
        selectedIndex = 0;
      });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Are you sure"),
              content: const Text('Are you sure to quit?'),
              actions: <Widget>[
                TextButton(
                  child:
                      const Text("Stay", style: TextStyle(color: Colors.blue)),
                  onPressed: () => Navigator.pop(context, false),
                ),
                TextButton(
                    onPressed: () {
                      exit(1);
                    },
                    child: const Text("Quit",
                        style: TextStyle(color: Colors.blue))),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBack,
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // selectedItemColor: Colors.white,
          selectedItemColor: const Color(0xff247CFF),
          elevation: 0,
          backgroundColor: Colors.white,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey[600],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              // backgroundColor: primaryLight,
              icon: Icon(
                Icons.dashboard,
              ),
              label: 'All Enquirers',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
              ),
              label: 'All Enquiry',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: _onItemTap,
          // fixedColor: Colors.orange,
        ),
      ),
    );
  }
}
