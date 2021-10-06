import 'package:absen_lite/widgets/clock_card.dart';
import 'package:flutter/material.dart';
import 'package:absen_lite/theme.dart';

class AttendanceHistoryPage extends StatelessWidget {
  const AttendanceHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget card() {
      return Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          // margin: EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width * 0.90,
                child: Column(
                  children: [
                    ClockOutCard(),
                    ClockInCard(),
                    ClockOutCard(),
                    ClockInCard(),
                    ClockOutCard(),
                    ClockInCard(),
                    ClockOutCard(),
                    ClockInCard(),
                    ClockOutCard(),
                    ClockInCard(),
                    ClockOutCard(),
                    ClockInCard(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            toolbarHeight: 120,
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            backgroundColor: Colors.white,
            bottomOpacity: 0.0,
            elevation: 0.0,
            title: new Text(
              'Attendance History',
              style: trueBlackTextStyle.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              card(),
            ],
          ),
        ),
      ),
    );
  }
}
