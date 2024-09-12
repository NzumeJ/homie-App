import 'package:flutter/material.dart';
import 'package:homie/profilePage.dart';
import 'package:homie/Notifications/notificationPage1.dart';
import 'package:homie/Dashboard.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => DashboardPage(),
        ),
        );
        break;
      case 1:
        Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => NotificationPage(),
        ),);
        break;
      case 2:
        Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => ProfilePage(),
        ),);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.lightBlueAccent,
      items: const <BottomNavigationBarItem>[

        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.white,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications, color: Colors.white),
          label: 'Notification',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.white),
          label: 'Profile' ,
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,

    );
  }
}

