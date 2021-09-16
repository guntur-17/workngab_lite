import 'package:flutter/material.dart';
import 'package:absensi_project/theme.dart';
import 'package:absensi_project/widgets/payroll_card.dart';
import 'package:absensi_project/widgets/guide_permission_table.dart';

class GuidePermission extends StatelessWidget {
  const GuidePermission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 57),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/back.png',
                            width: 26,
                            height: 26,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 57),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15,
                          ),
                          Image.asset('assets/guide2.png',
                              width: 18, height: 18),
                          SizedBox(width: 8),
                          Text(
                            'Panduan',
                            style: blackTextStyle.copyWith(
                                fontSize: 20, fontWeight: semiBold),
                          ),
                        ],
                      )),
                  Container(
                    child: Image.asset(
                      'assets/rounded.png',
                      width: 130,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget panduan() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.75,
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Row(
              children: [
                Text('Bagaimana Cara Melakukan Izin',
                    style: trueBlackTextStyle.copyWith(
                        fontSize: 16, fontWeight: bold)),
                Image.asset('assets/question.png', width: 17, height: 17)
              ],
            ),
            GuidePermissionTable(),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              panduan(),
            ],
          ),
        ),
      ),
    );
  }
}
