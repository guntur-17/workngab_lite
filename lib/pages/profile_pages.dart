import 'package:flutter/material.dart';
import 'package:absensi_project/theme.dart';
import 'package:absensi_project/widgets/option_card.dart';
import 'package:absensi_project/widgets/dialog_box.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget head() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          width: MediaQuery.of(context).size.width - 40,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                width: 70,
                height: 83,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/ava.png',
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Farino Joshua',
                    style:
                        blackTextStyle.copyWith(fontSize: 18, fontWeight: bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'CEO',
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: reguler),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget line() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Image.asset('assets/line.png'),
      );
    }

    Widget menu() {
      return Container(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            UserCard(),
            SizedBox(
              height: 22,
            ),
            SettingCard(),
            SizedBox(
              height: 22,
            ),
            GuideCard(),
            SizedBox(
              height: 22,
            ),
            AboutCard(),
          ],
        ),
      );
    }

    Widget line2() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Image.asset('assets/line.png'),
      );
    }

    Widget button() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          width: MediaQuery.of(context).size.width * 0.9,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: borderPink),
          child: InkWell(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Logout',
                  style:
                      whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                )
              ],
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Column(
          children: [head(), line(), menu(), line2(), LogoutDialog()],
        ),
      ),
    );
  }
}
