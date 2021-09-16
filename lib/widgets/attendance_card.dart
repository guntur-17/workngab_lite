import 'package:absensi_project/theme.dart';
import 'package:absensi_project/widgets/clip_shadow.dart';
import 'package:flutter/material.dart';

class AttendCardIn extends StatelessWidget {
  const AttendCardIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipShadowPath(
      shadow: Shadow(blurRadius: 3, color: blueShadow, offset: Offset(0, 1)),
      clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
      child: Container(
        // width: 335,
        padding: EdgeInsets.only(left: 11, right: 25, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border(
            right: BorderSide(
              color: borderGreen,
              width: 9,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/avatar.png', width: 35, height: 35),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Fresa Mikhael',
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 10 * 1.2, fontWeight: reguler)),
                    Text('12-8-2021',
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 8 * 1.2, fontWeight: light)),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Image.asset('assets/line1.png', height: 40),
                SizedBox(width: 18),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Check in',
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 8 * 1.2, fontWeight: light)),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Image.asset('assets/clock.png', height: 11, width: 11),
                        SizedBox(
                          width: 2,
                        ),
                        Text('13:40',
                            style: trueBlackTextStyle.copyWith(
                                fontSize: 8 * 1.2, fontWeight: light)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AttendCardOut extends StatelessWidget {
  const AttendCardOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipShadowPath(
      shadow: Shadow(blurRadius: 3, color: blueShadow, offset: Offset(0, 1)),
      clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
      child: Container(
        // width: 335,
        padding: EdgeInsets.only(left: 11, right: 18, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border(
            right: BorderSide(
              color: borderPink,
              width: 9,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/avatar.png', width: 35, height: 35),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Fresa Mikhael',
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 10 * 1.2, fontWeight: reguler)),
                    Text('12-8-2021',
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 8 * 1.2, fontWeight: light)),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Image.asset('assets/line1.png', height: 40),
                SizedBox(width: 18),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Check out',
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 8 * 1.2, fontWeight: light)),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Image.asset('assets/clock.png', height: 11, width: 11),
                        SizedBox(
                          width: 2,
                        ),
                        Text('13:40',
                            style: trueBlackTextStyle.copyWith(
                                fontSize: 8 * 1.2, fontWeight: light)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
