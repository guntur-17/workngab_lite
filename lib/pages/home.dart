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
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget costumBottomNavBar() {
      return ClipRRect(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
              print(_selectedIndex);
            });
          },
          items: const [
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
          return const DashboardPage();

        case 1:
          return const ProfilePage();

        default:
          return const DashboardPage();
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
