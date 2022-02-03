import 'package:flutter/material.dart';
import 'package:absen_lite/theme.dart';

import 'package:absen_lite/widgets/guide_permission_table.dart';

class GuideVisiting extends StatelessWidget {
  const GuideVisiting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget panduan() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.75,
        margin: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Bagaimana Cara Melakukan Absen\nVisiting',
                    style: trueBlackTextStyle.copyWith(
                        fontSize: 16, fontWeight: bold)),
                // Image.asset('assets/question.png', width: 17, height: 17)
              ],
            ),
            const GuidePermissionTable(),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: AppBar(
            toolbarHeight: 120,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: trueBlack,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            backgroundColor: Colors.white,
            bottomOpacity: 0.0,
            elevation: 0.0,
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/guide2.png', width: 23, height: 23),
                  Text(
                    'Panduan',
                    style: trueBlackTextStyle,
                  )
                ],
              ),
            ),
            actions: const <Widget>[
              Image(image: AssetImage('assets/rounded.png')),
            ],
          ),
        ),
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // header(),
                panduan(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
