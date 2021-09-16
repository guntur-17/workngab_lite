import 'package:absensi_project/pages/clockin_pages.dart';
import 'package:absensi_project/pages/reimbursement_pages.dart';
import 'package:absensi_project/pages/timeoff_pages.dart';
import 'package:absensi_project/theme.dart';
import 'package:absensi_project/pages/meetings_pages.dart';
import 'package:absensi_project/pages/payroll_pages.dart';
import 'package:flutter/material.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * 0.10,
      width: MediaQuery.of(context).size.width * 0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: whiteColor,
        border: Border.all(color: whiteColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Image.asset(
              'assets/attendance.png',
            ),
            iconSize: 34,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClockInPage(),
                ),
              );
            },
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            'Attendance',
            style: trueBlackTextStyle.copyWith(fontSize: 8, fontWeight: light),
          )
        ],
      ),
    );
  }
}

class TimeOffCard extends StatelessWidget {
  const TimeOffCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * 0.10,
      width: MediaQuery.of(context).size.width * 0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: whiteColor,
        border: Border.all(color: whiteColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Image.asset(
              'assets/calender.png',
            ),
            iconSize: 34,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TimeoffPage(),
                ),
              );
            },
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            'Time Off',
            style: trueBlackTextStyle.copyWith(fontSize: 8, fontWeight: light),
          )
        ],
      ),
    );
  }
}

class MeetingsCard extends StatelessWidget {
  const MeetingsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * 0.10,
      width: MediaQuery.of(context).size.width * 0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: whiteColor,
        border: Border.all(color: whiteColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Image.asset(
              'assets/meetings.png',
            ),
            iconSize: 34,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MeetingsPage(),
                ),
              );
            },
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            'Meetings',
            style: trueBlackTextStyle.copyWith(fontSize: 8, fontWeight: light),
          )
        ],
      ),
    );
  }
}

class PayRollCard extends StatelessWidget {
  const PayRollCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * 0.10,
      width: MediaQuery.of(context).size.width * 0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: whiteColor,
        border: Border.all(color: whiteColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Image.asset(
              'assets/payroll.png',
            ),
            iconSize: 34,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PayrollPages(),
                ),
              );
            },
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            'Payroll',
            style: trueBlackTextStyle.copyWith(fontSize: 8, fontWeight: light),
          )
        ],
      ),
    );
  }
}

class MedicalCard extends StatelessWidget {
  const MedicalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * 0.10,
      width: MediaQuery.of(context).size.width * 0.23,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: whiteColor,
        border: Border.all(color: whiteColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Image.asset(
              'assets/medical.png',
            ),
            iconSize: 34,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReimbursementPage(),
                ),
              );
            },
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            'Reimbursement',
            style: trueBlackTextStyle.copyWith(fontSize: 8, fontWeight: light),
          )
        ],
      ),
    );
  }
}
