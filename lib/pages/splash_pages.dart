import 'dart:async';

import 'package:absensi_project/pages/dashboard_pages.dart';
import 'package:absensi_project/pages/login_pages.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class SplashPage extends StatelessWidget {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
      ),
    );
    return Scaffold(
      backgroundColor: blueColor,
      body: Center(
          child: GestureDetector(
              // onTap: () {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => LoginPage()));
              // },
              child: Image.asset(
        "assets/workab_logo.png",
      ))),
    );
  }
}
