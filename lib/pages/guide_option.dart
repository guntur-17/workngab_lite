import 'package:absen_lite/pages/guide_permission.dart';
import 'package:absen_lite/pages/guide_visiting.dart';
import 'package:absen_lite/widgets/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:absen_lite/theme.dart';

class GuideOption extends StatelessWidget {
  const GuideOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget absen2() {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GuidePermission()));
          },
          child: ClipShadowPath(
            shadow: Shadow(
                blurRadius: 3, color: blackColor, offset: const Offset(0, 1)),
            clipper: const ShapeBorderClipper(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)))),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.9,
              // margin: EdgeInsets.only(top: 10, ),
              // width: 335,
              padding:
                  const EdgeInsets.only(left: 11, right: 25, top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: whiteColor,
                border: Border(
                  left: BorderSide(
                    color: blueColor,
                    width: 9,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bagaimana cara melakukan absen?',
                    style:
                        blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                  ),
                  Image.asset(
                    'assets/rightButton.png',
                    width: 20,
                    height: 20,
                    color: blackColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget visit2() {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const GuideVisiting()));
          },
          child: ClipShadowPath(
            shadow: Shadow(
                blurRadius: 3, color: blackColor, offset: const Offset(0, 1)),
            clipper: const ShapeBorderClipper(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)))),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.9,
              padding:
                  const EdgeInsets.only(left: 11, right: 25, top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: whiteColor,
                border: Border(
                  left: BorderSide(
                    color: blueColor,
                    width: 9,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bagaimana cara melakukan absen\nkunjungan?',
                    style:
                        blackTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                  ),
                  Image.asset(
                    'assets/rightButton.png',
                    width: 20,
                    height: 20,
                    color: blackColor,
                  ),
                ],
              ),
            ),
          ),
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
              children: [absen2(), visit2()],
            ),
          ),
        ),
      ),
    );
  }
}
