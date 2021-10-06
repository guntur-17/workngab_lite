import 'package:absen_lite/pages/dashboard_pages.dart';
import 'package:flutter/material.dart';
import 'profile_pages.dart';

import 'package:absen_lite/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int _currentIndex = 0;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget costumBottomNavBar() {
      return ClipRRect(
        // borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(18), topRight: Radius.circular(18)),

        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
              print(_selectedIndex);
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
        ),
      );
    }

    Widget body() {
      switch (_selectedIndex) {
        case 0:
          return DashboardPage();
          break;

        case 1:
          return ProfilePage();
          break;
        default:
          return DashboardPage();
      }
    }

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: costumBottomNavBar(),
        backgroundColor: whiteColor,
        body: body(),
      ),
    );
  }
}
