import 'package:absensi_project/theme.dart';
import 'package:absensi_project/widgets/announce_card.dart';
import 'package:absensi_project/widgets/attendance_card.dart';
import 'package:absensi_project/widgets/menu_card.dart';
import 'announce_pages.dart';
import 'attendance_history_pages.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15, left: 12, right: 12),
            child: Image.asset(
              'assets/welcome.png',
              // height: 165,
              // width: 335,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 39, right: 12),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.17,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Farino Joshua',
                        textAlign: TextAlign.left,
                        style: whiteTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      Text(
                        'IT Support',
                        textAlign: TextAlign.left,
                        style: whiteTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Text(
                        'PT. Idea Indonesia',
                        textAlign: TextAlign.left,
                        style: whiteTextStyle.copyWith(
                            fontSize: 14, fontWeight: reguler),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      );
    }

    Widget menu() {
      return Container(
        height: MediaQuery.of(context).size.height * 0.13,
        // margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 14, right: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: 6,
              ),
              AttendanceCard(),
              SizedBox(
                width: 6,
              ),
              TimeOffCard(),
              SizedBox(
                width: 6,
              ),
              MeetingsCard(),
              SizedBox(
                width: 6,
              ),
              PayRollCard(),
              SizedBox(
                width: 6,
              ),
              MedicalCard(),
              SizedBox(
                width: 6,
              ),
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Container(
        // width: MediaQuery.of(context).size.width - 26,
        //
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/dashboard_logo.png',
                          color: trueBlack,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Dashboard',
                          style: trueBlackTextStyle.copyWith(
                              fontSize: 20, fontWeight: semiBold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.only(top: 18),
                    child: Image.asset(
                      'assets/avatar.png',
                      height: 60,
                      width: 60,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                title(),
              ],
            ),
          ],
        ),
      );
    }

    Widget announce() {
      return Container(
        margin: EdgeInsets.only(bottom: 26, top: 10),
        width: MediaQuery.of(context).size.width * 0.91,
        // height: 140,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Announcement'),
                InkWell(
                  child: Text('see all'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnnouncePage()));
                  },
                )
              ],
            ),
            SizedBox(
              height: 6,
            ),
            AnnounceCard(),
            SizedBox(
              height: 7,
            ),
            AnnounceCard(),
          ],
        ),
      );
    }

    Widget attencance_history() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.91,
        margin: EdgeInsets.only(bottom: 2),
        // height: 195,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Attendance History'),
                InkWell(
                  child: Text('see all'),
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
            AttendCardIn(),
            SizedBox(
              height: 7,
            ),
            AttendCardOut(),
            SizedBox(
              height: 7,
            ),
            AttendCardIn(),
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
              menu(),
              attencance_history(),
              announce(),
            ],
          ),
        ),
      ),
    );
  }
}
