import 'dart:async';

import 'package:absen_lite/pages/home.dart';
import 'package:absen_lite/pages/login_pages.dart';
import 'package:absen_lite/providers/attendance_provider.dart';
import 'package:absen_lite/providers/auth_provider.dart';
import 'package:absen_lite/providers/shop_provider.dart';
import 'package:absen_lite/providers/visiting_all_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme.dart';

String? finalUsername;

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Route route = MaterialPageRoute(builder: (context) => const HomePage());
  bool isLoading = false;

  @override
  void initState() {
    validator();

    super.initState();
  }

  clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('token');
    if (await Provider.of<AuthProvider>(context, listen: false)
        .getUser(token: token)) {
      Navigator.pushReplacement(context, route);
    } else {
      Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginPage()),
        ),
      );
    }
    // Navigator.pushReplacement(context, route);
  }

  validator() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('token');
    if (token != null) {
      setState(() {
        print(token);
        getUser();
        getattendance();
        getshop();
        getvisiting();
      });
    } else {
      Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginPage()),
        ),
      );
    }
  }

  getattendance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    await Provider.of<AttedanceProvider>(context, listen: false)
        .getAttendances(token);
  }

  getshop() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    await Provider.of<ShopProvider>(context, listen: false).getShops(token);
  }

  getvisiting() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    await Provider.of<VisitingAllProvider>(context, listen: false)
        .getAllVisit(token);
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        backgroundColor: blueColor,
        body: Center(
            child: GestureDetector(
          child: Image.asset(
            "assets/logos.png",
            width: sx(200),
            height: sy(200),
          ),
        )),
      );
    });
  }
}
