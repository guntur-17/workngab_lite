import 'package:absen_lite/models/attendance_model.dart';
import 'package:absen_lite/providers/attendance_provider.dart';
import 'package:absen_lite/providers/auth_provider.dart';
import 'package:absen_lite/widgets/clock_card.dart';
import 'package:flutter/material.dart';
import 'package:absen_lite/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AttendanceHistoryPage extends StatefulWidget {
  const AttendanceHistoryPage({Key? key}) : super(key: key);

  @override
  State<AttendanceHistoryPage> createState() => _AttendanceHistoryPageState();
}

class _AttendanceHistoryPageState extends State<AttendanceHistoryPage> {
  initState() {
    // attedanceProvider.getAttendances(authProvider.user.access_token);
    attendanceHandler();
    super.initState();
  }

  attendanceHandler() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    await AttedanceProvider().getAttendances(token);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => AttendanceHistoryPage()),
    // );
  }

  @override
  // void initState() {
  //   super.initState();
  //   // getInit();
  //   //   await Provider.of<AttendanceModel>(context).
  // }

  // getInit() async {
  //   Provider.of<AttendanceModel>(context).;
  // }

  Widget build(BuildContext context) {
    // AttedanceProvider attedanceProvider =
    //     Provider.of<AttedanceProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    AttedanceProvider attedanceProvider =
        Provider.of<AttedanceProvider>(context, listen: false);

    // Future<void> absen = attedanceProvider.getAttendances();
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
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
                  children: attedanceProvider.attendances
                      .map((attendance) => ClockOutCard(attendance))
                      .toList(),
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
