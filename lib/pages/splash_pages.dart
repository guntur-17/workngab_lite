import 'dart:async';

import 'package:absen_lite/pages/home.dart';
import 'package:absen_lite/pages/login_pages.dart';
import 'package:absen_lite/providers/attendance_provider.dart';
import 'package:absen_lite/providers/auth_provider.dart';
import 'package:absen_lite/providers/shop_provider.dart';
import 'package:absen_lite/providers/visiting_all_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme.dart';

String? finalUsername;

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Route route = MaterialPageRoute(builder: (context) => HomePage());

  @override
  void initState() {
    // Timer(
    //   Duration(seconds: 1),
    //   () => Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
    //   ),
    // );
    // clear();
    validator();
    getattendance();
    getshop();
    getvisiting();
    //perubahan
    // getValidationData().whenComplete(() async {
    // Timer(
    //   Duration(seconds: 3),
    //   () => Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //         builder: (BuildContext context) =>
    //             (finalUsername == null ? LoginPage() : DashboardPage())),
    //   ),
    // );
    // }
    // );
    super.initState();
  }

  clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // var username = prefs.getString('username');
    // var password = prefs.getString('password');
    var token = prefs.getString('token');
    await Provider.of<AuthProvider>(context, listen: false)
        .getUser(token: token);
    Navigator.pushReplacement(context, route);
  }

  validator() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // var username = prefs.getString('username');
    // var password = prefs.getString('password');
    var token = prefs.getString('token');
    if (token != null) {
      setState(() {
        // print(username);
        // print(password);
        print(token);
        getUser();
      });
    } else {
      Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
        ),
      );
    }
  }

  getattendance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    await Provider.of<AttedanceProvider>(context, listen: false)
        .getAttendances(token);
    // await AttedanceProvider().getAttendances(token);
    // Navigator.pushReplacement(context, route);
  }

  getshop() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    await Provider.of<ShopProvider>(context, listen: false).getShops(token);
    // await AttedanceProvider().getAttendances(token);
    // Navigator.pushReplacement(context, route);
  }

  getvisiting() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    await Provider.of<VisitingAllProvider>(context, listen: false)
        .getAllVisit(token);
  }

  //perubahan
  // Future getValidationData() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var obtainedUsername = prefs.getString('username');
  //   setState(() {
  //     finalUsername = obtainedUsername;
  //   });
  //   print(finalUsername);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: Center(
          child: GestureDetector(
              child: Image.asset(
        "assets/workab_logo.png",
      ))),
    );
  }
}
