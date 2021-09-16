import 'package:flutter/material.dart';
import 'package:absensi_project/theme.dart';
import 'package:absensi_project/widgets/hour_card.dart';

class ClockOutPage extends StatelessWidget {
  const ClockOutPage({Key? key}) : super(key: key);

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
                        Image.asset(
                          'assets/back.png',
                          width: 35,
                          height: 35,
                        ),
                        SizedBox(
                          width: 95,
                        ),
                        Text(
                          'Attendance ',
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                      ],
                    ),
                    // child: Container(
                    //   child: Row(
                    //     children: [
                    //       Image.asset(
                    //         'assets/back.png',
                    //         width: 35,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ),
                  // SizedBox(
                  //   width: 91,
                  // ),
                  // Text(
                  //   'Dashboard',
                  //   style: trueBlackTextStyle.copyWith(
                  //       fontSize: 20, fontWeight: semiBold),
                  // ),
                  Container(
                    // margin: EdgeInsets.only(top: 18),
                    child: Image.asset(
                      'assets/rounded.png',
                      // height: 150,
                      width: 130,
                    ),
                  ),
                ],
              ),
            ),
            // Column(
            //   children: [
            //     title(),
            //   ],
            // ),
          ],
        ),
      );
      // return Positioned(
      //   top: 0,
      //   left: MediaQuery.of(context).size.width * 0.65,
      //   child: Container(
      //     child: Column(
      //       children: [
      //         Image.asset(
      //           'assets/rounded.png',
      //           width: 150,
      //         )
      //       ],
      //     ),
      //   ),
      // );

      // return Container(
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.end,
      //     children: [
      //       Stack(
      //         children: [
      //           Positioned(
      //             top: 2,
      //             left: MediaQuery.of(context).size.width * 0.65,
      //             child: Image.asset(
      //               'assets/rounded.png',
      //             ),
      //           )
      //         ],
      //       ),
      //     ],
      //   ),
      // );
    }

    Widget day() {
      return Container(
        margin: EdgeInsets.only(top: 117),
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '07:30',
                  style: blackTextStyle.copyWith(
                      fontSize: 28, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Senin, 12 Maret 2021',
                  style:
                      greyTextStyle.copyWith(fontSize: 18, fontWeight: reguler),
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget tap() {
      return Container(
        margin: EdgeInsets.only(top: 220),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/clockOut.png',
                width: 160,
                height: 160,
              ),
            ),
          ],
        ),
      );
    }

    Widget location() {
      return Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 410),
              width: MediaQuery.of(context).size.width * 0.6,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: lightgreyColor),
              //isi dari kotak berupa location
              child: Column(),
            ),
          ),
        ],
      );
    }

    Widget clock() {
      return Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 480),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [HourCard(), ClockOut(), FullHour()],
              ),
            ),
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [header(), day(), tap(), location(), clock()],
        ),
      ),
    );
  }
}
