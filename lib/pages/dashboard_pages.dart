import 'package:absen_lite/pages/attendance_history_pages.dart';

import 'package:absen_lite/pages/visiting_list_pages.dart';
import 'package:absen_lite/providers/attendance_provider.dart';

import 'package:absen_lite/providers/visiting_all_provider.dart';
import 'package:absen_lite/theme.dart';
import 'package:absen_lite/widgets/clock_card.dart';
import 'package:absen_lite/widgets/loading_button.dart';
import 'package:absen_lite/widgets/menu_card.dart';

import 'package:absen_lite/widgets/visiting_card.dart';
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
  bool isLoading = false;
  String query = '';

  @override
  void initState() {
    attendanceHandler();
    getvisiting();
    // shophandle();

    super.initState();
  }

  Future attendanceHandler() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (await Provider.of<AttedanceProvider>(context, listen: false)
        .getAttendances(token)) setState(() {});
    setState(() {
      isLoading = false;
    });
  }

  Future getvisiting() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (await Provider.of<VisitingAllProvider>(context, listen: false)
        .getAllVisit(token)) if (!mounted) return;
    setState(() {});
    setState(() {
      isLoading = false;
    });
  }

  // shophandle() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var token = prefs.getString('token');
  //   final shops = await ShopService().getShops(token: token, query: query);
  // }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    AttedanceProvider attedanceProvider =
        Provider.of<AttedanceProvider>(context, listen: false);
    VisitingAllProvider visitingAllProvider =
        Provider.of<VisitingAllProvider>(context);

    List list = attedanceProvider.attendances.reversed.toList();
    List list2 = visitingAllProvider.showAll.reversed.toList();

    UserModel nick = authProvider.user;

    String? gambar = nick.photo;

    Widget nama() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 12, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
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
                )
              ],
            ),
          )
        ],
      );
    }

    Widget menu() {
      return RelativeBuilder(
        builder: (context, height, width, sy, sx) {
          return Container(
            margin: const EdgeInsets.only(top: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/header.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/dashboard_logo.png',
                        color: whiteColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Dashboard',
                        style: whiteTextStyle.copyWith(
                            fontSize: 22, fontWeight: semiBold),
                      ),
                    ],
                  ),
                  Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage("$gambar")))),
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
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: [
            Column(
              children: List.generate(2, (index) => ClockOutCard(list[index])),
            ),
          ],
        ),
      );
    }

    Widget visiting_list() {
      return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: [
            Column(
              children: List.generate(
                3,
                (index) => VisitingCard(list2[index]),
              ),
            ),
          ],
        ),
      );
    }

    Widget body() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.90,
        margin: const EdgeInsets.only(top: 20, bottom: 10),
        // transform: Matrix4.translationValues(0.0, -115.0, 0.0),
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
                            builder: (context) =>
                                const AttendanceHistoryPage()));
                    // attendanceHandler();
                  },
                )
              ],
            ),

            isLoading ? const LoadingDefault() : attencance_history(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Visiting List',
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
                            builder: (context) => const VisitingListPage()));
                  },
                )
              ],
            ),

            isLoading ? const LoadingDefault() : visiting_list(),
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
