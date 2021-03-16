import 'package:flutter/material.dart';
import 'package:messenger/screens/messenger_page/messenger_page.dart';
import 'package:messenger/widgets/custom_text_field.dart';

class MainScreen extends StatefulWidget {
  static List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text(
        'Index 0: Account',
      ),
    ),
    Center(
      child: CustomTextField(
          // 'Index 1: Business',
          ),
    ),
    MessengerScreen(),
    Center(
      child: Text(
        'Index 0: Search',
      ),
    ),
    Center(
      child: Text(
        'Index 0: Home',
      ),
    ),
  ];

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainScreen._widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.notifications),
            icon: Icon(Icons.notifications_outlined),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.messenger),
            icon:Icon(Icons.messenger_outline),
            label: 'Messenger',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.search_outlined),
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
