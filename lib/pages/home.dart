import 'package:absensi_project/pages/dashboard_pages.dart';
import 'package:flutter/material.dart';
import 'profile_pages.dart';

import 'package:absensi_project/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // Widget customButtonNav() {
    //   return ClipRRect(
    //     borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    //     child: BottomAppBar(
    //       shape: CircularNotchedRectangle(),
    //       notchMargin: 5,
    //       clipBehavior: Clip.antiAliasWithSaveLayer,
    //       child: BottomNavigationBar(
    //           currentIndex: currentIndex,
    //           onTap: (value) {
    //             setState(() {
    //               currentIndex = value;
    //               print(currentIndex);
    //             });
    //           },
    //           backgroundColor: primary,
    //           type: BottomNavigationBarType.fixed,
    //           items: [
    //             BottomNavigationBarItem(
    //                 icon: Image.asset(
    //                   'assets/homeIcon.png',
    //                   width: 21,
    //                   height: 20,
    //                   color: (currentIndex == 0) ? primary : secondary,
    //                 ),
    //                 label: ''),
    //             BottomNavigationBarItem(
    //                 icon: Image.asset('assets/homeIcon.png',
    //                     width: 20,
    //                     height: 18,
    //                     color: (currentIndex == 1) ? primary : secondary),
    //                 label: ''),
    //             BottomNavigationBarItem(
    //                 icon: Image.asset('assets/homeIcon.png',
    //                     width: 20,
    //                     height: 18,
    //                     color: (currentIndex == 2) ? primary : secondary),
    //                 label: ''),
    //             BottomNavigationBarItem(
    //                 icon: Image.asset('assets/homeIcon.png',
    //                     width: 18,
    //                     height: 20,
    //                     color: (currentIndex == 3) ? primary : secondary),
    //                 label: '')
    //           ]),
    //     ),
    //   );
    // }

    Widget costumBottomNavBar() {
      return ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteColor,
            onTap: (value) {
              setState(() {
                currentIndex = value;
                print(currentIndex);
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/home.png',
                    width: 24,
                    height: 24,
                    color: (currentIndex == 0) ? blueColor : blackColor,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/notification.png',
                    width: 24,
                    height: 24,
                    color: (currentIndex == 1) ? blueColor : blackColor,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/profile.png',
                    width: 24,
                    height: 24,
                    color: (currentIndex == 2) ? blueColor : blackColor,
                  ),
                  label: '')
            ]),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return DashboardPage();
          break;
        case 1:
          return Text('1');
          break;
        case 2:
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
