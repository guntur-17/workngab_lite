import 'package:absensi_project/pages/dashboard_pages.dart';
import 'package:absensi_project/pages/home.dart';
import 'package:flutter/material.dart';

import 'package:absensi_project/theme.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        // width: MediaQuery.of(context).size.width,
        // margin: EdgeInsets.only(right: 78, top: 115, left: 78),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: [
            // Align(
            //   child: Image.asset(
            //     'assets/round2.png',
            //     // width: 342,
            //     // height: 2,
            //   ),
            // ),
            Image.asset(
              'assets/headerLogo.png',
              // width: 342,
              // height: 2,
            ),
          ],
        ),
      );
    }

    Widget logo() {
      return Container(
        // width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 195),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            children: [
              // Align(
              //   child: Image.asset(
              //     'assets/logo.png',
              //     width: 259,
              //     height: 174,
              //   ),
              // )
              Image.asset(
                'assets/signIn.png',
                width: 259,
                height: 174,
              )
            ],
          ),
        ),
      );
    }

    // Widget setlogo() {
    //   return Container(
    //     width: MediaQuery.of(context).size.width,
    //     child: Column(
    //       children: [
    //         header(),
    //         logo(),
    //       ],
    //     ),
    //   );
    // }

    Widget text() {
      return Container(
        margin: EdgeInsets.only(top: 388, left: 26),
        child: Column(
          children: [
            Text(
              'Login',
              style:
                  blackTextStyle.copyWith(fontSize: 26, fontWeight: semiBold),
            )
          ],
        ),
      );
    }

    Widget input() {
      return Container(
        margin: EdgeInsets.only(top: 410),
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            //username
            TextField(
              decoration: InputDecoration(
                  hintText: 'username',
                  prefixIcon: Icon(Icons.account_circle_outlined)),
            ),
            SizedBox(
              height: 10,
            ),
            //password
            TextField(
              obscureText: hiddenPassword,
              decoration: InputDecoration(
                  hintText: 'password',
                  prefixIcon: Icon(Icons.lock_outline_sharp),
                  suffixIcon: InkWell(
                      onTap: _tooglePasswordView,
                      child: Icon(Icons.visibility))),
            ),
          ],
        ),
      );
    }

    Widget button() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 590),
          width: 315,
          height: 57,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: blueColor),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style:
                      whiteTextStyle.copyWith(fontSize: 20, fontWeight: medium),
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
        body: SingleChildScrollView(
          child: Stack(
            children: [
              header(),
              logo(),
              // setlogo(),
              text(),
              input(),
              button(),
            ],
          ),
        ),
      ),
    );
  }

  void _tooglePasswordView() {
    if (hiddenPassword == true) {
      hiddenPassword = false;
    } else {
      hiddenPassword = true;
    }

    setState(() {});
  }
}
