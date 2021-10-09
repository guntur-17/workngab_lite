import 'dart:async';

import 'package:absen_lite/models/attendance_model.dart';
import 'package:absen_lite/pages/attendance_history_pages.dart';
import 'package:absen_lite/pages/visiting_list_pages.dart';
import 'package:absen_lite/providers/attendance_provider.dart';
import 'package:absen_lite/theme.dart';
import 'package:absen_lite/widgets/clock_card.dart';
import 'package:absen_lite/widgets/loading_button.dart';
import 'package:absen_lite/widgets/menu_card.dart';
import 'package:absen_lite/widgets/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:absen_lite/providers/auth_provider.dart';
import 'package:absen_lite/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // Timer? timer;
  // int counter = 0;
  bool isLoading = false;

  // void initState() {
  //   // attedanceProvider.getAttendances(authProvider.user.access_token);
  //   attendanceHandler();
  //   // timer =
  //   //     Timer.periodic(Duration(seconds: 1), (Timer t) => attendanceHandler());
  //   super.initState();
  // }

  // initState() {
  //   // attedanceProvider.getAttendances(authProvider.user.access_token);
  //   isLoading = true;
  //   attendanceHandler();
  //   super.initState();
  // }

  // attendanceHandler() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var token = prefs.getString('token');
  //   await AttedanceProvider().getAttendances(token);
  //   // Navigator.push(
  //   //   context,
  //   //   MaterialPageRoute(builder: (context) => AttendanceHistoryPage()),
  //   // );
  //   // setState(() {
  //   //   isLoading = false;
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    AttedanceProvider attedanceProvider =
        Provider.of<AttedanceProvider>(context, listen: false);

    // bool isLoading = false;
    attendanceHandler() async {
      // setState(() {
      //   isLoading = true;
      // });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      await Provider.of<AttedanceProvider>(context, listen: false)
          .getAttendances(token);
    }

    // void initState() {
    //   super.initState();
    //   attendanceHandler();
    // }

    setState(() {
      attendanceHandler();

      setState(() {
        isLoading = false;
      });
    });

    UserModel nick = authProvider.user;

    String? gambar = nick.photo;

    Widget nama() {
      return Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30, right: 12, top: 10),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome, ${nick.name}',
                              textAlign: TextAlign.left,
                              style: whiteTextStyle.copyWith(
                                  fontSize: 20, fontWeight: semiBold),
                            ),
                            Text(
                              'Sales',
                              textAlign: TextAlign.left,
                              style: whiteTextStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget menu() {
      return RelativeBuilder(
        builder: (context, height, width, sy, sx) {
          return Container(
            margin: EdgeInsets.only(top: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AttendanceCard(),
                SizedBox(
                  width: 10,
                ),
                VisitCard(),
              ],
            ),
          );
        },
      );
    }

    Widget header() {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/header.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 22, right: 22, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/dashboard_logo.png',
                          color: whiteColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Dashboard',
                          style: whiteTextStyle.copyWith(
                              fontSize: 22, fontWeight: semiBold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: 50,
                      height: 50,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage("$gambar")))),
                ],
              ),
            ),
            Column(
              children: [
                nama(),
                menu(),
              ],
            ),
          ],
        ),
      );
    }

    Widget attencance_history() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.85,
        margin: EdgeInsets.only(top: 22, bottom: 10),
        // height: 195,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Attendance History',
                  style: trueBlackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                InkWell(
                  child: Text(
                    // '${authProvider.user.access_token}',
                    'See all',
                    style: trueBlackTextStyle.copyWith(
                        fontSize: 14, fontWeight: light),
                  ),
                  onTap: () {
                    attedanceProvider
                        .getAttendances(authProvider.user.access_token);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AttendanceHistoryPage()));
                    // attendanceHandler();
                  },
                )
              ],
            ),
            Column(
              children: attedanceProvider.attendances
                  .map((attendance) => ClockOutCard(attendance))
                  .toList(),
            ),
            // SizedBox(
            //   height: 6,
            // ),
            // ClockOutCard(),
            // // SizedBox(
            // //   height: 6,
            // // ),
            // ClockInCard(),
          ],
        ),
      );
    }

    Widget visiting_list() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.85,
        margin: EdgeInsets.only(top: 12, bottom: 10),
        // height: 195,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today Visiting List',
                  style: trueBlackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                InkWell(
                  child: Text(
                    'See All',
                    style: trueBlackTextStyle.copyWith(
                        fontSize: 14, fontWeight: light),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VisitingListPage()));
                  },
                )
              ],
            ),
            SizedBox(
              height: 6,
            ),
            ShopCard(),
            // SizedBox(
            //   height: 6,
            // ),
            ShopCard(),
          ],
        ),
      );
    }

    Widget body() {
      return Container(
        // transform: Matrix4.translationValues(0.0, -115.0, 0.0),
        child: Column(
          children: [
            isLoading ? LoadingButton() : attencance_history(),
            // visiting_list(),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: sosowhitecolor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              body(),
            ],
          ),
        ),
      ),
    );
  }
}
