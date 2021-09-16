import 'package:absensi_project/theme.dart';
import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// /// This is the main application widget.
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: const Center(
//           child: MyStatelessWidget(),
//         ),
//       ),
//     );
//   }
// }

/// This is the stateless widget that the main application instantiates.
class MeetingDialog extends StatelessWidget {
  const MeetingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: blueShadow, width: 4)),
          title: Center(
            child: Column(
              children: [
                Container(
                  width: 140,
                  height: 20,
                  decoration: BoxDecoration(color: borderOrange),
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -7,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/meeting.png',
                              width: 36,
                              height: 36,
                            ),
                            SizedBox(width: 5),
                            Text('Meeting',
                                style: whiteTextStyle.copyWith(
                                    fontSize: 20, fontWeight: semiBold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('Company Meetings',
                      style: trueBlackTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('Posted by Admoon',
                      style: trueBlackTextStyle.copyWith(
                          fontSize: 16, fontWeight: light)),
                ),
              ],
            ),
          ),
          content: Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 180,
                    child: Text(
                        'So Guys jadi kita akan mengadakan Gathering pada: ',
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 12, fontWeight: light)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 180,
                    child: Text('Hari : ...',
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 12, fontWeight: light)),
                  ),
                  Container(
                    width: 180,
                    child: Text('Tanggal : ... ',
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 12, fontWeight: light)),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: 180,
                    child: Text('Diharapkan semua hadir ya',
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 12, fontWeight: light)),
                  ),
                  Container(
                    width: 180,
                    child: Text('Terima Kasih',
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 12, fontWeight: light)),
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: 180,
                    child: Text('Link',
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 12, fontWeight: light)),
                  ),
                  Container(
                    width: 225,
                    decoration: BoxDecoration(
                        color: notsoWhite,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('link disini ... ',
                              style: blackTextStyle.copyWith(
                                  fontSize: 12, fontWeight: reguler)),
                          Icon(Icons.copy),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: Text('Details',
          style: trueBlackTextStyle.copyWith(
              fontSize: 8 * 1.2,
              fontWeight: light,
              decoration: TextDecoration.underline)),
    );
  }
}

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: blueShadow, width: 4)),
          title: Center(
            child: Column(
              children: [
                Container(
                    child: Column(
                  children: [
                    Image.asset('assets/run.png', width: 46, height: 46)
                  ],
                )),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('Are You Sure to Logout?',
                      style: trueBlackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold)),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: blueShadow),
                    child: Center(
                      child: Wrap(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              'NO',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 14, fontWeight: medium),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: blueShadow.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Wrap(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              'YES',
                              style: blueTextStyle.copyWith(
                                  fontSize: 14, fontWeight: medium),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: borderPink),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Logout',
              style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            )
          ],
        ),
      ),
    );
  }
}
