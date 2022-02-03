import 'package:absen_lite/pages/clockin_pages.dart';
import 'package:absen_lite/pages/visiting_pages.dart';
import 'package:absen_lite/theme.dart';

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ClockInPage(),
            ),
          );
        },
        child: Container(
          // padding: EdgeInsets.all(25),
          height: sx(223),
          width: sx(223),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: whiteColor,
            border: Border.all(color: whiteColor, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset(
                    'assets/attendance.png',
                  ),
                  iconSize: 66,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ClockInPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Attendance',
                  style: trueBlackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class VisitCard extends StatelessWidget {
  const VisitCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const VisitingPage(),
              ),
            );
          },
          child: Container(
            // padding: EdgeInsets.all(30),
            height: sx(223),
            width: sx(223),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: whiteColor,
              border: Border.all(color: whiteColor, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset(
                      'assets/map.png',
                    ),
                    iconSize: 66,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VisitingPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Visiting',
                    style: trueBlackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
