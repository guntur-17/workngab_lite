import 'package:flutter/material.dart';
import 'package:absensi_project/theme.dart';
import 'package:absensi_project/widgets/payroll_card.dart';

class PayrollPages extends StatelessWidget {
  const PayrollPages({Key? key}) : super(key: key);

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
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Text(
                            'Payroll',
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

    Widget filter() {
      return Container(
        margin: EdgeInsets.only(top: 15, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              child: Image.asset(
                'assets/filter.png',
                width: 105,
                height: 30,
              ),
            ),
          ],
        ),
      );
    }

    Widget list() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: [
            PayrollCard(),
            PayrollCard(),
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
              filter(),
              list(),
            ],
          ),
        ),
      ),
    );
  }
}
