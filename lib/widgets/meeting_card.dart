import 'package:absensi_project/theme.dart';
import 'package:absensi_project/widgets/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'dialog_box.dart';

class MeetingCard extends StatelessWidget {
  const MeetingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipShadowPath(
      shadow: Shadow(blurRadius: 3, color: blueShadow, offset: Offset(0, 1)),
      clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
      child: Container(
        // width: 335,
        height: 55,
        padding: EdgeInsets.only(left: 15, right: 25),
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border(
            right: BorderSide(
              color: borderOrange,
              width: 9,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/announce.png', width: 18, height: 18),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text('Company Meeting',
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 8 * 1.5, fontWeight: reguler)),
                    Text('Online Meeting',
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 8 * 1.2, fontWeight: light)),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 11),
                Text('12-08-2021',
                    style: trueBlackTextStyle.copyWith(
                        fontSize: 8 * 1.2, fontWeight: light)),
                SizedBox(height: 2),
                Text('14:40',
                    style: trueBlackTextStyle.copyWith(
                        fontSize: 8 * 1.2, fontWeight: light)),
              ],
            ),
            Row(
              children: [MeetingDialog()],
            ),
          ],
        ),
      ),
    );
  }
}
