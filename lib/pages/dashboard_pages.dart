import 'package:absen_lite/pages/attendance_history_pages.dart';
import 'package:absen_lite/pages/visiting_list_pages.dart';
import 'package:absen_lite/theme.dart';
import 'package:absen_lite/widgets/clock_card.dart';
import 'package:absen_lite/widgets/menu_card.dart';
import 'package:absen_lite/widgets/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:absen_lite/providers/auth_provider.dart';
import 'package:absen_lite/models/user_model.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
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
                    'See All',
                    style: trueBlackTextStyle.copyWith(
                        fontSize: 14, fontWeight: light),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AttendanceHistoryPage()));
                  },
                )
              ],
            ),
            SizedBox(
              height: 6,
            ),
            ClockOutCard(),
            // SizedBox(
            //   height: 6,
            // ),
            ClockInCard(),
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
            attencance_history(),
            visiting_list(),
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
