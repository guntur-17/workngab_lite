import 'package:absen_lite/theme.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class ClockOutCard extends StatelessWidget {
  const ClockOutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return TextButton(
          style: TextButton.styleFrom(alignment: Alignment.centerRight),
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Center(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/clockOutsmol.png',
                              width: sx(60), height: sx(60)),
                          SizedBox(
                            width: 3,
                          ),
                          Text('Clock Out',
                              style: trueBlackTextStyle.copyWith(
                                  fontSize: 22, fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/minicalendar.png',
                              height: sx(14), width: sx(14)),
                          SizedBox(
                            width: 3,
                          ),
                          Text('Senin, 12 September 2021',
                              style: trueBlackTextStyle.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/clockblack.png',
                                  height: sx(14), width: sx(14)),
                              SizedBox(
                                width: 3,
                              ),
                              Text('17:00 WIB',
                                  style: trueBlackTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          Text('SUCCESS',
                              style: greenTextStyle.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w400))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          child: Container(
            width: sx(450),
            height: sy(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/clockOutbox.png',
                      width: sy(40),
                      height: sy(40),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Clock Out',
                            style: trueBlackTextStyle.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Text('12-8-2021 (19:30)',
                            style: trueBlackTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ],
                ),
                Image.asset(
                  'assets/rightButton.png',
                  width: sx(20),
                  height: sx(20),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ClockInCard extends StatelessWidget {
  const ClockInCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return TextButton(
          style: TextButton.styleFrom(
              // backgroundColor: blueColor,
              ),
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Center(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/clockInsmol.png',
                                width: sx(60), height: sx(60)),
                            SizedBox(
                              width: 3,
                            ),
                            Text('Clock In',
                                style: trueBlackTextStyle.copyWith(
                                    fontSize: 22, fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Image.asset('assets/minicalendar.png',
                                  height: sx(14), width: sx(14)),
                              SizedBox(
                                width: 3,
                              ),
                              Expanded(
                                child: Text(
                                  'Senin, 12 September 2021',
                                  style: trueBlackTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/clockblack.png',
                                      height: sx(14), width: sx(14)),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text('07:30 WIB',
                                      style: trueBlackTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                              Text('SUCCESS',
                                  style: greenTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          child: Container(
            width: sx(450),
            height: sy(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/clockInbox.png',
                      width: sy(40),
                      height: sy(40),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Clock In',
                            style: trueBlackTextStyle.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Text('12-8-2021 (19:30)',
                            style: trueBlackTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ],
                ),
                Image.asset(
                  'assets/rightButton.png',
                  width: sx(20),
                  height: sx(20),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
