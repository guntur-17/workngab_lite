import 'package:absen_lite/pages/dashboard_pages.dart';
import 'package:absen_lite/pages/home.dart';
import 'package:absen_lite/providers/attendance_provider.dart';
import 'package:absen_lite/providers/auth_provider.dart';
import 'package:absen_lite/providers/visiting_all_provider.dart';
import 'package:absen_lite/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:absen_lite/theme.dart';
import 'package:provider/provider.dart';
import 'package:relative_scale/relative_scale.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool hiddenPassword = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    Route route = MaterialPageRoute(builder: (context) => HomePage());

    handleLogin() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
          username: usernameController.text,
          password: passwordController.text)) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString('username', authProvider.user.username as String);
        // prefs.setString('password', passwordController.text);
        prefs.setString('token', authProvider.user.access_token as String);

        var token = prefs.getString('token');
        await Provider.of<VisitingAllProvider>(context, listen: false)
            .getAllVisit(token);
        Navigator.pushReplacement(context, route);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: redColor,
            content: Text(
              'Anda Gagal Login',
              textAlign: TextAlign.center,
            )));
      }
      setState(() {
        isLoading = false;
      });
      //perubahan
    }

    Widget header() {
      return RelativeBuilder(
        builder: (context, height, width, sy, sx) {
          return Container(
            // width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.only(right: 78, top: 115, left: 78),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/headerLogo.png',
                  width: sy(182),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget logo() {
      return RelativeBuilder(
        builder: (context, height, width, sy, sx) {
          return Container(
            // width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 155),
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
                    'assets/signIn2.png',
                    width: sy(259),
                    height: sy(120),
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    Widget text() {
      return Container(
        // margin: EdgeInsets.only(left: 26),
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
      return RelativeBuilder(builder: (context, height, width, sy, sx) {
        return Container(
          // margin: EdgeInsets.only(top: 380),
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              //username
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    hintText: 'username',
                    prefixIcon: Icon(Icons.account_circle_outlined)),
              ),
              SizedBox(
                height: 10,
              ),
              //password
              TextField(
                controller: passwordController,
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
      });
    }

    Widget button() {
      return Center(
        child: Container(
          // margin: EdgeInsets.only(top: 590),
          width: 315,
          height: 57,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: blueColor),
          child: InkWell(
            onTap: handleLogin,
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

    Widget body() {
      return Container(
        child: Column(
          children: [
            logo(),
            // setlogo(),
            text(),
            input(),
            isLoading ? LoadingButton() : button(),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [header(), body()],
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
